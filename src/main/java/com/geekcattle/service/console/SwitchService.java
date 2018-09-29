package com.geekcattle.service.console;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geekcattle.mapper.console.SwitchMapper;
import com.geekcattle.model.console.Switches;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;

@Service
public class SwitchService {
	
    @Autowired
    private SwitchMapper sMapper;

    public List<Switches> getPageList(Switches switches) {
        //PageHelper.offsetPage(switches.getOffset(), switches.getLimit(), CamelCaseUtil.toUnderlineName(switches.getSort())+" "+switches.getOrder());
        return sMapper.selectAllSwitches();
    }

    public Integer getCount(Example example){
        return sMapper.selectCountByExample(example);
    }

    public Switches getById(String id) {
        return sMapper.selectByPrimaryKey(id);
    }
    
    public Switches findById(String id) {
        return sMapper.findById(id);
    }

    public void deleteById(String id) {
    	sMapper.deleteById(id);
    }
    
    public void deleteAll() {
    	sMapper.deleteAll();
    }

    public void insert(Switches switches){
    	sMapper.insertSwitch(switches);
    }

    public void save(Switches switches) {
        if (switches.getId() != null) {
        	sMapper.updateByPrimaryKey(switches);
        } else {
        	sMapper.insertSwitch(switches);
        }
    }

    public void updateExample(Switches switches, Example example){
    	sMapper.updateByExampleSelective(switches, example);
    }
	
}
