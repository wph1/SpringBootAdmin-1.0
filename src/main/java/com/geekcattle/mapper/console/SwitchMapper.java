package com.geekcattle.mapper.console;

import java.util.List;

import com.geekcattle.model.console.Binding;
import com.geekcattle.model.console.Switches;
import com.geekcattle.util.CustomerMapper;

public interface SwitchMapper extends CustomerMapper<Switches>{
   
	Switches findById(String id);
	
    void deleteById(String id);
    
    void deleteAll();
    
    List<Switches> selectAllSwitches();
    
    void insertSwitch(Switches input);

}
