package com.geekcattle.core;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;

/**
 * Created by 王鹏豪 on 2018/10/8.
 */
public class JsonHelp  {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    public JsonHelp() {
    }

    public static HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    public static HttpServletResponse getResponse() {
        HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
        return response;
    }

    public static HttpSession getSession() {
        return getRequest().getSession();
    }

    public static Cookie[] getCookies() {
        return getRequest().getCookies();
    }

    public static String getCookieVal(String key) {
        Cookie[] cookies = getCookies();
        if(cookies == null) {
            return "";
        } else {
            String val = "";

            for(int i = 0; i < cookies.length; ++i) {
                Cookie cookie = cookies[i];
                if(cookie.getName().equals(key)) {
                    val = cookie.getValue();

                    try {
                        val = val != null? URLDecoder.decode(val, "utf-8"):"";
                    } catch (UnsupportedEncodingException var6) {
                        val = "";
                    }
                }
            }

            return val;
        }
    }

    public static void setCookie(Map<Object, Object> mapParam) {
        String key = MapUtils.getString(mapParam, "key", "");
        String val = MapUtils.getString(mapParam, "val", "");

        try {
            key = URLEncoder.encode(key, "utf-8");
            val = URLEncoder.encode(val, "utf-8");
            Cookie e = new Cookie(key, val);
            e.setMaxAge(MapUtils.getIntValue(mapParam, "maxage", -1));
            e.setPath(MapUtils.getString(mapParam, "path", "/"));
            getResponse().addCookie(e);
        } catch (UnsupportedEncodingException var4) {
            var4.printStackTrace();
        }

    }

    public static void setCookie(String key, String val) {
        setCookie(ArrayUtils.toMap(new String[][]{{"key", key}, {"val", val}}));
    }

    public static boolean delCookie(String key) {
        Cookie[] cookies = getCookies();
        if(cookies == null) {
            return true;
        } else {
            for(int i = 0; i < cookies.length; ++i) {
                Cookie cookie = cookies[i];
                if(cookie.getName().equals(key)) {
                    cookie.setValue((String)null);
                    cookie.setPath("/");
                    cookie.setMaxAge(0);
                    getResponse().addCookie(cookie);
                    return true;
                }
            }

            return false;
        }
    }

    public static Map getReqFormMap() {
        HashMap map = new HashMap();
        Map paramMap = getRequest().getParameterMap();
        Iterator var2 = paramMap.entrySet().iterator();

        while(var2.hasNext()) {
            Map.Entry entry = (Map.Entry)var2.next();
            String[] vals = (String[])entry.getValue();
            map.put(entry.getKey(), vals.length <= 1?vals[0]:vals);
        }

        return map;
    }

    public static Map getReqFormMapOld() {
        HttpServletRequest request = getRequest();
        HashMap map = new HashMap();
        Enumeration parameterNames = request.getParameterNames();
        if(null != parameterNames) {
            while(parameterNames.hasMoreElements()) {
                String parameterName = (String)parameterNames.nextElement();
                map.put(parameterName, request.getParameter(parameterName));
            }
        }

        return map;
    }

    public static String getReqFormVal(String paramName) {
        return MapUtils.getString(getReqFormMap(), paramName, "");
    }

    public static Map ajaxRespMap(int code, String msg) {
        return ajaxRespMap(code, msg, Arrays.asList(new String[]{""}));
    }

    public static Map ajaxRespMap(int code, String msg, Object data) {
        return ArrayUtils.toMap(new Object[][]{{"code", Integer.valueOf(code)}, {"msg", msg}, {"data", data}});
    }

//    public static String getIpAddr() {
//        return getIpAddr(getRequest());
//    }

    public static ServletContext getServletContext() {
        return getRequest().getServletContext();
    }
}