package com.geekcattle.service.mtd.impl;

import com.geekcattle.mapper.mtd.HoneypotConfigMapper;
import com.geekcattle.model.mtd.HoneypotConfig;
import com.geekcattle.service.mtd.HoneypotConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoneypotConfigServiceImpl implements HoneypotConfigService {
    @Autowired
    private HoneypotConfigMapper honeypotConfigMapper;
    /**
     * 插入数据
     * @param honeypotConfig
     */
    @Override
    public void insert(HoneypotConfig honeypotConfig) {
        honeypotConfigMapper.insert(honeypotConfig);
    }

    @Override
    public List<HoneypotConfig> getAllHoneypotConfig() {
        return honeypotConfigMapper.selectAll();
    }
}
