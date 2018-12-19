package com.geekcattle.mapper.mtd;

import com.geekcattle.model.mtd.MtdDynamicPort;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

@Component
public interface MtdDynamicPortMapper extends CustomerMapper<MtdDynamicPort> {
    int deleteAll();
}