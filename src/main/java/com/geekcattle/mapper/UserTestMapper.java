package com.geekcattle.mapper;

import com.geekcattle.model.UserTest;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

@Component
public interface UserTestMapper extends CustomerMapper<UserTest> {
    UserTest selectByUsername(String username);
}