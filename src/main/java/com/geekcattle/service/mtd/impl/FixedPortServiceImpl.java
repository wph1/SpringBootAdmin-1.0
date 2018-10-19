package com.geekcattle.service.mtd.impl;

import com.geekcattle.mapper.mtd.FixedPortMapper;
import com.geekcattle.model.mtd.FixedPort;
import com.geekcattle.service.mtd.FixedPortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FixedPortServiceImpl implements FixedPortService {
    @Autowired
    private FixedPortMapper fixedPortMapper;
    /**
     * 插入数据
     * @param fixedPort
     */
    @Override
    public void insert(FixedPort fixedPort) {
        fixedPortMapper.insert(fixedPort);
    }
}
