package com.geekcattle.mapper.switches;

import com.geekcattle.model.switches.SwitchesNodeConnector;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

@Component
public interface SwitchesNodeConnectorMapper extends CustomerMapper<SwitchesNodeConnector> {
    void deleteAll();
}