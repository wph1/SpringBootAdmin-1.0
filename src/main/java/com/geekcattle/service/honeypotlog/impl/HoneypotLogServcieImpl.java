package com.geekcattle.service.honeypotlog.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.geekcattle.mapper.honeypotlog.HoneypotLogMapper;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.honeypotlog.HoneypotLog;
import com.geekcattle.service.honeypotlog.HoneypotLogServcie;
import com.geekcattle.util.CamelCaseUtil;
import com.geekcattle.util.DateUtil;
import com.geekcattle.util.PasswordUtil;
import com.geekcattle.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
import java.util.List;

@Service
public class HoneypotLogServcieImpl implements HoneypotLogServcie {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
   private HoneypotLogMapper honeypotLogMapper;
    @Autowired
    private RestTemplate restTemplate;
    @Value("${honeypotLogUrl}")
    private String honeypotLogUrl;
    @Value("${odlIpAndPort}")
    private String odlIpAndPort;

    /**
     * 列表分页查询
     * @param honeypotLog
     * @return
     */
    public List<HoneypotLog> getPageList(HoneypotLog honeypotLog) {
        PageHelper.offsetPage(honeypotLog.getOffset(), honeypotLog.getLimit(), CamelCaseUtil.toUnderlineName(honeypotLog.getSort())+" "+honeypotLog.getOrder());
        return honeypotLogMapper.selectAll();
    }

    /**
     * 从odl获取蜜罐日志信息
     */
    @Override
    @Transactional
    public void saveHoneypotLogDataByOdl() {
        logger.info("====> 向odl服务器发送蜜罐日志请求开始");
        String url_switch = odlIpAndPort+honeypotLogUrl;
        String username = "admin";
        String password = "admin";
        HttpRequest.setBasicAuth(PasswordUtil.getBasicAuthStr(username, password));
        String honeypotLogData = HttpRequest.sendGet(url_switch, "");
        logger.info("====> 向odl服务器发送请求结束，获取到蜜罐日志数据："+honeypotLogData);
        System.err.println(honeypotLogData);
        JSONObject jsonObject = JSON.parseObject(honeypotLogData);
        JSONObject addressInfos = jsonObject.getJSONObject("honeypot-log");
            //蜜罐list信息
        JSONArray addressList = addressInfos.getJSONArray("address-info");
        System.err.println("addressList:::" + addressList);
        for (int i = 0; i < addressList.size(); i++) {
            //单个蜜罐日志对象
            JSONObject honeypotLogInfo = addressList.getJSONObject(i);

            //插入回话信息
            HoneypotLog honeypotLog = new HoneypotLog();
            String honeypotId = UuidUtil.getUUID();
            honeypotLog.setCreateTime(new Date());
            honeypotLog.setHoneyptlogId(honeypotId);
            honeypotLog.setDstIp(honeypotLogInfo.getString("dst-ip"));
            honeypotLog.setSrcIp(honeypotLogInfo.getString("src-ip"));
            honeypotLog.setDstMac(honeypotLogInfo.getString("dst-mac"));
            honeypotLog.setSrcMac(honeypotLogInfo.getString("src-mac"));
            honeypotLog.setDstPort(honeypotLogInfo.getString("dst-port"));
            honeypotLog.setSrcPort(honeypotLogInfo.getString("src-port"));
            String time = honeypotLogInfo.getString("time");
            honeypotLog.setTime(DateUtil.stringToDate(time,"yyyy-MM-dd HH:mm:ss"));
            honeypotLog.setProto(honeypotLogInfo.getString("proto"));
            honeypotLog.setHoneyptIp(honeypotLogInfo.getString("honeypot"));
            logger.info("====> 开始插入蜜罐日志数据");
            honeypotLogMapper.insert(honeypotLog);
            logger.info("====> 插入蜜罐数据成功！");
            }

        }

}
