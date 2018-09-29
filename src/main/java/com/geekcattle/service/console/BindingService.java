package com.geekcattle.service.console;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geekcattle.mapper.console.BindingMapper;
import com.geekcattle.mapper.console.RipsMapper;
import com.geekcattle.model.console.Binding;
import com.geekcattle.model.console.Rips;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;

@Service
public class BindingService {
	
    @Autowired
    private BindingMapper bMapper;

    public List<Binding> getPageList(Binding bind) {
        PageHelper.offsetPage(bind.getOffset(), bind.getLimit(), CamelCaseUtil.toUnderlineName(bind.getSort())+" "+bind.getOrder());
        return bMapper.selectAllBindings();
    }

    public Integer getCount(Example example){
        return bMapper.selectCountByExample(example);
    }

    public Binding getById(String id) {
        return bMapper.selectByPrimaryKey(id);
    }
    
    public Binding findById(String id) {
        return bMapper.findById(id);
    }
    
    public Integer getCountByNode(String input) {
    	return bMapper.selectCountByNode(input);
    }

    public void deleteById(String id) {
    	bMapper.deleteById(id);
    }

    public void insert(Binding bind){
    	bMapper.insertBinding(bind);
    }

    public void save(Binding bind) {
        if (bind.getId() != null) {
        	bMapper.updateByPrimaryKey(bind);
        } else {
        	bMapper.insertBinding(bind);
        }
    }

    public void updateExample(Binding bind, Example example){
    	bMapper.updateByExampleSelective(bind, example);
    }



}
