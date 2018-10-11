package com.geekcattle.core.shiro;

import com.geekcattle.model.console.Admin;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class ShiroMd5Util {

    //添加user的密码加密方法
    public static String  SysMd5(String uid, String password) {
        String hashAlgorithmName = "md5";//加密方式

        Object crdentials =password;//密码原值
        ByteSource salt = ByteSource.Util.bytes(AdminShiroUtil.getUserInfo().getCredentialsSalt());//以账号作为盐值

        int hashIterations = 2;//加密2次

        SimpleHash hash = new SimpleHash(hashAlgorithmName,crdentials,salt,hashIterations);

        return hash.toString();
    }
}
