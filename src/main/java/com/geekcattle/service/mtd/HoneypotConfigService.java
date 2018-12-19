package com.geekcattle.service.mtd;

import com.geekcattle.model.mtd.HoneypotConfig;

import java.util.List;

public interface HoneypotConfigService {

    /**
     * 插入数据
     * @param honeypotConfig
     */
    void insert(HoneypotConfig honeypotConfig);

    /**
     * 获取蜜罐列表
     * @return
     */
    List<HoneypotConfig> getAllHoneypotConfig();
}
