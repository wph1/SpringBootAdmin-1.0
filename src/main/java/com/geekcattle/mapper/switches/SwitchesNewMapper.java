package com.geekcattle.mapper.switches;

import com.geekcattle.model.switches.SwitchesNew;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

//@Component
public interface SwitchesNewMapper extends CustomerMapper<SwitchesNew> {

    void deleteAll();
}