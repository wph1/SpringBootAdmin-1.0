package com.geekcattle.service.switches.impl;

import com.geekcattle.mapper.switches.SwitchesNodeConnectorMapper;
import com.geekcattle.model.switches.SwitchesNodeConnector;
import com.geekcattle.service.switches.SwitchesNodeConnectorService;
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
public class SwitchesNodeConnectorServiceImpl implements SwitchesNodeConnectorService {
    @Autowired
    SwitchesNodeConnectorMapper switchesNodeConnectorMapper;

    /**
     * 根据条件获取交换机的端口信息
     * @param example
     * @return
     */
    @Override
    public List<SwitchesNodeConnector> getByExample(Example example) {
        return switchesNodeConnectorMapper.selectByExample(example);
    }

    /**
     * 获取交换机下面的端口列表
     * @param switchesNodeConnector
     * @param example
     * @return
     */
    @Override
    public List<SwitchesNodeConnector> getPageList(SwitchesNodeConnector switchesNodeConnector, Example example) {
        PageHelper.offsetPage(switchesNodeConnector.getOffset(), switchesNodeConnector.getLimit(), CamelCaseUtil.toUnderlineName(switchesNodeConnector.getSort())+" "+switchesNodeConnector.getOrder());
        return switchesNodeConnectorMapper.selectByExample(example);
    }

    @Override
    public List<SwitchesNodeConnector> getAll() {
        return switchesNodeConnectorMapper.selectAll();
    }
}
