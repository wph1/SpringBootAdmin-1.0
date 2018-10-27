package com.geekcattle.service.flowsession;

import com.geekcattle.model.flowsession.FlowSessionPath;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

public interface FlowSessionPathServcie {
    /**
     * 通过主键id进行查询
     * @param id
     * @return
     */
    public FlowSessionPath getById(String id);

    /**
     * 根据条件获取总个数
     * @param example
     * @return
     */
    public List<FlowSessionPath> getByExample(Example example);

    /**
     * 列表分页查询
     * @param flowSessionPath
     * @return
     */
    List<FlowSessionPath> getPageList(FlowSessionPath flowSessionPath);


}
