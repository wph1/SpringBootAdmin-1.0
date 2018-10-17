package com.geekcattle.service.flowsession.impl;

import com.geekcattle.mapper.flowsession.FlowSessionMapper;
import com.geekcattle.model.flowsession.FlowSession;
import com.geekcattle.service.flowsession.FlowSessionServcie;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlowSessionServcieImpl implements FlowSessionServcie {
    @Autowired
   private   FlowSessionMapper flowSessionMapper;

    /**
     * 列表分页查询
     * @param flowSession
     * @return
     */
    public List<FlowSession> getPageList(FlowSession flowSession) {
        PageHelper.offsetPage(flowSession.getOffset(), flowSession.getLimit(), CamelCaseUtil.toUnderlineName(flowSession.getSort())+" "+flowSession.getOrder());
        return flowSessionMapper.selectAll();
    }

    /**
     * 通过主键id查询一条数据
     * @param id
     * @return
     */
    @Override
    public FlowSession getByPrimaryKey(String id) {
        return flowSessionMapper.selectByPrimaryKey(id);
    }
}
