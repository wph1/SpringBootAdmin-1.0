/*
 * Copyright (c) 2017 <l_iupeiyu@qq.com> All rights reserved.
 */

package com.geekcattle.util;

import com.alibaba.fastjson.JSON;

import java.util.HashMap;
import java.util.Map;

public class JsonUtil {
    public JsonUtil() {
    }

    public static String toJson(Object obj) {
        return JSON.toJSONString(obj);
    }

    public static Object parse(String json) {
        return JSON.parse(json);
    }

    public static String toJsonSuccess(String msg, Object obj){
        Map<String,Object> mp = new HashMap<String, Object>();
        mp.put("status", 1);
        mp.put("state", "success");
        mp.put("msg", msg);
        mp.put("result", obj);
        return toJson(mp);
    }

    public static String toJsonError(String msg, Object obj){
        Map<String,Object> mp = new HashMap<String, Object>();
        mp.put("status", 0);
        mp.put("state", "error");
        mp.put("msg", msg);
        mp.put("result", obj);
        return toJson(mp);
    }
    /**
     * 通过json字符串生成Map对象
     *
     * @param strJson json字符串
     * @return 返回Map对象
     */
    public static Map getMapByJson(String strJson) {
        return strJson.isEmpty() ? null : JSON.parseObject(strJson, Map.class);
    }
}
