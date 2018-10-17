package com.geekcattle.service.flowsession.impl;

import com.geekcattle.mapper.flowsession.FlowSessionPathInfosMapper;
import com.geekcattle.model.flowsession.FlowSessionPathInfos;
import com.geekcattle.service.flowsession.FlowSessionPathInfosServcie;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlowSessionPathInfosServiceImpl implements FlowSessionPathInfosServcie {
    @Autowired
    private FlowSessionPathInfosMapper flowSessionPathInfosMapper;
    @Override
    public List<FlowSessionPathInfos> getPageList(FlowSessionPathInfos flowSessionPathInfos) {
        PageHelper.offsetPage(flowSessionPathInfos.getOffset(), flowSessionPathInfos.getLimit(), CamelCaseUtil.toUnderlineName(flowSessionPathInfos.getSort())+" "+flowSessionPathInfos.getOrder());
        return flowSessionPathInfosMapper.selectAll();
    }
}
