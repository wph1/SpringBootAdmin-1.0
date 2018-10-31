import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.switches.FlowInstruction;
import com.geekcattle.model.switches.FlowTable;
import com.geekcattle.model.switches.FlowTableDetails;
import com.geekcattle.util.CamelCaseUtil;
import com.geekcattle.util.DateUtil;
import com.geekcattle.util.UuidUtil;
import org.apache.commons.collections.MapUtils;
import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.math.BigInteger;
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
     * 删除子网配置  ok  已对接过
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
     * mtd配置 ok（全局配置接口，只有这一个） 对接过
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
     * 客户配置虚拟ip池    ok   resulted in 201 (Created)  对接过了
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
        HttpEntity<Object> requestEntity_binding = new HttpEntity<Object>(headers);
        rest.exchange(url_binding,HttpMethod.DELETE,requestEntity_binding,String.class);


    }


    /**
     * 黑名单  对接过
     */
    @Test
    public void testBlackListConfig() {
        RestTemplate rest = new RestTemplate();
        String url_binding = "http://10.10.216.116:8181/restconf/config/dip-config:ip-blacklist";
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);

        //蜜罐
        List<Map> honeyListToOdl = new ArrayList<>();
        //黑名单
        List<Map> blackListToOdl = new ArrayList<>();
        Map toOdl1 = new HashMap();
        toOdl1.put("ip", "192.168.8.8");
        blackListToOdl.add(toOdl1);

        Map toOdl = new HashMap();
        toOdl.put("honeypot-ip","192.168.8.8");
        toOdl.put("honeypot-gateway","192.168.8.8");
        toOdl.put("honeypot-mac","5a:be:a0:dc:6a:e6");
        toOdl.put("honeypot-switch-port","openflow:2:2");
        honeyListToOdl.add(toOdl);

        Map<String,Object>blackJson = new HashMap<String,Object>();
        Map<String,Object>bindingConf = new HashMap<String,Object>();

        bindingConf.put("use-blacklist", true);
        bindingConf.put("dst-list",blackListToOdl );
        bindingConf.put("honeypot-config", honeyListToOdl);
        blackJson.put("ip-blacklist", bindingConf);
        HttpEntity<Object> requestEntity_binding = new HttpEntity<Object>(blackJson,headers);
        rest.exchange(url_binding,HttpMethod.PUT,requestEntity_binding,String.class);


    }




    /**
     * 会话信息  对接过
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
     * 获取交换机节点信息  对接过（剩下一个流表信息）
     */
    @Test
    public void testGetSwitches() {
        String url_switch = "http://10.10.216.116:8181/restconf/operational/opendaylight-inventory:nodes";
        String username = "admin";
        String password = "admin";
        HttpRequest.setBasicAuth(getBasicAuthStr(username,password));
        String str_switchData = HttpRequest.sendGet(url_switch,"");
        System.err.println(str_switchData);
        JSONObject jsonObject = JSON.parseObject(str_switchData);
        //JSONObject jsonObject1 = JSONObject.parseObject(COMPLEX_JSON_STR);//因为JSONObject继承了JSON，所以这样也是可以的

        String nodes = jsonObject.getString("nodes");
        System.err.println("nodes:::"+nodes);
//        Integer teacherAge = jsonObject.getInteger("teacherAge");
//        System.err.println(str_switchData);
//        JSONObject course = jsonObject.getJSONObject("course");
//        System.err.println(str_switchData);
        JSONObject jsonObject1 = JSON.parseObject(nodes);
        //交换机的数组信息
        JSONArray nodeArray = jsonObject1.getJSONArray("node");
        System.err.println("node:::"+nodeArray);
        for(int i=0;i<nodeArray.size();i++){
            //单个交换机对象
            JSONObject switchInfo =nodeArray.getJSONObject(i);
            //交换机id
          String switchId =   switchInfo.getString("id");
            System.err.println("交换机id:"+switchId);





            //交换机的链路端口信息
            JSONArray switchNodeConnectorArray =   switchInfo.getJSONArray("node-connector");
//            System.err.println("交换机链路信息:"+switchNodeConnectorArray);
            for(int j=0;j<switchNodeConnectorArray.size();j++){
                //单个端口
                JSONObject switchNodeConnector =switchNodeConnectorArray.getJSONObject(j);
                //交换机端口id
               String switchPortId =  switchNodeConnector.getString("id");
                System.err.println("交换机端口id:"+switchPortId);
                //端口字节数量
               JSONObject bytes=  switchNodeConnector.getJSONObject("opendaylight-port-statistics:flow-capable-node-connector-statistics");
                JSONObject byteObject= bytes.getJSONObject("bytes");
                Integer transmitted = byteObject.getInteger("transmitted");
                Integer received = byteObject.getInteger("received");
                System.err.println("字节数：转发："+transmitted+"----接收："+received);
                JSONObject packetsObject= bytes.getJSONObject("packets");
                Integer transmittedp =packetsObject.getInteger("transmitted");
                Integer receivedp =packetsObject.getInteger("received");
                System.err.println("包数：转发："+transmittedp+"----接收："+receivedp);

            }



        }


//        //拿到交换机id信息
//        List<String> names = (List<String>) JSONPath.eval(nodeArray, "$.id"); // 返回enties的所有名称
//        System.out.println("$.openflow = " + names);
//        Gson gson_switch = new Gson();
//        java.lang.reflect.Type type_switch = new TypeToken<TopologySwitchData>() {}.getType();
//        TopologySwitchData switchData = gson_switch.fromJson(str_switchData, type_switch);



//
//        RestTemplate rest = new RestTemplate();
//        String url_subnets = "http://10.10.216.116:8181/restconf/config/dip-config:subnets";
//        String username = "admin";
//        String password = "admin";
//        String auth = getBasicAuthStr(username, password);
//        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
//        headers.add("Accept", "application/json");
//        headers.add("Authorization", auth);
//        Map<String, Object> subnet_json = new HashMap<String, Object>();
//        Map<String, Object> ipConf = new HashMap<String, Object>();
//        Map<String, Object> ipConfData = new HashMap<String, Object>();
//        List<Map> ipConfList = new ArrayList<>();
//        ipConfData.put("rips-id", "subnet");
////        ipConfData.put("gateway", "10.10.0.254");
////        ipConfData.put("ip-global-period", "60000");
////        ipConfData.put("domain-period", "6000");
////        ipConfData.put("virtual-ip-period", "50");
////        ipConfData.put("start-ip", "10.10.0.1");
////        ipConfData.put("end-ip", "10.10.0.200");
////        ipConfData.put("domain-prefix", "wwww");
//        ipConfList.add(ipConfData);
//        ipConf.put("ip-conf", ipConfList);
//        subnet_json.put("subnets", ipConf);
//        HttpEntity<Object> requestEntity_subnet = new HttpEntity<Object>(subnet_json, headers);
//        rest.exchange(url_subnets, HttpMethod.DELETE, requestEntity_subnet, String.class);
    }


    /**
     * 获取交换机的流表信息  对接过了
     */
    @Test
    public void testFlowTable(){
        //

        String url_switch = "http://10.10.216.116:8181/restconf/operational/opendaylight-inventory:nodes/node/openflow:11882651047521214913/flow-node-inventory:table/0";
        String username = "admin";
        String password = "admin";
        HttpRequest.setBasicAuth(getBasicAuthStr(username,password));
        String str_switchData = HttpRequest.sendGet(url_switch,"");
        System.err.println(str_switchData);
        JSONObject jsonObject = JSON.parseObject(str_switchData);
        //交换机的流表
        JSONArray flowTable =   jsonObject.getJSONArray("flow-node-inventory:table");
        System.err.println("flowTable:::"+flowTable);
        for(int i=0;i<flowTable.size();i++){
            //单个流表对象
            JSONObject flow =flowTable.getJSONObject(i);
            //流表
            System.err.println("流表:"+flow);
            JSONObject flow_Table = flow.getJSONObject("opendaylight-flow-table-statistics:flow-table-statistics");

            System.err.println("flow_Table数据:"+flow_Table);
            Integer id = flow.getInteger("id");
            BigInteger packets_matched = flow_Table.getBigInteger("packets-matched");
            BigInteger packets_looked_up = flow_Table.getBigInteger("packets-looked-up");
            String active_flows = flow_Table.getString("active-flows");
            //插入流表主表数据===========
            FlowTable flowTable1 = new FlowTable();
            flowTable1.setActiveFlows(active_flows==null?0:Integer.parseInt(active_flows));
            flowTable1.setCreateTime(new Date());
            flowTable1.setId(id);
            String fowTableId = UuidUtil.getUUID();
            flowTable1.setFlowTableId(fowTableId);
            flowTable1.setPacketsLookedUp(packets_looked_up==null?new BigInteger("0"):packets_matched);
            flowTable1.setPacketsMatched(packets_matched==null?new BigInteger("0"):packets_matched);
//            flowTable1.setSwitchesId();//交换机name

            System.err.println("流表id:"+id+",流表匹配报数量："+packets_matched+"流表查看报数量:"+packets_looked_up+"活跃流："+active_flows);

            //流表详细信息
            JSONArray flowDetail = flow.getJSONArray("flow");
            for(int j=0;j<flowDetail.size();j++){
                //单个流详情对象
                JSONObject detail =flowDetail.getJSONObject(j);
                String detailId = detail.getString("id");

                //字节和包数量
                JSONObject byteAndPacket =detail.getJSONObject("opendaylight-flow-statistics:flow-statistics");
                        // 该流规则转发的比特数
                        String byte_count = byteAndPacket.getString("byte-count");
                        // 该流规则转发的包数量
                        BigInteger packet_count = byteAndPacket.getBigInteger("packet-count");
                System.err.println("流详情id:"+detailId+",转发比特数："+byte_count+"转发包数量:"+packet_count);


                //匹配规则
                JSONObject match =detail.getJSONObject("match");
                     List<Integer> typeList = (List<Integer>)JSONPath.eval(match,"$..type");
                Integer count=0;
                if(typeList !=null && typeList.size()>0){
                    System.err.println("匹配type:"+typeList.get(0));
                    count = typeList.get(0);
                }else{

                }
                //流表详情
                FlowTableDetails flowTableDetails = new FlowTableDetails();
                flowTableDetails.setCreateTime(new Date());
                flowTableDetails.setId(detailId);
                flowTableDetails.setByteCount(byte_count==null?0:Integer.parseInt(byte_count));
                flowTableDetails.setPacketCount(packet_count==null?new BigInteger("0"):packet_count);
                flowTableDetails.setMatchEthernetType(count);
                flowTableDetails.setFlowTableId(fowTableId);
                //详情id
                String flowTableDetailsId = UuidUtil.getUUID();
                flowTableDetails.setFlowTableDetailsId(flowTableDetailsId);


                //动作列表对象
                JSONObject instructions =detail.getJSONObject("instructions");
                System.err.println("aaaaa:"+instructions);
                if(instructions==null)
                    continue;
                JSONArray instructionList =instructions.getJSONArray("instruction");

                System.err.println("bbbb:"+instructionList);
                for(int a=0;a<instructionList.size();a++){
                    JSONObject instruction =instructionList.getJSONObject(a);
                    System.err.println("cccc:"+instruction);
                    if(instruction==null)
                        continue;
                    JSONObject applyActions =instruction.getJSONObject("apply-actions");
                    JSONArray actionList =applyActions.getJSONArray("action");
                    for(int b=0;b<actionList.size();b++){//动作action
                        JSONObject action =actionList.getJSONObject(b);
                        JSONObject outputAction =action.getJSONObject("output-action");
                        String outputNodeConnector = outputAction.getString("output-node-connector");
                        String maxLength = outputAction.getString("max-length");
                        String order = outputAction.getString("order");
                        System.err.println("order:"+order+"action1:"+outputNodeConnector+",action2:"+maxLength);
                        //插入指令
                        FlowInstruction flowInstruction = new FlowInstruction();
                        flowInstruction.setCreateTime(new Date());
                        flowInstruction.setMaxLength(maxLength==null?0:Integer.parseInt(maxLength));
                        flowInstruction.setOrder(order);
                        flowInstruction.setOutputNodeConnector(outputNodeConnector);
                        flowInstruction.setFlowTableDetailsId(flowTableDetailsId);


                    }
                }

            }

            }



        }

//    }
}
