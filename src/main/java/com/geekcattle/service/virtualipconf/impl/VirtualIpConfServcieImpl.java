package com.geekcattle.service.virtualipconf.impl;

import com.geekcattle.mapper.virtualipconf.VirtualIpConfMapper;
import com.geekcattle.model.virtualipconf.VirtualIpConf;
import com.geekcattle.service.virtualipconf.VirtualIpConfServcie;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 虚拟ip池service接口
 */
@Service
public class VirtualIpConfServcieImpl  implements VirtualIpConfServcie {
    @Autowired
    private VirtualIpConfMapper virtualIpConfMapper;
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

}
