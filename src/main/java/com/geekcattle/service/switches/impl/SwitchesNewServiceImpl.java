package com.geekcattle.service.switches.impl;

import com.geekcattle.mapper.switches.SwitchesNewMapper;
import com.geekcattle.model.switches.SwitchesNew;
import com.geekcattle.service.switches.SwitchesNewService;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
@Service
public class SwitchesNewServiceImpl implements SwitchesNewService {
    @Autowired
    private SwitchesNewMapper switchesNewMapper;

    /**
     * 交换机列表查询
     * @param switchesNew
     * @return
     */
    @Override
    public List<SwitchesNew> getPageList(SwitchesNew switchesNew) {
        PageHelper.offsetPage(switchesNew.getOffset(), switchesNew.getLimit(), CamelCaseUtil.toUnderlineName(switchesNew.getSort())+" "+switchesNew.getOrder());
        return switchesNewMapper.selectAll();
    }
}
