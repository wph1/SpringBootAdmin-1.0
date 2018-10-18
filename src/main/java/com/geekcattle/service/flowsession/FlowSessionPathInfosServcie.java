package com.geekcattle.service.flowsession;

import com.geekcattle.model.flowsession.FlowSessionPathInfos;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

public interface FlowSessionPathInfosServcie {
    /**
     * 列表分页查询
     * @param flowSessionPathInfos
     * @return
     */
    List<FlowSessionPathInfos> getPageList(FlowSessionPathInfos flowSessionPathInfos, Example example );
}
