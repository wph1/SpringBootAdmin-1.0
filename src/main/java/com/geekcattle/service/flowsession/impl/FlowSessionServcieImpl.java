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
}
