package com.geekcattle.service.blacklist;

import com.geekcattle.model.blacklist.BlackList;
import com.geekcattle.model.virtualipconf.VirtualIpConf;

import java.util.List;
import java.util.Map;

/**
 * 黑名单service接口
 */
public interface BlackListServcie {
    /**
     * 列表分页查询
     * @param blackList
     * @return
     */
     List<BlackList> getPageList(BlackList blackList);

    /**
     * 通过类别查询黑名单
     * 1-目的ip   0-源ip   2-查询全部
     * @param flag
     * @return
     */
    List<BlackList> getBlackListByFlag(Integer flag);

    /**
     * 查询所有
     * @return
     */
    List<BlackList> selectAll();


    /**
     * 添加黑名单和蜜罐配置，并配置odl
     * @param map
     */
    void saveBlackListAndOdl(Map map) throws Exception ;

    /**
     * 删除黑名单和odl配置
     * @param idList
     */
     void deleteBlackListAndOdl(String[] idList);

}
