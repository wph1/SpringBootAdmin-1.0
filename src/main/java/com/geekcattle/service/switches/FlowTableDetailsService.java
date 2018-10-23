package com.geekcattle.service.switches;

import com.geekcattle.model.switches.FlowTableDetails;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
public interface FlowTableDetailsService {
    /**
     * 根据条件获取流表详细数据数据
     * @param example
     * @return
     */
    List<FlowTableDetails> getByExample(Example example);

    /**
     * 流列表分页查询
     * @param flowTableDetails
     * @return
     */
    List<FlowTableDetails> getPageList(FlowTableDetails flowTableDetails, Example example );
}
