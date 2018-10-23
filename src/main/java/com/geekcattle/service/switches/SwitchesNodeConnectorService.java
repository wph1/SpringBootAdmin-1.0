package com.geekcattle.service.switches;

import com.geekcattle.model.switches.SwitchesNodeConnector;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
public interface SwitchesNodeConnectorService {

    /**
     * 根据条件获取交换机端口详细数据数据
     * @param example
     * @return
     */
    List<SwitchesNodeConnector> getByExample(Example example);

    /**
     * 流列表分页查询
     * @param switchesNodeConnector
     * @return
     */
    List<SwitchesNodeConnector> getPageList(SwitchesNodeConnector switchesNodeConnector, Example example );
}
