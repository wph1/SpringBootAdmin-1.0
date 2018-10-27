package com.geekcattle.service.virtualipconf;

import com.geekcattle.model.virtualipconf.VirtualIpConf;

import java.util.List;
import java.util.Map;

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

    /**
     * 添加真实子网，并配置odl
     * @param map
     */
    void saveOdl(List<Map> map) throws Exception;

    public void deleteVirtualConfigAndOdl(String[] idList);

}
