package com.geekcattle.mapper.blacklist;

import com.geekcattle.model.blacklist.BlackList;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

@Component
public interface BlackListMapper extends CustomerMapper<BlackList> {
    void deleteAll();
}