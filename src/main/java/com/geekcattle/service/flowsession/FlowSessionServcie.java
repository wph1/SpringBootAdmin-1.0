package com.geekcattle.service.flowsession;

import com.geekcattle.model.flowsession.FlowSession;

import java.util.List;

/**
 * 回话信息service接口
 */
public interface FlowSessionServcie {
    /**
     * 列表分页查询
     * @param flowSession
     * @return
     */
     List<FlowSession> getPageList(FlowSession flowSession);

    /**
     * 通过主键id进行查询某一条记录
     * @param id
     * @return
     */
     FlowSession getByPrimaryKey(String id);

    /**
     * 获取回话信息
     */
    void getFlowsessionInfoByOdl();

}
