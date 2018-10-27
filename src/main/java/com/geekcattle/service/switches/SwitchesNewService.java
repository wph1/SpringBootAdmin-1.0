package com.geekcattle.service.switches;

import com.geekcattle.model.switches.SwitchesNew;

import java.util.List;

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
}
