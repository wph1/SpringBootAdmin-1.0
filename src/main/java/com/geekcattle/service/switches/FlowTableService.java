package com.geekcattle.service.switches;

import com.geekcattle.model.console.Switches;
import com.geekcattle.model.switches.FlowTable;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
public interface FlowTableService {

    /**
     * 根据条件获取流表数据
     * @param example
     * @return
     */
     List<FlowTable> getByExample(Example example);

    /**
     * 获取交换机流表信息
     */
    void getSwitchFlow();

}
