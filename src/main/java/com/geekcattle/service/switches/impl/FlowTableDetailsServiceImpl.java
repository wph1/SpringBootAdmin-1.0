package com.geekcattle.service.switches.impl;

import com.geekcattle.mapper.switches.FlowTableDetailsMapper;
import com.geekcattle.model.flowsession.FlowSessionPathInfos;
import com.geekcattle.model.switches.FlowTableDetails;
import com.geekcattle.service.switches.FlowTableDetailsService;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
@Service
public class FlowTableDetailsServiceImpl implements FlowTableDetailsService {
    @Autowired
    private FlowTableDetailsMapper flowTableDetailsMapper;
    /**
     * 根据条件获取流变详细数据
     * @param example
     * @return
     */
    @Override
    public List<FlowTableDetails> getByExample(Example example) {
        return flowTableDetailsMapper.selectByExample(example);
    }

    /**
     * 流列表查询
     * @param flowTableDetails
     * @param example
     * @return
     */
    @Override
    public List<FlowTableDetails> getPageList(FlowTableDetails flowTableDetails, Example example) {
        PageHelper.offsetPage(flowTableDetails.getOffset(), flowTableDetails.getLimit(), CamelCaseUtil.toUnderlineName(flowTableDetails.getSort())+" "+flowTableDetails.getOrder());
        return flowTableDetailsMapper.selectByExample(example);
    }
}
