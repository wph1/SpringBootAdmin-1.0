package com.geekcattle.service.virtualipconf.impl;

import com.geekcattle.mapper.virtualipconf.VirtualIpConfMapper;
import com.geekcattle.model.virtualipconf.VirtualIpConf;
import com.geekcattle.service.virtualipconf.VirtualIpConfServcie;
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

/**
 * 虚拟ip池service接口
 */
@Service
public class VirtualIpConfServcieImpl  implements VirtualIpConfServcie {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private VirtualIpConfMapper virtualIpConfMapper;
    @Autowired
    private RestTemplate restTemplate;
    @Value("${virtualIpConfigUrl}")
    private String virtualIpConfigUrl;
    @Value("${odlIpAndPort}")
    private String odlIpAndPort;
    /**
     * 列表分页查询
     * @param virtualIpConf
     * @return
     */
    public List<VirtualIpConf> getPageList(VirtualIpConf virtualIpConf){
         PageHelper.offsetPage(virtualIpConf.getOffset(), virtualIpConf.getLimit(), CamelCaseUtil.toUnderlineName(virtualIpConf.getSort())+" "+ virtualIpConf.getOrder());
         return virtualIpConfMapper.selectAll();
     }

    /**
     * 插入数据
     * @param virtualIpConf
     */
   public void insert(VirtualIpConf virtualIpConf){
            virtualIpConfMapper.insert(virtualIpConf);
    }

    /**
     * 通过主键id删除
     * @param id
     */
    public void deleteByPrimaryKey(String id){
        virtualIpConfMapper.deleteByPrimaryKey(id);
    }

    /**
     * 添加真实子网，并配置odl
     * @param mapList
     */
    @Override
    @Transactional
    public void saveOdl(List<Map> mapList) throws Exception{
        List<Map>  mList = new ArrayList<>();
        for(Map m:mapList){
            Map map = new HashMap();
            VirtualIpConf virtualIpConf=new VirtualIpConf();
            BeanUtils.populate(virtualIpConf,m);
            virtualIpConf.setCreateAt(new Date());
            virtualIpConfMapper.insert(virtualIpConf);
            map.put("start-ip", virtualIpConf.getStartIp());
            map.put("end-ip",virtualIpConf.getEndIp());
            mList.add(map);
        }
        Map<String,Object>binding_json = new HashMap<String,Object>();
        Map<String,Object>bindingConf = new HashMap<String,Object>();
        bindingConf.put("virtual-ip-conf", mList);
        bindingConf.put("use-own-address", true);
        binding_json.put("virtual-config", bindingConf);
        String responseStr = (String)  RestTemplateUtils.sendUrl(restTemplate,odlIpAndPort+virtualIpConfigUrl, HttpMethod.PUT,binding_json);
        logger.info("====>向odl发送保存配置虚拟ip命令完成");
    }
    /**
     * 删除odl虚拟池配置
     * @param idList
     */
    @Override
    @Transactional
    public void deleteVirtualConfigAndOdl(String[] idList) {
        for (String id : idList) {
            virtualIpConfMapper.deleteByPrimaryKey(id);
        }
        String responseStr = (String)  RestTemplateUtils.sendUrl(restTemplate,odlIpAndPort+virtualIpConfigUrl, HttpMethod.DELETE,null);
        logger.info("====>向odl发送删除虚拟ip池命令完成");
    }
}
