package com.geekcattle.service.bigscreen.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.geekcattle.mapper.blacklist.BlackListMapper;
import com.geekcattle.mapper.mtd.HoneypotConfigMapper;
import com.geekcattle.mapper.switches.SwitchesNewMapper;
import com.geekcattle.mapper.virtualipconf.VirtualIpConfMapper;
import com.geekcattle.model.blacklist.BlackList;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.mtd.HoneypotConfig;
import com.geekcattle.model.switches.SwitchesNew;
import com.geekcattle.service.bigscreen.BigScreenServcie;
import com.geekcattle.service.blacklist.BlackListServcie;
import com.geekcattle.util.CamelCaseUtil;
import com.geekcattle.util.JsonUtil;
import com.geekcattle.util.PasswordUtil;
import com.geekcattle.util.RestTemplateUtils;
import com.github.pagehelper.PageHelper;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.math.BigInteger;
import java.util.*;

/**
 * 虚拟ip池service接口
 */
@Service
public class BigScreenServcieImpl implements BigScreenServcie {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private VirtualIpConfMapper virtualIpConfMapper;
    @Autowired
    private HoneypotConfigMapper honeypotConfigMapper;
    @Autowired
    private BlackListMapper blackListMapper;
    @Autowired
    private RestTemplate restTemplate;
    @Value("topologyUrl")
    private String topologyUrl;
    @Value("${odlIpAndPort}")
    private String odlIpAndPort;
    @Value("sessionConfigUrl")
    private String sessionConfigUrl;
    @Autowired
    private SwitchesNewMapper switchesNewMapper;

    /**
     * 获取交换机数量和主机数量
     * @return
     */
    @Override
    public Map getSwitchAndHostNumForBigScreen() {
        Map switchAndHostNumMap = new HashMap();
        String url_switch = odlIpAndPort+topologyUrl;
        String username = "admin";
        String password = "admin";
        HttpRequest.setBasicAuth(PasswordUtil.getBasicAuthStr(username,password));
        String str_switchData = "";
        try {
            str_switchData =    HttpRequest.sendGet(url_switch,"");
            System.err.println(str_switchData);
        }catch (Exception e){
            logger.error("====> 向odl发送请求获取交换机和主机数量："+e.getMessage());
//            continue;
        }
        //判断一个字符串是否是一个合法的json对象
        if(!JsonUtil.isJSONValid(str_switchData)){
            logger.error("====> 向odl发送请求获取交换机和主机数量得到的Json数据不合法");
            switchAndHostNumMap.put("switchesNum",0);
            switchAndHostNumMap.put("hostNum",0);
        }
        JSONObject jsonObject = JSON.parseObject(str_switchData);
        JSONObject networkTopology = jsonObject.getJSONObject("network-topology");
        JSONArray topology = networkTopology.getJSONArray("topology");
        JSONObject topoInfo = topology.getJSONObject(0);//默认只有一个拓扑信息
        JSONArray switchList = topoInfo.getJSONArray("node");
        switchAndHostNumMap.put("switchesNum",switchList!=null?switchList.size():0);
        switchAndHostNumMap.put("hostNum",switchList!=null?switchList.size():0);
        return switchAndHostNumMap;
    }

    /**
     * 获取会话的监控数量
     * @return
     */
    @Override
    public Map getSessionNumForBigScreen() {
        Map sessionMap  = new HashMap();
        logger.info("====> 向odl服务器发送会话请求开始");
        String url_switch = odlIpAndPort+sessionConfigUrl;
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
        sessionMap.put("sessionNum",flowArray!=null?flowArray.size():0);
        return sessionMap;
    }

    /**
     * 流表项个数（所有交换机节点）
     * @return
     */
    @Override
    public Map getFlowTableNumForBigScreen() {
        Map m = new HashMap();
        Integer flowCountNum=0;
        List<SwitchesNew> switchesNews = switchesNewMapper.selectAll();
        for(SwitchesNew s:switchesNews){
            //交换机名称
            String switchesName = s.getSwitchesName();
            logger.info("====> 交换机名称："+switchesName);
            String url_switch = odlIpAndPort+"/restconf/operational/opendaylight-inventory:nodes/node/"+switchesName+"/flow-node-inventory:table/0";
            String username = "admin";
            String password = "admin";
            HttpRequest.setBasicAuth(PasswordUtil.getBasicAuthStr(username,password));
            String str_switchData = "";
            try {
                str_switchData =    HttpRequest.sendGet(url_switch,"");
                System.err.println(str_switchData);
            }catch (Exception e){
                logger.error("====> 交换机："+switchesName+","+e.getMessage());
                continue;
            }

            //判断一个字符串是否是一个合法的json对象
            if(!JsonUtil.isJSONValid(str_switchData)){
                logger.info("====> 交换机："+switchesName+",获取到的流表数据有问题");
                //不是合法的字符串数据，证明请求有问题
                continue;
            }
            JSONObject jsonObject = JSON.parseObject(str_switchData);
            //交换机的流表
            JSONArray flowTable =   jsonObject.getJSONArray("flow-node-inventory:table");
            if(flowTable==null){
                logger.info("====> 交换机："+switchesName+",没有流表信息");
                continue;
            }
            System.err.println("flowTable:::"+flowTable);
            for(int i=0;i<flowTable.size();i++) {
                //单个流表对象
                JSONObject flow = flowTable.getJSONObject(i);
                //流表
                System.err.println("流表:" + flow);
                JSONObject flow_Table = flow.getJSONObject("opendaylight-flow-table-statistics:flow-table-statistics");

                System.err.println("flow_Table数据:" + flow_Table);
                Integer id = flow.getInteger("id");
                BigInteger packets_matched = flow_Table.getBigInteger("packets-matched");
                BigInteger packets_looked_up = flow_Table.getBigInteger("packets-looked-up");
                String active_flows = flow_Table.getString("active-flows");
                flowCountNum += active_flows!=null?Integer.parseInt(active_flows):0;
            }
        }
        m.put("flowCountNum",flowCountNum);
        return m;
    }
}
