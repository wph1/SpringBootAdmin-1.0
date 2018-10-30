package com.geekcattle.service.blacklist.impl;

import com.geekcattle.mapper.blacklist.BlackListMapper;
import com.geekcattle.mapper.mtd.HoneypotConfigMapper;
import com.geekcattle.mapper.virtualipconf.VirtualIpConfMapper;
import com.geekcattle.model.blacklist.BlackList;
import com.geekcattle.model.mtd.HoneypotConfig;
import com.geekcattle.model.virtualipconf.VirtualIpConf;
import com.geekcattle.service.blacklist.BlackListServcie;
import com.geekcattle.service.virtualipconf.VirtualIpConfServcie;
import com.geekcattle.util.CamelCaseUtil;
import com.geekcattle.util.RestTemplateUtils;
import com.geekcattle.util.UuidUtil;
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

import java.util.*;

/**
 * 虚拟ip池service接口
 */
@Service
public class BlackListServcieImpl implements BlackListServcie {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private VirtualIpConfMapper virtualIpConfMapper;
    @Autowired
    private HoneypotConfigMapper honeypotConfigMapper;
    @Autowired
    private BlackListMapper blackListMapper;
    @Autowired
    private RestTemplate restTemplate;
    @Value("${blackListUrl}")
    private String blackListUrl;
    @Value("${odlIpAndPort}")
    private String odlIpAndPort;
    /**
     * 列表分页查询
     * @param blackList
     * @return
     */
    public List<BlackList> getPageList(BlackList blackList){
         PageHelper.offsetPage(blackList.getOffset(), blackList.getLimit(), CamelCaseUtil.toUnderlineName(blackList.getSort())+" "+ blackList.getOrder());
         return blackListMapper.selectAll();
     }


    /**
     * 添加黑名单，并配置odl
     * @param mapList
     */
    @Override
    @Transactional
    public void saveBlackListAndOdl(Map mapList) throws Exception{
        //蜜罐
        List<Map> honeyList = (List) MapUtils.getObject(mapList,"mgList",new ArrayList<>());
        //黑名单
        List<Map> blackList = (List) MapUtils.getObject(mapList,"blackList",new ArrayList<>());
        //蜜罐
        List<Map> honeyListToOdl = new ArrayList<>();
        //黑名单
        List<Map> blackListToOdl = new ArrayList<>();
        //插入黑名单
        for(Map balck:blackList){
            BlackList blackList1 =  new BlackList();
            BeanUtils.populate(blackList1,balck);
            blackList1.setCreateTime(new Date());
            blackListMapper.insert(blackList1);
            Map toOdl = new HashMap();
            toOdl.put("ip",MapUtils.getString(balck,"blackListIp"));
            blackListToOdl.add(toOdl);
        }
        //插入蜜罐
        for(Map honey:honeyList){
            HoneypotConfig honeypotConfig = new HoneypotConfig();
            BeanUtils.populate(honeypotConfig,honey);
            honeypotConfig.setCreateAt(new Date());
            honeypotConfigMapper.insert(honeypotConfig);
            Map toOdl = new HashMap();
            toOdl.put("honeypot-ip",honeypotConfig.getHoneypotIp());
            toOdl.put("honeypot-gateway",honeypotConfig.getHoneypotGateway());
            toOdl.put("honeypot-mac",honeypotConfig.getHoneypotMac());
            toOdl.put("honeypot-switch-port",honeypotConfig.getHoneypotSwitchPort());
            honeyListToOdl.add(toOdl);
        }

        Map<String,Object>blackJson = new HashMap<String,Object>();
        Map<String,Object>bindingConf = new HashMap<String,Object>();
        bindingConf.put("use-blacklist", true);
        bindingConf.put("dst-list",blackListToOdl );
        bindingConf.put("honeypot-config", honeyListToOdl);
        blackJson.put("ip-blacklist", bindingConf);
        String responseStr = (String)  RestTemplateUtils.sendUrl(restTemplate,odlIpAndPort+blackListUrl, HttpMethod.PUT,blackJson);
        logger.info("====>向odl发送保存配置黑名单命令完成");
    }
    /**
     * 删除odl黑名单配置
     * @param idList
     */
    @Override
    @Transactional
    public void deleteBlackListAndOdl(String[] idList) {
        for (String id : idList) {
            blackListMapper.deleteByPrimaryKey(id);
        }
        honeypotConfigMapper.deleteAll();
        String responseStr = (String)  RestTemplateUtils.sendUrl(restTemplate,odlIpAndPort+blackListUrl, HttpMethod.DELETE,null);
        logger.info("====>向odl发送删除虚拟ip池命令完成");
    }
}
