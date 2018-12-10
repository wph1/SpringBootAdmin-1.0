package com.geekcattle.service.flowsession.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.geekcattle.mapper.flowsession.FlowSessionMapper;
import com.geekcattle.mapper.flowsession.FlowSessionPathInfosMapper;
import com.geekcattle.mapper.flowsession.FlowSessionPathMapper;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.flowsession.FlowSession;
import com.geekcattle.model.flowsession.FlowSessionPath;
import com.geekcattle.model.flowsession.FlowSessionPathInfos;
import com.geekcattle.service.flowsession.FlowSessionServcie;
import com.geekcattle.util.CamelCaseUtil;
import com.geekcattle.util.PasswordUtil;
import com.geekcattle.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
import java.util.List;

@Service
public class FlowSessionServcieImpl implements FlowSessionServcie {
    @Autowired
   private   FlowSessionMapper flowSessionMapper;
    @Autowired
    private FlowSessionPathMapper flowSessionPathMapper;
    @Autowired
    private FlowSessionPathInfosMapper flowSessionPathInfosMapper;
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private RestTemplate restTemplate;
    @Value("${sessionConfigUrl}")
    private String sessionConfigUrl;
    @Value("${odlIpAndPort}")
    private String odlIpAndPort;

    /**
     * 列表分页查询
     * @param flowSession
     * @return
     */
    public List<FlowSession> getPageList(FlowSession flowSession) {
        PageHelper.offsetPage(flowSession.getOffset(), flowSession.getLimit(), CamelCaseUtil.toUnderlineName(flowSession.getSort())+" "+flowSession.getOrder());
        return flowSessionMapper.selectAll();
    }

    /**
     * 通过主键id查询一条数据
     * @param id
     * @return
     */
    @Override
    public FlowSession getByPrimaryKey(String id) {
        return flowSessionMapper.selectByPrimaryKey(id);
    }


    /**
     * 通过odl获取回话信息
     */
    @Override
    public void getFlowsessionInfoByOdl() {
        logger.info("====> 向odl服务器发送会话请求开始");
        String url_switch = odlIpAndPort+"/restconf/operational/dip-data:flow-sessions-list";
        String username = "admin";
        String password = "admin";
        HttpRequest.setBasicAuth(PasswordUtil.getBasicAuthStr(username, password));
        String sessionData = HttpRequest.sendGet(url_switch, "");
        logger.info("====> 向odl服务器发送请求结束，获取到session数据："+sessionData);
        System.err.println(sessionData);
        JSONObject jsonObject = JSON.parseObject(sessionData);
        //JSONObject jsonObject1 = JSONObject.parseObject(COMPLEX_JSON_STR);//因为JSONObject继承了JSON，所以这样也是可以的

        String flowListStr = jsonObject.getString("flow-sessions-list");
        System.err.println("flowList:::" + flowListStr);
        JSONObject flowList = JSON.parseObject(flowListStr);
        //交换机的数组信息
        JSONArray flowArray = flowList.getJSONArray("flow-session");
        System.err.println("flowArray:::" + flowArray);
        for (int i = 0; i < flowArray.size(); i++) {
            //单个交换机对象
            JSONObject switchInfo = flowArray.getJSONObject(i);
            //交换机id
//            String switchId = switchInfo.getString("id");
//            String src-v-mac = switchInfo.getString("src-v-mac");
//            String switchId = switchInfo.getString("dst-mac");
//            String switchId = switchInfo.getString("dst-port");
//            String switchId = switchInfo.getString("proto");
//            String switchId = switchInfo.getString("dst-v-ip");
//            String switchId = switchInfo.getString("dst-v-mac");
//            String switchId = switchInfo.getString("src-mac");
//            String switchId = switchInfo.getString("dst-ip");
//            String switchId = switchInfo.getString("s-type");
//            String switchId = switchInfo.getString("src-ip");
//            String switchId = switchInfo.getString("topo-mutation");
//            System.err.println("会话id:" + switchId);
            //插入回话信息
            FlowSession flowSession = new FlowSession();
            String sessionId = UuidUtil.getUUID();
            flowSession.setCreateAt(new Date());
            flowSession.setSessionId(sessionId);
            flowSession.setDstIp(switchInfo.getString("dst-ip"));
            flowSession.setDstMac(switchInfo.getString("dst-mac"));
            flowSession.setDstPort(switchInfo.getString("dst-port"));
            flowSession.setId(switchInfo.getString("id"));
            flowSession.setSrcVMac(switchInfo.getString("src-v-mac"));
            flowSession.setProto(switchInfo.getString("proto"));
            flowSession.setDstVIp(switchInfo.getString("dst-v-ip"));
            flowSession.setsType(switchInfo.getString("s-type"));
            flowSession.setSrcIp(switchInfo.getString("src-ip"));
            flowSession.setTopoMutation(switchInfo.getString("topo-mutation"));
            flowSession.setDstVMac(switchInfo.getString("dst-v-mac"));
            flowSession.setSrcMac(switchInfo.getString("src-mac"));
            flowSessionMapper.insert(flowSession);
            JSONArray pathArray = switchInfo.getJSONArray("path");
//            System.err.println("交换机链路信息:"+switchNodeConnectorArray);
            for (int j = 0; j < pathArray.size(); j++) {
                JSONObject path = pathArray.getJSONObject(j);
                //交换机端口id
//                String switchPortId = path.getString("id");
//                String switchPortId = path.getString("src-port");
//                String switchPortId = path.getString("idle");
//                String switchPortId = path.getString("src-v-ip");
                FlowSessionPath flowSessionPath = new FlowSessionPath();
                flowSessionPath.setId(path.getString("id"));
                flowSessionPath.setCreateAt(new Date());
                flowSessionPath.setFlowSessionId(sessionId);
                String pathId = UuidUtil.getUUID();
                flowSessionPath.setPathId(pathId);
                flowSessionPathMapper.insert(flowSessionPath);
                JSONArray pathInfo = switchInfo.getJSONArray("flow-path");
                for(int a=0;a<pathInfo.size();a++){
                    JSONObject p = pathArray.getJSONObject(a);
//                    String switchPortId = path.getString("id");
//                    String switchPortId = path.getString("node");
//                    String switchPortId = path.getString("srcNC");
//                    String switchPortId = path.getString("dstNC");
                    FlowSessionPathInfos flowSessionPathInfos = new FlowSessionPathInfos();
                    flowSessionPathInfos.setCreateAt(new Date());
                    flowSessionPathInfos.setDstNc(path.getString("dstNC"));
                    flowSessionPathInfos.setSrcNc(path.getString("srcNC"));
                    flowSessionPathInfos.setNode(path.getString("node"));
                    flowSessionPathInfos.setId(path.getString("id"));
                    flowSessionPathInfos.setFlowSessionPathId(pathId);
                    flowSessionPathInfosMapper.insert(flowSessionPathInfos);
                }

            }

        }}
}
