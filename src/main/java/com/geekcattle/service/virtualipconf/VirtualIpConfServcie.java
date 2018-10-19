package com.geekcattle.service.virtualipconf;

import com.geekcattle.model.virtualipconf.VirtualIpConf;

import java.util.List;

/**
 * 回话信息service接口
 */
public interface VirtualIpConfServcie {
    /**
     * 列表分页查询
     * @param virtualIpConf
     * @return
     */
     List<VirtualIpConf> getPageList(VirtualIpConf virtualIpConf);

    /**
     * 插入数据
     * @param virtualIpConf
     */
    void insert(VirtualIpConf virtualIpConf);

    /**
     * 通过主键id删除
     * @param id
     */
    void deleteByPrimaryKey(String id);

}
