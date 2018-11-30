package com.geekcattle.controller.api;


import com.geekcattle.core.es.ElasticsearchRestClientUtils;
import com.geekcattle.util.DateUtil;
import com.geekcattle.util.ReturnUtil;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 大屏数据展示controller
 */
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/bigScreen")
public class BigScreenDataDisplayController {

    @Autowired
    private RestHighLevelClient restHighLevelClient;

    /**
     * 查询攻击数量
     * flag-1-最近1小时
     *      2-最近24小时
     */
    @GetMapping("/getAttackNum")
    @ResponseBody
    public ModelMap getAttackNum(String flag){
        ModelMap map = new ModelMap();
//        try {
//            Integer attackNum = ElasticsearchRestClientUtils.getAttackNum(restHighLevelClient,flag);
//            map.put("attackNum",attackNum);
//            return ReturnUtil.Success("加载成功", map, null);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return ReturnUtil.Error("加载失败");
        map.put("attackNum",Math.round(Math.random()*1000));
        if("24".equals(flag)){
            map.put("attackNum",Math.round(Math.random()*10000000));
        }
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     *获取攻击类型数量
     * @param startTime 为空是第一次访问
     * @return
     */
    @GetMapping("/getAttackTypeNum")
    @ResponseBody
    public ModelMap getAttackTypeNum(String startTime){
        ModelMap map = new ModelMap();
        try {
//            Integer attackNum = ElasticsearchRestClientUtils.getAttacTypekNum(restHighLevelClient,startTime);
//            map.put("attackNum",attackNum);
            List xList = new ArrayList<>();
            List yList = new ArrayList<>();
            if(startTime.isEmpty()){
                String currentTime = DateUtil.getCurrentTime();
//                xList.add(Math.round(Math.random()*10));
//                yList.add(Math.random()*10);
                for(int i=1;i<8;i++){
                    String time = DateUtil.addDateMinut(currentTime, i);
                    xList.add(Math.round(Math.random()*10));
                    yList.add(Math.round(Math.random()*100));
                }
                map.put("xList",xList);
                map.put("yList",yList);
            }else{//定时器访问
                map.put("xData",(Math.round(Math.random()*10)));
                map.put("yData",Math.round(Math.random()*100));
            }
            return ReturnUtil.Success("加载成功", map, null);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ReturnUtil.Error("加载失败");
    }

    /**
     * 获取蜜罐实时数据
     * @param flag
     * @return
     */
    @GetMapping("/getTable1")
    @ResponseBody
    public ModelMap getTable1(String flag){
        ModelMap map = new ModelMap();
        try {
//            Integer attackNum = ElasticsearchRestClientUtils.getAttacTypekNum(restHighLevelClient,startTime);
//            map.put("attackNum",attackNum);
            List data = new ArrayList<>();
            if(StringUtils.isEmpty(flag)){
                for(int i=0;i<3;i++){
                    Map dataMap =  new HashMap<>();
                    dataMap.put("time",DateUtil.getCurrentTime());
                    dataMap.put("src",Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10));
                    dataMap.put("dest",Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10));
                    dataMap.put("type",Math.round(Math.random()*10));
                    data.add(dataMap);
                }
                map.put("data",data);
            }else{//定时器访问
                data.add(DateUtil.getCurrentTime());
                data.add(Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10));
                data.add(Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10));
                data.add(Math.round(Math.random()*10));
                map.put("data",data);
            }
            return ReturnUtil.Success("加载成功", map, null);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ReturnUtil.Error("加载失败");
    }


    /**
     * 获取流表数据
     * @param flag
     * @return
     */
    @GetMapping("/getTable2")
    @ResponseBody
    public ModelMap getTable2(String flag){
        ModelMap map = new ModelMap();
        try {
            List data = new ArrayList<>();
            if(StringUtils.isEmpty(flag)){
                for(int i=0;i<3;i++){
                    Map dataMap =  new HashMap<>();
                    dataMap.put("time",DateUtil.getCurrentTime());
                    dataMap.put("src",Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10));
                    dataMap.put("dest",Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10));
                    dataMap.put("type",Math.round(Math.random()*10));
                    dataMap.put("vir",Math.round(Math.random()*10));
                    data.add(dataMap);
                }
                map.put("data",data);
            }else{//定时器访问
                data.add(DateUtil.getCurrentTime());
                data.add(Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10));
                data.add(Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10)+"."+Math.round(Math.random()*10));
                data.add(Math.round(Math.random()*10));
                data.add(Math.round(Math.random()*10));
                map.put("data",data);
            }
            return ReturnUtil.Success("加载成功", map, null);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ReturnUtil.Error("加载失败");
    }


    /**
     * 获取会话监控数量
     * @param startTime
     * @return
     */
    @GetMapping("/getSessionNum")
    @ResponseBody
    public ModelMap getSessionNum(String startTime){
        ModelMap map = new ModelMap();
        try {
            List xList = new ArrayList<>();
            List yList = new ArrayList<>();
            if(startTime.isEmpty()){
                String currentTime = DateUtil.getCurrentTime();
//                xList.add(Math.round(Math.random()*10));
//                yList.add(Math.random()*10);
                for(int i=1;i<8;i++){
                    String time = DateUtil.addDateMinut(currentTime, i);
                    xList.add(Math.round(Math.random()*10));
                    yList.add(Math.round(Math.random()*100));
                }
                map.put("xList",xList);
                map.put("yList",yList);
            }else{//定时器访问
                map.put("xData",(Math.round(Math.random()*10)));
                map.put("yData",Math.round(Math.random()*100));
            }
            return ReturnUtil.Success("加载成功", map, null);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ReturnUtil.Error("加载失败");
    }

}
