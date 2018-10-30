package com.geekcattle.mapper.mtd;

import com.geekcattle.model.mtd.HoneypotConfig;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

@Component
public interface HoneypotConfigMapper extends CustomerMapper<HoneypotConfig> {
    void deleteAll();
}