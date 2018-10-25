package com.geekcattle.util;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.*;

/**
 * Created by 王鹏豪 on 2018/10/25.
 */
public class RestTemplateUtils {
    /**
     * 秘密加密
     * @param name  账号
     * @param password 密码
     * @return
     */
    private static String getBasicAuthStr(String name,String password){
        return "Basic " + Base64.getEncoder().encodeToString((name + ":" + password).getBytes());
    }

    /**
     * 发送http请求
     * @param restTemplate 对象
     * @param httpUrl  请求url
     * @param method  请求方法
     * @param requestParam  请求参数
     * @return
     */
    public static Object sendUrl(RestTemplate restTemplate,String httpUrl,HttpMethod method,Object requestParam) {
//        RestTemplate rest = new RestTemplate();
//        String url_subnets = "http://10.10.216.116:8181/restconf/config/dip-config:subnets";
//        List<Rips> ipList = ripsMapper.selectAllRips();
//        for (Rips list_rip : ipList) {
        String username = "admin";
        String password = "admin";
        String auth = getBasicAuthStr(username, password);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Accept", "application/json");
        headers.add("Authorization", auth);
//        Map<String, Object> subnet_json = new HashMap<String, Object>();
//        Map<String, Object> ipConf = new HashMap<String, Object>();
//        Map<String, Object> ipConfData = new HashMap<String, Object>();
//        List<Map> ipConfList = new ArrayList<>();
////            list_rip.integer2IPV4_endIp();
////            list_rip.integer2IPV4_startIp();
//        ipConfData.put("rips-id", "subnet");
//        ipConfData.put("gateway", "10.10.0.254");
//        ipConfData.put("ip-global-period", "60000");
//        ipConfData.put("domain-period", "6000");
//        ipConfData.put("virtual-ip-period", "50");
//        ipConfData.put("start-ip", "10.10.0.1");
//        ipConfData.put("end-ip", "10.10.0.200");
//        ipConfData.put("domain-prefix", "wwww");
//        ipConfList.add(ipConfData);
//        ipConf.put("ip-conf", ipConfList);
//        subnet_json.put("subnets", ipConf);
        HttpEntity<Object> requestEntity = new HttpEntity<Object>(requestParam, headers);
        ResponseEntity resultEntity  = restTemplate.exchange(httpUrl,method, requestEntity, String.class);
        return resultEntity.getBody();
    }
}
