package com.geekcattle.service.mtd.impl;

import com.alibaba.fastjson.JSON;
import com.geekcattle.mapper.mtd.*;
import com.geekcattle.model.mtd.*;
import com.geekcattle.service.mtd.MtdConfigService;
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
import tk.mybatis.mapper.entity.Example;

import java.util.*;

@Service
public class MtdConfigServiceImpl implements MtdConfigService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private MtdConfigMapper mtdConfigMapper;
    @Autowired
    private HoneypotConfigMapper honeypotConfigMapper;
    @Autowired
    private FixedPortMapper fixedPortMapper;
    @Autowired
    private MtdDynamicPortMapper mtdDynamicPortMapper;
    @Autowired
    private MtdMappingPortMapper mtdMappingPortMapper;
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

    @Override
    public List<MtdConfig2> getMtdConfig2() {
        List<MtdConfig2> mtdConfig2s = mtdConfigMapper.selectAll();
        return mtdConfig2s;
    }

    @Override
    public List<Map<Object, Object>> getMtdDynamicPortAndMappingPort() {
        List list = new ArrayList();
        List<MtdDynamicPort> mtdDynamicPortList = mtdDynamicPortMapper.selectAll();
        for(MtdDynamicPort mtdDynamicPort:mtdDynamicPortList){
            Map map = new HashMap();
            Example example = new Example(MtdDynamicPort.class);
            example.createCriteria().andCondition("dynamic_port_id=",  mtdDynamicPort.getDynamicportId());
            List<MtdMappingPort> mtdMappingPortList = mtdMappingPortMapper.selectByExample(example);
            String portStr="";
            for (MtdMappingPort mtdMappingPort:mtdMappingPortList){
                portStr += mtdMappingPort.getServerPort()+"/";
            }
            map.put("switchPort",mtdDynamicPort.getSwitchPort());
            map.put("serverPort",portStr.substring(0,portStr.length()-1));
            list.add(map);
        }

        return list;
    }

    /**
     * 插入mtd配置
     *
     * @param map
     */
    @Override
    @Transactional
    public void insertMtdConfigAndOdl(Map map) throws Exception {
        //插入之前全部清除
        mtdConfigMapper.deleteAll();
        mtdMappingPortMapper.deleteAll();
        mtdDynamicPortMapper.deleteAll();
        fixedPortMapper.deleteAll();
        //mtd配置
        MtdConfig2 mtdConfig2 = JSON.parseObject(JSON.toJSONString(map), MtdConfig2.class);
       String mtdId= UuidUtil.getUUID();
        mtdConfig2.setMtdId(mtdId);
        mtdConfig2.setCreateAt(new Date());
        logger.info("====>插入mtdconfig开始");
        mtdConfigMapper.insert(mtdConfig2);
        logger.info("====>插入mtdconfig成功");
        Map<String, Object> mtd_json = new HashMap<String, Object>();
        Map<String, Object> mtd_config = new HashMap<String, Object>();
        //固定ip端口
        List fixPortList = new ArrayList();
        List<Map> fixPort = (List<Map>) MapUtils.getObject(map, "switchPort");
        if (fixPort != null && fixPort.size() > 0) {
            for (Map m : fixPort) {
                Map fixPortMap = new HashMap();
                fixPortMap.put("switch-port", MapUtils.getString(m, "id"));
                fixPortList.add(fixPortMap);
                //静态端口配置-插入数据库数据
                FixedPort fixedPort = new FixedPort();
                fixedPort.setSwitchPort(MapUtils.getString(m, "id"));
                fixedPort.setCreateAt(new Date());
                fixedPort.setMtdId(mtdId);
                logger.info("====>插入fixedPort开始");
                fixedPortMapper.insert(fixedPort);
                logger.info("====>插入fixedPort成功");
            }
        }
        mtd_config.put("fixed-port", fixPortList);
        List mappingPortList = new ArrayList();
        List  dynamicPortForServicesList = new ArrayList();
        List<Map> serverList = (List<Map>) MapUtils.getObject(map, "serverList");
        if(serverList!=null && serverList.size() > 0 ){
            for (Map m : serverList) {
                Map  serverMap = new HashMap<>();
                serverMap.put("switch-port", MapUtils.getString(m, "switchPort"));
                //交换机服务-插入数据库数据
                MtdDynamicPort mtdDynamicPort =new MtdDynamicPort();
                String dynamicPortId= UuidUtil.getUUID();
                mtdDynamicPort.setDynamicportId(dynamicPortId);
                mtdDynamicPort.setSwitchPort(MapUtils.getString(m, "switchPort"));
                mtdDynamicPort.setCreateAt(new Date());
                mtdDynamicPort.setMtdId(mtdId);
                logger.info("====>插入mtdDynamicPort开始");
                mtdDynamicPortMapper.insert(mtdDynamicPort);
                logger.info("====>插入mtdDynamicPort成功");

                //服务端口截取
                String serverPorts = MapUtils.getString(m, "serverPort");
                String[] serverPortArray = serverPorts.split("/");
                for(int i=0;i<serverPortArray.length;i++){
                    Map  serverPortMap = new HashMap<>();
                    serverPortMap.put("service-port",serverPortArray[i]);
                    //映射端口-插入数据库数据
                    MtdMappingPort mtdMappingPort = new MtdMappingPort();
                    mtdMappingPort.setCreateAt(new Date());
                    mtdMappingPort.setDynamicPortId(dynamicPortId);
                    mtdMappingPort.setServerPort(serverPortArray[i]);
                    logger.info("====>插入mtdMappingPort开始");
                    mtdMappingPortMapper.insert(mtdMappingPort);
                    logger.info("====>插入mtdMappingPort成功");

                    mappingPortList.add(serverPortMap);
                }
                serverMap.put("mapping-port",mappingPortList);
                dynamicPortForServicesList.add(serverMap);
            }
        }
        mtd_config.put("dynamic-port-for-services", dynamicPortForServicesList);
        mtd_config.put("honeypot-path-idle", "0");
        mtd_config.put("k-path", MapUtils.getString(map, "kPath"));
        mtd_config.put("path-ttl", MapUtils.getString(map, "pathTtl"));
        String isMtdMode = MapUtils.getString(map, "isMtdMode");
        if ("1".equals(isMtdMode)) {
            mtd_config.put("is-mtd-mode", true);
        } else {
            mtd_config.put("is-mtd-mode", false);
        }

        mtd_config.put("session-idle", MapUtils.getString(map, "sessionIdle"));
        mtd_config.put("external-address-for-s-nat", MapUtils.getString(map, "externalAddressForSNat"));
        mtd_config.put("external-address-for-dns", MapUtils.getString(map, "externalAddressForDns"));
        mtd_config.put("external-address-for-d-port", MapUtils.getString(map, "externalAddressForDPort"));

        String useHoneypot = MapUtils.getString(map, "useHoneypot");
//        if ("1".equals(useHoneypot)) {
            mtd_config.put("use-honeypot", true);
            mtd_config.put("open-external", true);
//        } else {
//            mtd_config.put("use-honeypot", false);
//        }

        String isPathMutation = MapUtils.getString(map, "isPathMutation");
        if ("1".equals(isPathMutation)) {
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
        logger.error("====>mtd_json::"+mtd_json);
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
