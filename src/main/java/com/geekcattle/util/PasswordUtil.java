/*
 * Copyright (c) 2017 <l_iupeiyu@qq.com> All rights reserved.
 */

package com.geekcattle.util;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import java.util.Base64;

/**
 * 密码生成工具类
 * author geekcattle
 * date 2016/11/23 0023 下午 14:53
 */
public class PasswordUtil {

    public static String createAdminPwd(String password, String salt){
        return new SimpleHash("md5",password,ByteSource.Util.bytes(salt),2).toHex();
    }

    public static String createCustomPwd(String password, String salt){
        return new SimpleHash("md5",password,ByteSource.Util.bytes(salt),1).toHex();
    }

    public static String getBasicAuthStr(String name, String password) {
        return "Basic " + Base64.getEncoder().encodeToString((name + ":" + password).getBytes());
    }
}
