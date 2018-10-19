package com.geekcattle.service.mtd.impl;

import com.geekcattle.mapper.mtd.MtdConfigMapper;
import com.geekcattle.model.mtd.MtdConfig2;
import com.geekcattle.service.mtd.MtdConfigService;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MtdConfigServiceImpl implements MtdConfigService {
    @Autowired
    private MtdConfigMapper mtdConfigMapper;
    /**
     * 列表分页查询
     * @param mtdConfig2
     * @return
     */
    public List<MtdConfig2> getPageList(MtdConfig2 mtdConfig2) {
        PageHelper.offsetPage(mtdConfig2.getOffset(), mtdConfig2.getLimit(), CamelCaseUtil.toUnderlineName(mtdConfig2.getSort())+" "+ mtdConfig2.getOrder());
        return mtdConfigMapper.selectAll();
    }

    /**
     * 掺入数据
     * @param mtdConfig2
     */
    @Override
    public void insert(MtdConfig2 mtdConfig2) {
        mtdConfigMapper.insert(mtdConfig2);
    }

    /**
     * 通过主键id删除
     * @param id
     */
    @Override
    public void deleteByPrimaryKey(String id) {
        mtdConfigMapper.deleteByPrimaryKey(id);
    }
}
