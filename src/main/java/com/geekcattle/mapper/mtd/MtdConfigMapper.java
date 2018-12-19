package com.geekcattle.mapper.mtd;

import com.geekcattle.model.mtd.MtdConfig2;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

@Component
public interface MtdConfigMapper extends CustomerMapper<MtdConfig2> {
   int deleteAll();
}