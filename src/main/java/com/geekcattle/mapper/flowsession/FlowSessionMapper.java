package com.geekcattle.mapper.flowsession;

import com.geekcattle.model.flowsession.FlowSession;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

@Component
public interface FlowSessionMapper extends CustomerMapper<FlowSession> {
}