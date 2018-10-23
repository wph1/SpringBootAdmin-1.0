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
}
