/*
 * Copyright (c) 2017 <l_iupeiyu@qq.com> All rights reserved.
 */

package com.geekcattle.mapper.console;

import org.springframework.stereotype.Service;

import com.geekcattle.model.console.Admin;
import com.geekcattle.model.console.AdminRole;
import com.geekcattle.util.CustomerMapper;

/**
 * author geekcattle
 * date 2016/10/21 0021 下午 15:32
 */
@Service
public interface AdminMapper extends CustomerMapper<Admin> {
    Admin selectByUsername(String username);
    void deleteById(String Id);
}
