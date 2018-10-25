package com.geekcattle.controller.console;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.geekcattle.service.console.RipsServiceInterface;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.geekcattle.mapper.console.BindingMapper;
import com.geekcattle.mapper.console.RipsMapper;
import com.geekcattle.model.console.MtdConfig;
import com.geekcattle.model.console.Binding;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.console.Rips;
import com.geekcattle.model.console.Switches;
import com.geekcattle.model.console.TopologySwitchData;
import com.geekcattle.model.console.TopologySwitchData.Node;
import com.geekcattle.model.console.MTD;
import com.geekcattle.service.console.BindingService;
import com.geekcattle.service.console.RipsService;
import com.geekcattle.service.console.SwitchService;
import com.geekcattle.util.DateUtil;
import com.geekcattle.util.ReturnUtil;
import com.geekcattle.util.UuidUtil;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class IPConfigurationController {
    @Autowired
    private BindingService bindService;
    @Autowired
    private RipsServiceInterface ripsService;
    @Autowired
    private RipsMapper ripsMapper;
    @Autowired
    private BindingMapper bindMapper;
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private SwitchService switchService;
    
    public int NameCheck(String text) {//名字输入校验
        if (text != null && text.length() > 0) {
        	String regex = "^[A-Za-z][A-Za-z1-9_-]+$";
            if (text.matches(regex)) 
                return 1;//名字输入无误
            else 
                return 2;//名字输入不符合要求
        }
        return 3;//名字为空
    }
    
	private String getBasicAuthStr(String name,String password){
        return "Basic " + Base64.getEncoder().encodeToString((name + ":" + password).getBytes());
    }
	
    public int IPCheck(String text) {//IP输入校验
        if (text != null && text.length() > 0) {// 定义正则表达式
            String regex = "^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";
            if (text.matches(regex)) {// 判断 IP 地址是否与正则表达式匹配
                return 1;//IP输入符合要求
            } else {
                return 2;//IP输入不符合要求
            }
        }
        return 3;//IP输入为空
    }

    /**
     * 点击菜单，先走这里
     * @param dns
     * @param rip
     * @param bind
     * @param model
     * @param switches_in
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/admin/function/init", method = {RequestMethod.GET})
    public String Initial(MtdConfig dns,Rips rip,Binding bind,Model model,Switches switches_in,HttpSession httpSession) {
    	String url = "http://192.168.125.183:8181/restconf/config/dip-config:mtd-config";//获取交换机之间的链路信息
        String username = "admin";
        String password = "admin";
    	HttpRequest.setBasicAuth(getBasicAuthStr(username,password));
    	String mtd_data;
    	MTD mtd = null;
    	try {
        	mtd_data = HttpRequest.sendGet(url,"");  
            Gson gson = new Gson();	
            java.lang.reflect.Type type = new TypeToken<MTD>() {}.getType();
            mtd = gson.fromJson(mtd_data, type); 
    	}catch (Exception e) {
        }
        if(mtd == null || (mtd.getMTDConfig().getIsMtdMode() != true)) {
        	HttpRequest.setBasicAuth(getBasicAuthStr(username,password));
        	String url_switch = "http://192.168.125.183:8181/restconf/operational/opendaylight-inventory:nodes";//获取主机信息以及主机与交换机之间的链路信息
            String str_switchData = HttpRequest.sendGet(url_switch,"");    
            
    		String url_delete_mtdConfig = "http://192.168.125.183:8181/restconf/config/dip-config:mtd-config";
    		String url_delete_subnets = "http://192.168.125.183:8181/restconf/config/dip-config:subnets";
    		String url_delete_binding = "http://192.168.125.183:8181/restconf/config/dip-config:binding";
    		
            String auth = getBasicAuthStr(username,password);
            MultiValueMap<String,String> headers = new LinkedMultiValueMap<String,String>();
            headers.add("Accept", "application/json");
            headers.add("Authorization", auth);
            HttpEntity<Object> requestEntity = new HttpEntity<Object>(headers);
    		RestTemplate rest = new RestTemplate();
    		try {
        		rest.exchange(url_delete_mtdConfig,HttpMethod.DELETE,requestEntity,String.class);
    		}catch (Exception e) {
            }
    		try {
    			rest.exchange(url_delete_subnets,HttpMethod.DELETE,requestEntity,String.class);           
    		}catch (Exception e) {
            }
    		try {
    			rest.exchange(url_delete_binding,HttpMethod.DELETE,requestEntity,String.class);   
    		}catch (Exception e) {
            }
        	switchService.deleteAll();
            Gson gson_switch = new Gson();	
            java.lang.reflect.Type type_switch = new TypeToken<TopologySwitchData>() {}.getType();
            TopologySwitchData switchData = gson_switch.fromJson(str_switchData, type_switch);    
            if (switchData == null)
            	System.out.println("没有获取到交换机信息！");
            List<Node> listSwitchNodes = null;
            try {
            	listSwitchNodes = switchData.getNodes().getNode();     
            }catch(Exception e) {
            	
            }
            if (listSwitchNodes == null)
            	System.out.println("没有交换机可以配置");
            for(Node switchNodes : listSwitchNodes) {
                Switches switches = new Switches();
                String Id = UuidUtil.getUUID();
                switches.setId(Id);
                switches.setName(switchNodes.getId());
                switches.setCreateTime(DateUtil.getCurrentTime());
                switchService.insert(switches);
            }
        	dns.setOpenExternal(true); 
            model.addAttribute("dns", dns);
            model.addAttribute("rip",rip);           
            model.addAttribute("binding",bind);
            List<Rips> listSubnet = ripsService.getPageList(rip);
            //真实子网信息
            httpSession.setAttribute("listSubnet",listSubnet);
            List<Switches> listSwitch = switchService.getPageList(switches_in);
            //交换机信息
            httpSession.setAttribute("listSwitch",listSwitch);
        	return "/admin/function/init";
        }
        else {
        	dns.setDnsAddress(mtd.getMTDConfig().getDnsAddress());
        	dns.setDnsForwardAddress(mtd.getMTDConfig().getDnsForwardAddress());
        	dns.setExternalAddress(mtd.getMTDConfig().getExternalAddress());
        	dns.setExternalGateway(mtd.getMTDConfig().getExternalGateway());
        	dns.setExternalSwitch(mtd.getMTDConfig().getExternalSwitch());
        	dns.setExternalSwitchPort(mtd.getMTDConfig().getExternalSwitchPort());
            model.addAttribute("dns", dns);
    		return "/admin/function/display";
        }
    }


    /**
     * 配置完成，向odl发送请求
     * @param mtd
     * @param result
     * @return
     */
	@Transactional
	@RequestMapping(value = "/admin/function/init", method = {RequestMethod.POST})
	@ResponseBody
	public ModelMap Init(MtdConfig mtd, BindingResult result) {
        try {
            if (result.hasErrors()) {
            	for (ObjectError er : result.getAllErrors())
            		return ReturnUtil.Error(er.getDefaultMessage(), null, null);
            }    
        	System.out.println("init");
        	String url_mtd = "http://192.168.125.183:8181/restconf/config/dip-config:mtd-config";
        	String url_subnets = "http://192.168.125.183:8181/restconf/config/dip-config:subnets";
        	String url_binding = "http://192.168.125.183:8181/restconf/config/dip-config:binding";    
            String username = "admin";
            String password = "admin";
            String auth = getBasicAuthStr(username,password);
            MultiValueMap<String,String> headers = new LinkedMultiValueMap<String,String>();
            headers.add("Accept", "application/json");
            headers.add("Authorization", auth);

            /*配置MTD*/
            Map<String,Object>mtd_json = new HashMap<String,Object>();
            Map<String,Object>mtd_config = new HashMap<String,Object>();
            mtd_config.put("is-mtd-mode", true);     
            mtd_config.put("dns-address", mtd.getDnsAddress());
            mtd_config.put("open-external", mtd.getOpenExternal());
            if(mtd.getOpenExternal() == true) {
            	mtd_config.put("dns-forward-address", mtd.getDnsForwardAddress());
            	mtd_config.put("external-switch-port", mtd.getExternalSwitchPort());
            	mtd_config.put("external-switch", mtd.getExternalSwitch());
            	mtd_config.put("external-address",mtd.getExternalAddress());
            	mtd_config.put("external-gateway",mtd.getExternalGateway());
            }
            mtd_json.put("mtd-config", mtd_config); 
            HttpEntity<Object> requestEntity = new HttpEntity<Object>(mtd_json,headers);
            System.out.println(mtd_json);
            //restTemplate.put(url_mtd, requestEntity, String.class);
            restTemplate.exchange(url_mtd,HttpMethod.PUT,requestEntity,String.class);
            System.out.println("mtd");
            
            /*配置subnet*/
            Map<String,Object>subnet_json = new HashMap<String,Object>();
            Map<String,Object>ipConf = new HashMap<String,Object>();
    		List<Map> ipConfList = new ArrayList<>();
    		List<Rips> ipList = ripsMapper.selectAllRips();
            for (Rips list_rip : ipList) {
                Map<String,Object>ipConfData = new HashMap<String,Object>();
                list_rip.integer2IPV4_endIp();
                list_rip.integer2IPV4_startIp();
                ipConfData.put("rips-id", list_rip.getId());
                ipConfData.put("gateway", list_rip.getGateway());
                ipConfData.put("ip-global-period", list_rip.getPeriod());   
                ipConfData.put("domain-period", list_rip.getDomainPeriod()); 
                ipConfData.put("virtual-ip-period", list_rip.getVirtualPeriod());  
                ipConfData.put("start-ip", list_rip.getStartIpString());   
                ipConfData.put("end-ip", list_rip.getEndIpString());
                ipConfData.put("domain-prefix", list_rip.getPrefix());
                ipConfList.add(ipConfData);
            }
            ipConf.put("ip-conf", ipConfList);
            subnet_json.put("subnets", ipConf);
            HttpEntity<Object> requestEntity_subnet = new HttpEntity<Object>(subnet_json,headers);
            restTemplate.exchange(url_subnets,HttpMethod.PUT,requestEntity_subnet,String.class);
            System.out.println("subnet");
            /*配置binding*/
            Map<String,Object>binding_json = new HashMap<String,Object>();
            Map<String,Object>bindingConf = new HashMap<String,Object>();
    		List<Map> bindingConfList = new ArrayList<>();
    		List<Binding> bindList = bindMapper.selectAllBindings();
            for (Binding list_bind : bindList) {
                Map<String,Object>bindConfData = new HashMap<String,Object>();
                bindConfData.put("node", list_bind.getNode());
                String subnetId = ripsMapper.selectByname(list_bind.getSubnet()).getId();
                bindConfData.put("subnet", subnetId);
                bindingConfList.add(bindConfData);
            }
            bindingConf.put("address-binding", bindingConfList);
            binding_json.put("binding", bindingConf);
            HttpEntity<Object> requestEntity_binding = new HttpEntity<Object>(binding_json,headers);
            restTemplate.exchange(url_binding,HttpMethod.PUT,requestEntity_binding,String.class);       
            System.out.println("binding");
            return ReturnUtil.Success("操作成功", null, "/admin/function/init");
        } catch (Exception e) {
            e.printStackTrace();
        	System.out.println("error!");
            return ReturnUtil.Error("操作失败", null, "/admin/function/init");
        }
	}
    
	@Transactional
	@RequestMapping(value = "/admin/function/closeMtd", method = {RequestMethod.POST})
	@ResponseBody
	public ModelMap CloseMtd() {
        String username = "admin";
        String password = "admin";
    	HttpRequest.setBasicAuth(getBasicAuthStr(username,password));
		String url_delete_mtdConfig = "http://192.168.125.183:8181/restconf/config/dip-config:mtd-config";
		String url_delete_subnets = "http://192.168.125.183:8181/restconf/config/dip-config:subnets";
		String url_delete_binding = "http://192.168.125.183:8181/restconf/config/dip-config:binding";
		
        String auth = getBasicAuthStr(username,password);
        MultiValueMap<String,String> headers = new LinkedMultiValueMap<String,String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        HttpEntity<Object> requestEntity = new HttpEntity<Object>(headers);
		RestTemplate rest = new RestTemplate();
		try {
    		rest.exchange(url_delete_mtdConfig,HttpMethod.DELETE,requestEntity,String.class);
		}catch (Exception e) {
            e.printStackTrace();
        }
		try {
			rest.exchange(url_delete_subnets,HttpMethod.DELETE,requestEntity,String.class);           
		}catch (Exception e) {
            e.printStackTrace();
        }
		try {
			rest.exchange(url_delete_binding,HttpMethod.DELETE,requestEntity,String.class);   
		}catch (Exception e) {
            e.printStackTrace();
        }
        return ReturnUtil.Success("操作成功", null, "/admin/function/init");
        /*
		try {
	        Map<String,Object>mtd_json = new HashMap<String,Object>();
	        Map<String,Object>mtd_config = new HashMap<String,Object>();
	        mtd_config.put("is-mtd-mode", false);     
            mtd_json.put("mtd-config", mtd_config); 
	        HttpEntity<Object> requestEntity_close = new HttpEntity<Object>(mtd_json,headers);
	        restTemplate.exchange(url_delete_mtdConfig,HttpMethod.PUT,requestEntity_close,String.class);
            return ReturnUtil.Success("操作成功", null, "/admin/function/init");
		} catch (Exception e) {
            e.printStackTrace();
            return ReturnUtil.Error("操作失败", null, null);
        }*/
	}
	
	//单击菜单真实IP配置，跳转至此
    @RequestMapping(value = "/admin/function/rip", method = {RequestMethod.GET})
    public String index(Model model) {
        return "/admin/function/rip";
    }
    
    //添加真实网络
    @RequestMapping(value = "/admin/function/add_rip", method = {RequestMethod.GET})
    public String AddRip(Rips network, Model model) {
        model.addAttribute("network", network);
        return "admin/function/add_rip";
    }
    
    //添加绑定列表
    @RequestMapping(value = "/admin/function/add_binding", method = {RequestMethod.GET})
    public String AddBinding(Switches switches, Rips rips, Binding bind, Model model,HttpSession httpSession) {
        model.addAttribute("binding", bind);
        List<Rips> listSubnet = ripsService.getPageList(rips);
        httpSession.setAttribute("listSubnet",listSubnet);
        List<Switches> listSwitch = switchService.getPageList(switches);
        httpSession.setAttribute("listSwitch",listSwitch);
        return "admin/function/add_binding";
    }

    /**
     * 绑定过的交换机的列表展示
     * @param bind
     * @return
     */
    @RequestMapping(value = "/admin/function/bindingList", method = {RequestMethod.GET})
    @ResponseBody
    public ModelMap bindingList(Binding bind) {
        ModelMap map = new ModelMap();
        List<Binding> Lists = bindService.getPageList(bind);
        System.out.println(Lists.size());
       	map.put("queryParam", bind);
        map.put("pageInfo", new PageInfo<Binding>(Lists));
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * 真实子网列表
     * @param rip
     * @return
     */
    @RequestMapping(value = "/admin/function/ripList", method = {RequestMethod.GET})
    @ResponseBody
    public ModelMap ripList(Rips rip) {
        ModelMap map = new ModelMap();
        List<Rips> Lists = ripsService.getPageList(rip);
        for (Rips list : Lists) {
            list.integer2IPV4_startIp();
            list.integer2IPV4_endIp();
        }
       	map.put("queryParam", rip);
        map.put("pageInfo", new PageInfo<Rips>(Lists));
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * 给真实子网添加交换机
     * @param bind
     * @param result
     * @return
     */
    @Transactional
    @RequestMapping(value = "/admin/function/bindingSave", method = {RequestMethod.POST})
    @ResponseBody
    public ModelMap BindingSave(@Valid Binding bind, BindingResult result) {
            if (result.hasErrors()) {
                for (ObjectError er : result.getAllErrors())
                    return ReturnUtil.Error(er.getDefaultMessage(), null, null);
            }
            String Id = UuidUtil.getUUID();
            bind.setId(Id);   
            bind.setSubnet(bind.getSubnet());
            bind.setNode(bind.getNode());
            bind.setCreateTime(DateUtil.getCurrentTime());
            if(bind.getNode().equals("请选择交换机")) {
            	return  ReturnUtil.Error("请选择需要绑定真实子网的交换机", null, null);
            }
            if(bind.getSubnet().equals("请选择网络")) {
            	return  ReturnUtil.Error("请选择真实子网", null, null);
            }
            Integer nodeCount = bindService.getCountByNode(bind.getNode());
            if(nodeCount>0) {
            	return  ReturnUtil.Error("一台交换机只能加入一个真实子网！", null, null);
            }
            bindService.insert(bind);
            return ReturnUtil.Success("操作成功", null, "/admin/function/init");
    }

    /**
     * 保存真实子网
     * @param rips
     * @param result
     * @return
     */
    @Transactional
    @RequestMapping(value = "/admin/function/ripSave", method = {RequestMethod.POST})
    @ResponseBody
    public ModelMap RipsSave(@Valid Rips rips, BindingResult result) {
            try {
	    		if (result.hasErrors()) {
	            	for (ObjectError er : result.getAllErrors())
	            		return ReturnUtil.Error(er.getDefaultMessage(), null, null);
	    		}
	            Integer netCount = ripsService.getCountByNet(rips.getNet());
	            if(netCount>0) {
	            	return  ReturnUtil.Error("网络名称重复！", null, null);
	            }
                rips.IPV42Integer_startIp(rips.getStartIpString());
                rips.IPV42Integer_endIp(rips.getEndIpString());	
                if((rips.getEndIp()-rips.getStartIp())<= 0){
                 	return ReturnUtil.Error("结束地址IP必须大于起始地址IP！", null, null);
                }    	
	           	String Id = UuidUtil.getUUID();
	            rips.setId(Id);
	            rips.setNet(rips.getNet());
	            rips.setVirtualPeriod(rips.getVirtualPeriod());
	            rips.setGateway(rips.getGateway());
	            String rips_start_str = rips.getStartIpString();
	            String rips_end_str = rips.getEndIpString();
	            rips.IPV42Integer_startIp(rips_start_str);
	            rips.IPV42Integer_endIp(rips_end_str);       
	            rips.setCreateTime(DateUtil.getCurrentTime());
	            System.out.println("test="+rips.getVirtualPeriod());
	            
	            ripsService.insert(rips);
	            return ReturnUtil.Success("操作成功", null, "/admin/function/init");
            }catch (Exception e) {
                e.printStackTrace();
                return ReturnUtil.Error("操作失败", null, null);
            }
    }

    /**
     * 真实子网删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/admin/function/ripDelete", method = {RequestMethod.GET})
    @ResponseBody
    public ModelMap ripsDelete(String[] ids) {  //真实网络删除函数
        try {
            if (ids != null) {
                if (StringUtils.isNotBlank(ids.toString())) {
                    for (String id : ids) {
                        ripsService.deleteById(id);
                    }
                }
                return ReturnUtil.Success("删除成功", null, null);
            } else {
                return ReturnUtil.Error("删除失败", null, null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ReturnUtil.Error("删除失败", null, null);
        }
    }
    
    @RequestMapping(value = "/admin/function/bindingDelete", method = {RequestMethod.GET})
    @ResponseBody
    public ModelMap bindingDelete(String[] ids) {  //真实网络删除函数
        try {
            if (ids != null) {
                if (StringUtils.isNotBlank(ids.toString())) {
                    for (String id : ids) {
                        bindService.deleteById(id);
                    }
                }
                return ReturnUtil.Success("删除成功", null, null);
            } else {
                return ReturnUtil.Error("删除失败", null, null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ReturnUtil.Error("删除失败", null, null);
        }
    }
}