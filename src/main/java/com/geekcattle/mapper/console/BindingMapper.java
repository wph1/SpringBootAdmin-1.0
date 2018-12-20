package com.geekcattle.mapper.console;

import java.util.List;

import com.geekcattle.model.console.Binding;
import com.geekcattle.util.CustomerMapper;

public interface BindingMapper extends CustomerMapper<Binding>{
   
	Binding findById(String id);
	
    void deleteById(String id);
    
    List<Binding> selectAllBindings();

    /**
     * 选择已经绑定的交换机
     * @return
     */
    List<String> selectBindSwitch();

    void insertBinding(Binding bind);
    
    Integer selectCountByNode(String node);

}
