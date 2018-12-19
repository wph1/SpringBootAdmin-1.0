package com.geekcattle.core;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.flowsession.FlowSession;
import com.geekcattle.model.switches.FlowTable;
import com.geekcattle.service.flowsession.FlowSessionPathServcie;
import com.geekcattle.service.flowsession.FlowSessionServcie;
import com.geekcattle.service.honeypotlog.HoneypotLogServcie;
import com.geekcattle.service.switches.FlowTableService;
import com.geekcattle.service.switches.SwitchesNewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

@Configuration          //证明这个类是一个配置文件
@EnableScheduling       //打开quartz定时器总开关
//@Component
public class Timer {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private SwitchesNewService switchesNewService;
    @Autowired
    private FlowSessionServcie flowSessionServcie;
    @Autowired
    private FlowTableService flowTableService;
    @Autowired
    private HoneypotLogServcie honeypotLogServcie;

//    @Scheduled(cron = "0/5 * * * * *")//（5s执行一次）
//    public void sessionTimer() {//会话定时器
//        //获取当前时间
//        LocalDateTime localDateTime = LocalDateTime.now();
//        System.out.println("会话当前时间为:" + localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
//        try {
//            flowSessionServcie.getFlowsessionInfoByOdl();
//        }catch (Exception e){
//            logger.error("获取回话信息出现异常，"+e.getMessage());
//        }
//
//    }
//
//    @Scheduled(cron = "0 0/10 * * * *")//10分钟
//    public void swticherAndPortTimer() {//获取交换机id和端口id
//        //获取当前时间
//        LocalDateTime localDateTime = LocalDateTime.now();
//        System.out.println("交换机当前时间为:" + localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
//        try {
//            switchesNewService.getSwitchesAndPortInfoByOdl();
//        }catch (Exception e){
//            logger.error("获取交换机信息,"+e.getMessage());
//            e.printStackTrace();
//        }
//
//    }
//
//    @Scheduled(cron = "0 0/3 * * * *")//3分钟
//    public void swticherFlowTableTimer() {//交换机流表
//        //获取当前时间
//        LocalDateTime localDateTime = LocalDateTime.now();
//        System.out.println("交换机当前时间为:" + localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
//        try {
//            flowTableService.getSwitchFlow();
//        }catch (Exception e){
//            logger.error("====> 获取交换机流表信息失败,"+e.getMessage());
//            e.printStackTrace();
//        }
//
//    }
//    @Scheduled(cron = "0/30 * * * * *")//30秒
//    public void honeyPotLogTimer() {//蜜罐日志
//        //获取当前时间
//        try {
//            honeypotLogServcie.saveHoneypotLogDataByOdl();
//        }catch (Exception e){
//            logger.error("====> 获取蜜罐日志信息失败,"+e.getMessage());
//            e.printStackTrace();
//        }
//
//    }
}