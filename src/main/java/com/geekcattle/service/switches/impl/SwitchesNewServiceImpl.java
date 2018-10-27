package com.geekcattle.service.switches.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.geekcattle.mapper.switches.SwitchesNewMapper;
import com.geekcattle.mapper.switches.SwitchesNodeConnectorMapper;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.switches.SwitchesNew;
import com.geekcattle.model.switches.SwitchesNodeConnector;
import com.geekcattle.service.switches.SwitchesNewService;
import com.geekcattle.util.CamelCaseUtil;
import com.geekcattle.util.PasswordUtil;
import com.geekcattle.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
@Service
public class SwitchesNewServiceImpl implements SwitchesNewService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private SwitchesNewMapper switchesNewMapper;
    @Autowired
    private SwitchesNodeConnectorMapper switchesNodeConnectorMapper;
    /**
     * 交换机列表查询
     * @param switchesNew
     * @return
     */
    @Override
    public List<SwitchesNew> getPageList(SwitchesNew switchesNew) {
        PageHelper.offsetPage(switchesNew.getOffset(), switchesNew.getLimit(), CamelCaseUtil.toUnderlineName(switchesNew.getSort())+" "+switchesNew.getOrder());
        return switchesNewMapper.selectAll();
    }

    /**
     * 从odl服务器获取交换机信息和端口信息
     */
    @Override
    @Transactional
    public void getSwitchesAndPortInfoByOdl() {
        logger.info("====> 交换机信息入库之前，进行清库处理");
        switchesNewMapper.deleteAll();
        switchesNodeConnectorMapper.deleteAll();
        logger.info("====> 交换机信息入库之前，进行清库处理,清库处理完成");
        logger.info("====> 向odl服务器发送请求开始");
        String url_switch = "http://10.10.216.116:8181/restconf/operational/opendaylight-inventory:nodes";
        String username = "admin";
        String password = "admin";
        HttpRequest.setBasicAuth(PasswordUtil.getBasicAuthStr(username, password));
        String str_switchData = HttpRequest.sendGet(url_switch, "");
        logger.info("====> 向odl服务器发送请求结束，获取到数据："+str_switchData);
        System.err.println(str_switchData);
        JSONObject jsonObject = JSON.parseObject(str_switchData);
        //JSONObject jsonObject1 = JSONObject.parseObject(COMPLEX_JSON_STR);//因为JSONObject继承了JSON，所以这样也是可以的

        String nodes = jsonObject.getString("nodes");
        System.err.println("nodes:::" + nodes);
        JSONObject jsonObject1 = JSON.parseObject(nodes);
        //交换机的数组信息
        JSONArray nodeArray = jsonObject1.getJSONArray("node");
        System.err.println("node:::" + nodeArray);
        for (int i = 0; i < nodeArray.size(); i++) {
            //单个交换机对象
            JSONObject switchInfo = nodeArray.getJSONObject(i);
            //交换机id
            String switchId = switchInfo.getString("id");
            System.err.println("交换机id:" + switchId);
            //插入交换机信息
            SwitchesNew switchesNew = new SwitchesNew();
            String sId = UuidUtil.getUUID();
            switchesNew.setSwitchesId(sId);
            switchesNew.setSwitchesName(switchId);
            switchesNew.setCreateTime(new Date());
            logger.info("====> 开始插入交换机信息");
            switchesNewMapper.insert(switchesNew);
            logger.info("====> 完成插入交换机信息");
            JSONArray switchNodeConnectorArray = switchInfo.getJSONArray("node-connector");
//            System.err.println("交换机链路信息:"+switchNodeConnectorArray);
            for (int j = 0; j < switchNodeConnectorArray.size(); j++) {
                //单个端口
                JSONObject switchNodeConnector = switchNodeConnectorArray.getJSONObject(j);
                //交换机端口id
                String switchPortId = switchNodeConnector.getString("id");
                System.err.println("交换机端口id:" + switchPortId);
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

                SwitchesNodeConnector switchesNodeConnector = new SwitchesNodeConnector();
                switchesNodeConnector.setCreateTime(new Date());
                //交换机id
                switchesNodeConnector.setSwitchesId(sId);
                switchesNodeConnector.setId(switchPortId);
                switchesNodeConnector.setBytesTransmitted(transmitted);
                switchesNodeConnector.setBytesReceived(received);
                switchesNodeConnector.setPacketsTransmitted(transmittedp);
                switchesNodeConnector.setPacketsReceived(receivedp);
                //插入交换机的端口信息
                logger.info("====> 开始插入交换机端口信息");
                switchesNodeConnectorMapper.insert(switchesNodeConnector);
                logger.info("====> 完成插入交换机端口信息");

            }

        }
    }

    @Override
    public List<SwitchesNew> getAll() {
       return switchesNewMapper.selectAll();
    }
}
