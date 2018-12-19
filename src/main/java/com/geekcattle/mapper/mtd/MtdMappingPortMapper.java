package com.geekcattle.mapper.mtd;

import com.geekcattle.model.mtd.MtdMappingPort;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

@Component
public interface MtdMappingPortMapper extends CustomerMapper<MtdMappingPort> {
    int deleteAll();
}