package com.geekcattle.service.mtd;

import com.geekcattle.model.mtd.MtdConfig2;

import java.util.List;
import java.util.Map;

public interface MtdConfigService {
    /**
     * 列表分页查询
     * @param mtdConfig2
     * @return
     */
    List<MtdConfig2> getPageList(MtdConfig2 mtdConfig2);

    /**
     * 插入数据
     * @param mtdConfig2
     */
     void insert(MtdConfig2 mtdConfig2);

    /**
     * 插入mtd全局配置
     * @param map
     */
    void insertMtdConfigAndOdl(Map map)  throws Exception;

    /**
     * 通过主键id删除
     * @param id
     */
     void deleteByPrimaryKey(String id);

    /**
     * 删除mtd本地和远程全局配置
     * @param idList
     */
    void deleteMtdConfigAndOdl(String[] idList);
}
