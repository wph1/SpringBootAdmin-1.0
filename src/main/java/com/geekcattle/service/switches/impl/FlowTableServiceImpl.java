package com.geekcattle.service.switches.impl;

import com.geekcattle.mapper.switches.FlowTableMapper;
import com.geekcattle.model.switches.FlowTable;
import com.geekcattle.service.switches.FlowTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
@Service
public class FlowTableServiceImpl implements FlowTableService {
    @Autowired
    private FlowTableMapper flowTableMapper;

    /**
     * 根据条件查询流表数据
     * @param example
     * @return
     */
    @Override
    public List<FlowTable> getByExample(Example example) {
        return flowTableMapper.selectByExample(example);
    }
}
