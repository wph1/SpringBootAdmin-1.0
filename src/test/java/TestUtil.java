import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.util.CamelCaseUtil;
import com.geekcattle.util.DateUtil;
import com.geekcattle.util.UuidUtil;
import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.*;


public class TestUtil{

    @Test
    public void testCamelCaseUtil() {
        System.out.println(CamelCaseUtil.toUnderlineName("ISOCertifiedStaff"));
        System.out.println(CamelCaseUtil.toUnderlineName("CertifiedStaff"));
        System.out.println(CamelCaseUtil.toUnderlineName("UserID"));
        System.out.println(CamelCaseUtil.toCamelCase("iso_certified_staff"));
        System.out.println(CamelCaseUtil.toCamelCase("certified_staff"));
        System.out.println(CamelCaseUtil.toCamelCase("member"));
    }

    @Test
    public void testDateUtil() {
        System.out.println(DateUtil.getCurrentTime());//获取当前时间
        System.out.println(DateUtil.getCurrentDate());//获取当前日期
    }

    @Test
    public void testUuidUtil() {
        String[] ss = UuidUtil.getUUID(10);
        for (int i = 0; i < ss.length; i++) {
            System.out.println(ss[i]);
        }
    }


    /**
     * 添加真实子网  ok（200）  已经对接过
     */
    @Test
    public void testAddsubnets() {

        RestTemplate rest = new RestTemplate();
        String url_subnets = "http://10.10.216.116:8181/restconf/config/dip-config:subnets";
//        List<Rips> ipList = ripsMapper.selectAllRips();
//        for (Rips list_rip : ipList) {
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        Map<String, Object> subnet_json = new HashMap<String, Object>();
        Map<String, Object> ipConf = new HashMap<String, Object>();
        Map<String, Object> ipConfData = new HashMap<String, Object>();
        List<Map> ipConfList = new ArrayList<>();
//            list_rip.integer2IPV4_endIp();
//            list_rip.integer2IPV4_startIp();
        ipConfData.put("rips-id", "subnet");
        ipConfData.put("gateway", "10.10.0.254");
        ipConfData.put("ip-global-period", "60000");
        ipConfData.put("domain-period", "6000");
        ipConfData.put("virtual-ip-period", "50");
        ipConfData.put("start-ip", "10.10.0.1");
        ipConfData.put("end-ip", "10.10.0.200");
        ipConfData.put("domain-prefix", "wwww");
        ipConfList.add(ipConfData);
        ipConf.put("ip-conf", ipConfList);
        subnet_json.put("subnets", ipConf);
        HttpEntity<Object> requestEntity_subnet = new HttpEntity<Object>(subnet_json, headers);
        rest.exchange(url_subnets, HttpMethod.PUT, requestEntity_subnet, String.class);
    }

    /**
     * 删除子网配置  ok
     */
    @Test
    public void testDelsubnets() {
        RestTemplate rest = new RestTemplate();
        String url_subnets = "http://10.10.216.116:8181/restconf/config/dip-config:subnets";
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        Map<String, Object> subnet_json = new HashMap<String, Object>();
        Map<String, Object> ipConf = new HashMap<String, Object>();
        Map<String, Object> ipConfData = new HashMap<String, Object>();
        List<Map> ipConfList = new ArrayList<>();
        ipConfData.put("rips-id", "subnet");
//        ipConfData.put("gateway", "10.10.0.254");
//        ipConfData.put("ip-global-period", "60000");
//        ipConfData.put("domain-period", "6000");
//        ipConfData.put("virtual-ip-period", "50");
//        ipConfData.put("start-ip", "10.10.0.1");
//        ipConfData.put("end-ip", "10.10.0.200");
//        ipConfData.put("domain-prefix", "wwww");
        ipConfList.add(ipConfData);
        ipConf.put("ip-conf", ipConfList);
        subnet_json.put("subnets", ipConf);
        HttpEntity<Object> requestEntity_subnet = new HttpEntity<Object>(subnet_json, headers);
        rest.exchange(url_subnets, HttpMethod.DELETE, requestEntity_subnet, String.class);
    }
    private String getBasicAuthStr(String name, String password) {
        return "Basic " + Base64.getEncoder().encodeToString((name + ":" + password).getBytes());
    }


    /**
     * mtd配置 ok（全局配置接口，只有这一个）
     */
    @Test
    public void testMtdConfig() {
        RestTemplate rest = new RestTemplate();
        String url_mtd = "http://10.10.216.116:8181/restconf/config/dip-config:mtd-config";
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        Map<String,Object>mtd_json = new HashMap<String,Object>();
        Map<String,Object>mtd_config = new HashMap<String,Object>();
//        mtd_config.put("is-mtd-mode", true);
//        mtd_config.put("dns-address", mtd.getDnsAddress());
//        mtd_config.put("open-external", mtd.getOpenExternal());
//        if(mtd.getOpenExternal() == true) {
//            mtd_config.put("dns-forward-address", mtd.getDnsForwardAddress());
//            mtd_config.put("external-switch-port", mtd.getExternalSwitchPort());
//            mtd_config.put("external-switch", mtd.getExternalSwitch());
//            mtd_config.put("external-address",mtd.getExternalAddress());
//            mtd_config.put("external-gateway",mtd.getExternalGateway());
//        }
        //固定ip端口
        List fixPortList = new ArrayList();
        Map   fixPortMap = new HashMap();
        fixPortMap.put("switch-port","openflow:11882651047521214913:4");
        fixPortList.add(fixPortMap);
        mtd_config.put("fixed-port",fixPortList);
        mtd_config.put("honeypot-path-idle",600);
        mtd_config.put("k-path",8);
        mtd_config.put("path-ttl",30);
        mtd_config.put("is-mtd-mode",true);
        //蜜罐列表
//        List honeypotList = new ArrayList();
//        Map   honeypotMap = new HashMap();
//        honeypotMap.put("honeypot-ip","10.0.0.5");
//        honeypotMap.put("honeypot-mac","00:0c:29:95:82:5a");
//        honeypotMap.put("honeypot-switch-port","openflow:11882651047521214913:49");
//        honeypotList.add(honeypotMap);
//        mtd_config.put("honeypot-config", honeypotList);
        mtd_config.put("session-idle", 1800);
        mtd_config.put("external-address", "192.168.125.123");
        mtd_config.put("is-path-mutation", true);
        mtd_config.put("dns-forward-address", "8.8.8.8");
        mtd_config.put("dns-address", "1.1.1.1");
        mtd_config.put("external-switch-port", "openflow:11882651047521214913:3");
        mtd_config.put("use-honeypot", true);
        mtd_config.put("external-gateway", "192.168.125.254");
        mtd_json.put("mtd-config", mtd_config);

        HttpEntity<Object> requestEntity = new HttpEntity<Object>(mtd_json,headers);
        System.out.println(mtd_json);
        //restTemplate.put(url_mtd, requestEntity, String.class);
        rest.exchange(url_mtd,HttpMethod.PUT,requestEntity,String.class);
    }


    /**
     * 真实子网绑定交换机接口 OK
     */
    @Test
    public void testBindSwitch() {
        RestTemplate rest = new RestTemplate();
        String url_binding = "http://10.10.216.116:8181/restconf/config/dip-config:binding";
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        /*配置binding*/
        Map<String,Object>binding_json = new HashMap<String,Object>();
        Map<String,Object>bindingConf = new HashMap<String,Object>();
        //绑定列表
        List<Map> bindingConfList = new ArrayList<>();
//        List<Binding> bindList = bindMapper.selectAllBindings();
//        for (Binding list_bind : bindList) {
        Map<String,Object>bindConfData = new HashMap<String,Object>();
        bindConfData.put("node", "openflow:11882651047521214913");
//            String subnetId = ripsMapper.selectByname(list_bind.getSubnet()).getId();
        bindConfData.put("subnet", "subnet");
        bindingConfList.add(bindConfData);
//        }
        bindingConf.put("address-binding", bindingConfList);
        binding_json.put("binding", bindingConf);
        HttpEntity<Object> requestEntity_binding = new HttpEntity<Object>(binding_json,headers);
        rest.exchange(url_binding,HttpMethod.PUT,requestEntity_binding,String.class);


    }

    /**
     * 删除交换机上面绑定的子网（交换机为条件） OK
     */
    @Test
    public void testDeleteBindSwitch() {
        RestTemplate rest = new RestTemplate();
        String url_binding = "http://10.10.216.116:8181/restconf/config/dip-config:binding/address-binding/openflow:11882651047521214913";
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        /*配置binding*/
        Map<String,Object>binding_json = new HashMap<String,Object>();
        Map<String,Object>bindingConf = new HashMap<String,Object>();
        //绑定列表
        List<Map> bindingConfList = new ArrayList<>();
//        List<Binding> bindList = bindMapper.selectAllBindings();
//        for (Binding list_bind : bindList) {
        Map<String,Object>bindConfData = new HashMap<String,Object>();
        bindConfData.put("node", "openflow:11882651047521214913");
//            String subnetId = ripsMapper.selectByname(list_bind.getSubnet()).getId();
        bindConfData.put("subnet", "subnet");
        bindingConfList.add(bindConfData);
//        }
        bindingConf.put("address-binding", bindingConfList);
        binding_json.put("binding", bindingConf);
        HttpEntity<Object> requestEntity_binding = new HttpEntity<Object>(binding_json,headers);
        rest.exchange(url_binding,HttpMethod.DELETE,requestEntity_binding,String.class);


    }


    /**
     * 客户配置虚拟ip池    ok   resulted in 201 (Created)
     */
    @Test
    public void testVirtualIpConfig() {
        RestTemplate rest = new RestTemplate();
        String url_binding = "http://10.10.216.116:8181/restconf/config/dip-config:virtual-config";
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        /*配置binding*/
        Map<String,Object>binding_json = new HashMap<String,Object>();
        Map<String,Object>bindingConf = new HashMap<String,Object>();
        //绑定列表
        List<Map> bindingConfList = new ArrayList<>();
//        List<Binding> bindList = bindMapper.selectAllBindings();
//        for (Binding list_bind : bindList) {
        Map<String,Object>bindConfData = new HashMap<String,Object>();
        bindConfData.put("start-ip", "192.168.8.1");
//            String subnetId = ripsMapper.selectByname(list_bind.getSubnet()).getId();
        bindConfData.put("end-ip", "192.168.8.255");
        bindingConfList.add(bindConfData);
//        }
        bindingConf.put("virtual-ip-conf", bindingConfList);
        bindingConf.put("use-own-address", true);
        binding_json.put("virtual-config", bindingConf);
        HttpEntity<Object> requestEntity_binding = new HttpEntity<Object>(binding_json,headers);
        rest.exchange(url_binding,HttpMethod.PUT,requestEntity_binding,String.class);


    }


    /**
     * 会话信息
     */
    @Test
    public void testGetFlowSession() {
        RestTemplate rest = new RestTemplate();
        String url_binding = "http://10.10.216.116:8181/restconf/operational/dip-data:flow-sessions-list";
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        /*配置binding*/
        Map<String,Object>binding_json = new HashMap<String,Object>();
        Map<String,Object>bindingConf = new HashMap<String,Object>();
        //绑定列表
        List<Map> bindingConfList = new ArrayList<>();
//        List<Binding> bindList = bindMapper.selectAllBindings();
//        for (Binding list_bind : bindList) {
        Map<String,Object>bindConfData = new HashMap<String,Object>();
        bindConfData.put("start-ip", "192.168.8.1");
//            String subnetId = ripsMapper.selectByname(list_bind.getSubnet()).getId();
        bindConfData.put("end-ip", "192.168.8.255");
        bindingConfList.add(bindConfData);
//        }
        bindingConf.put("virtual-ip-conf", bindingConfList);
        bindingConf.put("use-own-address", true);
        binding_json.put("virtual-config", bindingConf);
        HttpEntity<Object> requestEntity_binding = new HttpEntity<Object>(headers);
        rest.exchange(url_binding,HttpMethod.GET,requestEntity_binding,String.class);
//        String forObject = rest.get.getForObject(url_binding,String.class);
//        System.out.println(forObject);

    }
    /**
     * 获取交换机节点信息
     */
    @Test
    public void testGetSwitches() {
        String url_switch = "http://192.168.125.183:8181/restconf/operational/opendaylight-inventory:nodes";
        String str_switchData = HttpRequest.sendGet(url_switch,"");
//        Gson gson_switch = new Gson();
//        java.lang.reflect.Type type_switch = new TypeToken<TopologySwitchData>() {}.getType();
//        TopologySwitchData switchData = gson_switch.fromJson(str_switchData, type_switch);




        RestTemplate rest = new RestTemplate();
        String url_subnets = "http://10.10.216.116:8181/restconf/config/dip-config:subnets";
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
        Map<String, Object> subnet_json = new HashMap<String, Object>();
        Map<String, Object> ipConf = new HashMap<String, Object>();
        Map<String, Object> ipConfData = new HashMap<String, Object>();
        List<Map> ipConfList = new ArrayList<>();
        ipConfData.put("rips-id", "subnet");
//        ipConfData.put("gateway", "10.10.0.254");
//        ipConfData.put("ip-global-period", "60000");
//        ipConfData.put("domain-period", "6000");
//        ipConfData.put("virtual-ip-period", "50");
//        ipConfData.put("start-ip", "10.10.0.1");
//        ipConfData.put("end-ip", "10.10.0.200");
//        ipConfData.put("domain-prefix", "wwww");
        ipConfList.add(ipConfData);
        ipConf.put("ip-conf", ipConfList);
        subnet_json.put("subnets", ipConf);
        HttpEntity<Object> requestEntity_subnet = new HttpEntity<Object>(subnet_json, headers);
        rest.exchange(url_subnets, HttpMethod.DELETE, requestEntity_subnet, String.class);
    }

}
