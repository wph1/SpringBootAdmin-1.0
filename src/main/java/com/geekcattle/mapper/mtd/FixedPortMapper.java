package com.geekcattle.mapper.mtd;

import com.geekcattle.model.mtd.FixedPort;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface FixedPortMapper extends CustomerMapper<FixedPort> {

    /**
     * 删除所有
     * @return
     */
    int deleteAll();

    /**
     * 获取所有静态配置端口
     * @return
     */
    List<String>  getAllSwitchPort();
}