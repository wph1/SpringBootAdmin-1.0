package com.geekcattle.service.console;

import java.text.SimpleDateFormat;
import java.util.*;

import com.geekcattle.mapper.console.BindingMapper;
import com.geekcattle.model.console.Binding;
import com.geekcattle.util.RestTemplateUtils;
import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

import com.geekcattle.mapper.console.RipsMapper;
import com.geekcattle.model.console.Rips;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import tk.mybatis.mapper.entity.Example;

@Service
public class RipsService implements RipsServiceInterface{
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private RipsMapper networkMapper;
    @Autowired
    private RestTemplate restTemplate;
    @Value("${ripSubnetUrl}")
    private String ripSubnetUrl;
    @Value("${odlIpAndPort}")
    private String odlIpAndPort;

    @Value("${bindSwitchUrl}")
    private String bindSwitchUrl;

    @Autowired
    private BindingMapper bindingMapper;

    public List<Rips> getPageList(Rips network) {
        PageHelper.offsetPage(network.getOffset(), network.getLimit(), CamelCaseUtil.toUnderlineName(network.getSort())+" "+network.getOrder());
        return networkMapper.selectAllRips();
    }

    public Integer getCount(Example example){
        return networkMapper.selectCountByExample(example);
    }
    
    public Integer getCountByNet(String input) {
    	return networkMapper.selectCountByNet(input);
    }

    public Rips getById(String id) {
        return networkMapper.selectByPrimaryKey(id);
    }

    public Rips findByname(String netname) {
        return networkMapper.selectByname(netname);
    }
    
    public Rips findById(String id) {
        return networkMapper.findById(id);
    }

    public void deleteById(String id) {
    	networkMapper.deleteById(id);
    }

    /**
     * 删除真实子网，并向odl发送请求
     * @param idList
     */
    @Override
    @Transactional
    public void deleteByIdAndOdl(String[] idList) {
        for (String id : idList) {
            Rips rip= networkMapper.selectByPrimaryKey(id);
            networkMapper.deleteById(id);
            logger.info("====>删除rips中的数据，id="+id);
            Map<String, Object> subnetMap = new HashMap<String, Object>();
            Map<String, Object> ipConf = new HashMap<String, Object>();
            Map<String, Object> ipConfData = new HashMap<String, Object>();
            List<Map> ipConfList = new ArrayList<>();
            ipConfData.put("rips-id", rip.getNet());
            ipConfList.add(ipConfData);
            ipConf.put("ip-conf", ipConfList);
            subnetMap.put("subnets", ipConf);
            String responseStr = (String)  RestTemplateUtils.sendUrl(restTemplate,odlIpAndPort+ripSubnetUrl, HttpMethod.PUT,subnetMap);
            logger.info("====>向odl发送删除rips命令完成,子网名称="+rip.getNet());
        }
    }


    public void insert(Rips net){
    	networkMapper.insertRips(net);
    }

    /**
     * 保存真实ip,并发送odl远程指令
     * @param
     */
    @Override
    @Transactional
    public void insertAndSendOdl(Rips rips) {
        networkMapper.insertRips(rips);
        logger.info("====>保存rips成功");
        logger.info("====>向odl发送保存rips命令");
        //odl添加子网
        Map<String, Object> subnetMap = new HashMap<String, Object>();
        Map<String, Object> ipConf = new HashMap<String, Object>();
        Map<String, Object> ipConfData = new HashMap<String, Object>();
        List<Map> ipConfList = new ArrayList<>();
        //子网id
        ipConfData.put("rips-id", rips.getNet());
        //内网网关地址
        ipConfData.put("gateway", rips.getGateway());
        //真实ip周期
        ipConfData.put("ip-global-period",rips.getPeriod());
        //域名周期
        ipConfData.put("domain-period", rips.getDomainPeriod());
        //虚拟ip跳变周期
        ipConfData.put("virtual-ip-period", rips.getVirtualPeriod());
        rips.integer2IPV4_startIp();
        rips.integer2IPV4_endIp();
        //开始ip
        ipConfData.put("start-ip",rips.getStartIpString());
        //结束ip
        ipConfData.put("end-ip",rips.getEndIpString());
        //域名前缀
        ipConfData.put("domain-prefix", rips.getPrefix());
        ipConfList.add(ipConfData);
        ipConf.put("ip-conf", ipConfList);
        subnetMap.put("subnets", ipConf);
        String responseStr = (String)  RestTemplateUtils.sendUrl(restTemplate,odlIpAndPort+ripSubnetUrl, HttpMethod.PUT,subnetMap);
        logger.info("====>向odl发送保存rips命令完成");
    }

    public void save(Rips net) {
        if (net.getId() != null) {
        	networkMapper.updateByPrimaryKey(net);
        } else {
        	networkMapper.insertRips(net);
        }
    }

    public void updateExample(Rips network, Example example){
    	networkMapper.updateByExampleSelective(network, example);
    }

    /**
     * 真实子网绑定交换机
     * @param map
     */

    @Override
    @Transactional
    public void bingSwitches(Map map) {
        Binding binding = new Binding();
        //绑定列表
        List<Map> bindingConfList = new ArrayList<>();
        List<Map> nodeList = (List<Map>)MapUtils.getObject(map,"node");
        Example example = new Example(Binding.class);
        example.createCriteria().andCondition("subnet = ", MapUtils.getString(map,"id"));
        bindingMapper.deleteByExample(example);
        logger.info("====> 删除原有子网和交换机绑定");
        if(nodeList!=null&&nodeList.size()>0){

            for(Map m:nodeList){
                SimpleDateFormat dateformat1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String date=dateformat1.format(new Date());
                binding.setCreateTime(date);
                binding.setNode( MapUtils.getString(m,"name"));
                binding.setSubnet(MapUtils.getString(map,"id"));
                bindingMapper.insert(binding);
                logger.info("====> 插入绑定数据成功");
                Map<String,Object>bindConfData = new HashMap<String,Object>();
                bindConfData.put("node", MapUtils.getString(m,"name"));
//            String subnetId = ripsMapper.selectByname(list_bind.getSubnet()).getId();
                bindConfData.put("subnet", MapUtils.getString(map,"id"));
                bindingConfList.add(bindConfData);
            }

        }

        Map<String,Object>binding_json = new HashMap<String,Object>();
        Map<String,Object>bindingConf = new HashMap<String,Object>();
        //绑定列表
//        List<Map> bindingConfList = new ArrayList<>();
//        List<Binding> bindList = bindMapper.selectAllBindings();
//        for (Binding list_bind : bindList) {
//        Map<String,Object>bindConfData = new HashMap<String,Object>();
//        bindConfData.put("node", MapUtils.getString(map,"node"));
////            String subnetId = ripsMapper.selectByname(list_bind.getSubnet()).getId();
//        bindConfData.put("subnet", MapUtils.getString(map,"id"));
//        bindingConfList.add(bindConfData);
//        }
        bindingConf.put("address-binding", bindingConfList);
        binding_json.put("binding", bindingConf);
        String responseStr = (String)  RestTemplateUtils.sendUrl(restTemplate,odlIpAndPort+bindSwitchUrl, HttpMethod.PUT,binding_json);
        logger.info("====>向odl发送保存绑定命令完成");
    }
}
