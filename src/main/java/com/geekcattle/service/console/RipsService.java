package com.geekcattle.service.console;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geekcattle.mapper.console.RipsMapper;
import com.geekcattle.model.console.Rips;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;

@Service
public class RipsService {
	
    @Autowired
    private RipsMapper networkMapper;

    public List<Rips> getPageList(Rips network) {
        PageHelper.offsetPage(network.getOffset(), network.getLimit(), CamelCaseUtil.toUnderlineName(network.getSort())+" "+network.getOrder());
        return networkMapper.selectAllRips();
    }

    public Integer getCount(Example example){
        return networkMapper.selectCountByExample(example);
    }
    
    public Integer getCountByNet(String input) {
    	return networkMapper.selectCountByNet(input);
    }

    public Rips getById(String id) {
        return networkMapper.selectByPrimaryKey(id);
    }

    public Rips findByname(String netname) {
        return networkMapper.selectByname(netname);
    }
    
    public Rips findById(String id) {
        return networkMapper.findById(id);
    }

    public void deleteById(String id) {
    	networkMapper.deleteById(id);
    }
    
    

    public void insert(Rips net){
    	networkMapper.insertRips(net);
    }

    public void save(Rips net) {
        if (net.getId() != null) {
        	networkMapper.updateByPrimaryKey(net);
        } else {
        	networkMapper.insertRips(net);
        }
    }

    public void updateExample(Rips network, Example example){
    	networkMapper.updateByExampleSelective(network, example);
    }



}
