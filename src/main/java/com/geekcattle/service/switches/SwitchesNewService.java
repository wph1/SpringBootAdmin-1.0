package com.geekcattle.service.switches;

import com.geekcattle.model.switches.SwitchesNew;

import java.util.List;
import java.util.Map;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
public interface SwitchesNewService {
    /**
     * 列表分页查询
     * @param switchesNew
     * @return
     */
    List<SwitchesNew> getPageList(SwitchesNew switchesNew);

    /**
     * 从odl服务器获取交换机信息和端口信息
     */
   void  getSwitchesAndPortInfoByOdl();

    /**
     * 获取所有交换机信息
     */
    List<SwitchesNew> getAll();

    /**
     * 封装交换机数据用于展示的ztree数据
     * @return
     */
    List<Map<String, Object>> getAllForZtree();

    /**
     * 获得交换机和端口ztree数据
     * @return
     */
    List<Map<String, Object>> getSwitchsAndPortForZtree();

    /**
     * 获取所有交换机和端口
     * @return
     */
    Map<String, Object> getAllSwitchsAndPort();
}
