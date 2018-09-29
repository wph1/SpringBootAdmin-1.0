package com.geekcattle.mapper.console;

import java.util.List;

import com.geekcattle.model.console.Rips;
import com.geekcattle.util.CustomerMapper;

public interface RipsMapper extends CustomerMapper<Rips>{
    
	Rips selectByname(String netname);
	
	Rips findById(String id);
	
    void deleteById(String Id);
    
    List<Rips> selectAllRips();
    
    void insertRips(Rips net);
    
    Integer selectCountByNet(String input);

}
