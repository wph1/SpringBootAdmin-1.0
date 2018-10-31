package com.geekcattle.service.mtd.impl;

import com.alibaba.fastjson.JSON;
import com.geekcattle.mapper.mtd.HoneypotConfigMapper;
import com.geekcattle.mapper.mtd.MtdConfigMapper;
import com.geekcattle.model.mtd.HoneypotConfig;
import com.geekcattle.model.mtd.MtdConfig2;
import com.geekcattle.service.mtd.MtdConfigService;
import com.geekcattle.util.CamelCaseUtil;
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

import java.util.*;

@Service
public class MtdConfigServiceImpl implements MtdConfigService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private MtdConfigMapper mtdConfigMapper;
    @Autowired
    private HoneypotConfigMapper honeypotConfigMapper;

    @Autowired
    private RestTemplate restTemplate;
    @Value("${mtdConfigUrl}")
    private String mtdConfigUrl;
    @Value("${odlIpAndPort}")
    private String odlIpAndPort;

    /**
     * 列表分页查询
     *
     * @param mtdConfig2
     * @return
     */
    public List<MtdConfig2> getPageList(MtdConfig2 mtdConfig2) {
        PageHelper.offsetPage(mtdConfig2.getOffset(), mtdConfig2.getLimit(), CamelCaseUtil.toUnderlineName(mtdConfig2.getSort()) + " " + mtdConfig2.getOrder());
        return mtdConfigMapper.selectAll();
    }

    /**
     * 掺入数据
     *
     * @param mtdConfig2
     */
    @Override
    public void insert(MtdConfig2 mtdConfig2) {
        mtdConfigMapper.insert(mtdConfig2);
    }

    /**
     * 插入mtd配置
     *
     * @param map
     */
    @Override
    @Transactional
    public void insertMtdConfigAndOdl(Map map) throws Exception {
        //mtd配置
        MtdConfig2 mtdConfig2 = JSON.parseObject(JSON.toJSONString(map), MtdConfig2.class);
        mtdConfig2.setCreateAt(new Date());
        logger.info("====>插入mtdconfig开始");
        mtdConfigMapper.insert(mtdConfig2);
        logger.info("====>插入mtdconfig成功");
        //蜜罐配置
//        List<Map> mapList = (List) MapUtils.getObject(map, "mgList", new ArrayList<>());
//        for (Map m : mapList) {
//            HoneypotConfig honeypotConfig = new HoneypotConfig();
//            BeanUtils.populate(honeypotConfig, m);
//            honeypotConfig.setCreateAt(new Date());
//            logger.info("====>插入honeypotConfig开始");
//            honeypotConfigMapper.insert(honeypotConfig);
//            logger.info("====>插入honeypotConfig成功");
//        }
        //静态ip配置
//            List<Map> mapList = (List)MapUtils.getObject(map,"mpList",new ArrayList<>());
//            for(Map m:mapList){
//                HoneypotConfig honeypotConfig = new HoneypotConfig();
//                BeanUtils.populate(honeypotConfig,m);
//                honeypotConfigService.insert(honeypotConfig);
//            }
        Map<String, Object> mtd_json = new HashMap<String, Object>();
        Map<String, Object> mtd_config = new HashMap<String, Object>();
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
//        Map   fixPortMap = new HashMap();
//        fixPortMap.put("switch-port",MapUtils.getString(map,"switchPort"));
//        fixPortList.add(fixPortMap);
        List<Map> fixPort = (List<Map>) MapUtils.getObject(map, "switchPort");
        if (fixPort != null && fixPort.size() > 0) {
            for (Map m : fixPort) {
                Map fixPortMap = new HashMap();
                fixPortMap.put("switch-port", MapUtils.getString(m, "id"));
                fixPortList.add(fixPortMap);
            }
        }
        mtd_config.put("fixed-port", fixPortList);
//        mtd_config.put("honeypot-path-idle", MapUtils.getString(map, "honeypotPathIdle"));
        mtd_config.put("honeypot-path-idle", "0");
        mtd_config.put("k-path", MapUtils.getString(map, "kPath"));
        mtd_config.put("path-ttl", MapUtils.getString(map, "pathTtl"));
        String isMtdMode = MapUtils.getString(map, MapUtils.getString(map, "isMtdMode"));
        if ("1".equals(isMtdMode)) {
            mtd_config.put("is-mtd-mode", true);
        } else {
            mtd_config.put("is-mtd-mode", false);
        }

        //蜜罐列表
//        List honeypotList = new ArrayList();
//        Map   honeypotMap = new HashMap();
//        honeypotMap.put("honeypot-ip","10.0.0.5");
//        honeypotMap.put("honeypot-mac","00:0c:29:95:82:5a");
//        honeypotMap.put("honeypot-switch-port","openflow:11882651047521214913:49");
//        honeypotList.add(honeypotMap);
//        mtd_config.put("honeypot-config", honeypotList);
        mtd_config.put("session-idle", MapUtils.getString(map, "sessionIdle"));
        mtd_config.put("external-address", MapUtils.getString(map, "externalAddress"));

        String useHoneypot = MapUtils.getString(map, MapUtils.getString(map, "useHoneypot"));
        if ("1".equals(useHoneypot)) {
            mtd_config.put("use-honeypot", true);
        } else {
            mtd_config.put("use-honeypot", false);
        }

        String isPathMutation = MapUtils.getString(map, MapUtils.getString(map, "isPathMutation"));
        if ("1".equals(useHoneypot)) {
            mtd_config.put("is-path-mutation", true);
        } else {
            mtd_config.put("is-path-mutation", false);
        }

//        mtd_config.put("is-path-mutation", true);
        mtd_config.put("dns-forward-address", MapUtils.getString(map, "dnsForwardAddress"));
        mtd_config.put("dns-address", MapUtils.getString(map, "dnsAddress"));//dnsAddress
        mtd_config.put("external-switch-port", MapUtils.getString(map, "externalSwitchPort"));

        mtd_config.put("external-gateway", MapUtils.getString(map, "externalGateway"));
        mtd_json.put("mtd-config", mtd_config);
        logger.info("====>开始向odl发送保存mtd命令完成");
        String responseStr = (String) RestTemplateUtils.sendUrl(restTemplate, odlIpAndPort + mtdConfigUrl, HttpMethod.PUT, mtd_json);
        logger.info("====>向odl发送保存mtd命令完成");

    }

    /**
     * 通过主键id删除
     *
     * @param id
     */
    @Override
    public void deleteByPrimaryKey(String id) {
        mtdConfigMapper.deleteByPrimaryKey(id);
    }

    /**
     * 删除mtd本地和odl全局配置
     *
     * @param idList
     */
    @Override
    @Transactional
    public void deleteMtdConfigAndOdl(String[] idList) {
        for (String id : idList) {
            mtdConfigMapper.deleteByPrimaryKey(id);
        }
        String responseStr = (String) RestTemplateUtils.sendUrl(restTemplate, odlIpAndPort + mtdConfigUrl, HttpMethod.DELETE, null);
        logger.info("====>向odl发送删除mtd命令完成");
    }
}
