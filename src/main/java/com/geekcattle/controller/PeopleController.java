package com.geekcattle.controller;

import com.geekcattle.core.es.ElasticsearchRestClientUtils;
import com.geekcattle.model.PeopleTest;
import com.geekcattle.model.honeypotattack.HonepotAttack;
import com.geekcattle.util.ReturnUtil;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.commons.lang3.ArrayUtils;
import org.elasticsearch.ElasticsearchException;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.rest.RestStatus;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.bucket.terms.ParsedStringTerms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 蜜罐攻击controller
 */
@Controller
@RequestMapping("/functionView/honeypotAttach")
public class PeopleController {

    @Autowired
    private RestHighLevelClient restHighLevelClient;

    /**
     * 蜜罐攻击列表页跳转
     * @return
     */
    @GetMapping(value = "/honeypotAttachIndex")
    public String index() {
        return "/console/honeypot_attack/honeypot_attack_index";
    }
    /**
     * 查询一个es数据对象
     * @param
     * @return
     */
    @GetMapping("getOne")
    public void getOne(){
        GetRequest request2=new GetRequest("people","man","1");
        try {
            GetResponse response = restHighLevelClient.get(request2);
            System.out.println(response);
            String index = response.getIndex();
            String type = response.getType();
            String id = response.getId();
            if (response.isExists()) {
                long version = response.getVersion();
                String sourceAsString = response.getSourceAsString();//检索文档(String形式)
                Map<String, Object> sourceAsMap = response.getSourceAsMap();//检索文档(Map<String, Object>形式)
                byte[] sourceAsBytes = response.getSourceAsBytes();//检索文档（byte[]形式）
            } else {
           /* 处理找不到文档的情况。 请注意，尽管返回404状态码，
            但返回的是有效的response，而不是抛出的异常。
            此类Response不包含任何源文档，并且其isExists方法返回false。*/
            }


            //当针对不存在的索引执行获取请求时，响应404状态码，将引发ElasticsearchException，需要按如下方式处理：
            GetRequest request = new GetRequest("does_not_exist", "doc", "1");
            try {
                GetResponse getResponse2 = restHighLevelClient.get(request);
            } catch (ElasticsearchException e) {
                if (e.status() == RestStatus.NOT_FOUND) {
                    //处理因为索引不存在而抛出的异常情况
                }
            }

            //如果请求了特定的文档版本，并且现有文档具有不同的版本号，则会引发版本冲突：
            try {
                GetRequest request1 = new GetRequest("posts", "doc", "1").version(2);
                GetResponse getResponse3 = restHighLevelClient.get(request);
            } catch (ElasticsearchException exception) {
                if (exception.status() == RestStatus.CONFLICT) {
                    //引发的异常表示返回了版本冲突错误
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        return peopleTest;
    }

    /**
     * 通过分页查询es数据
     */
    @GetMapping("getDataByPage")
    @ResponseBody
    public  ModelMap getDataByPage(PeopleTest peopleTest){
        ModelMap map = new ModelMap();
        List list = new ArrayList();
        int start=peopleTest.getOffset();
        int size=peopleTest.getLimit();
        SearchResponse response = ElasticsearchRestClientUtils.pageQueryRequest("", "", "", "", start, size, restHighLevelClient);
        SearchHits hits= response.getHits();
        long totalRecordNum= hits.getTotalHits();
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd")
                .create();
        for (SearchHit searchHit : hits) {
            Map<String, Object> source = searchHit.getSourceAsMap();
            PeopleTest entity =gson.fromJson(gson.toJson(source), PeopleTest.class);
            System.out.println(entity);
            list.add(entity);
        }

        map.put("queryParam", peopleTest);
        PageInfo pageInfo= new PageInfo<PeopleTest>(list);
        pageInfo.setTotal(totalRecordNum);
        map.put("pageInfo",pageInfo);
        return ReturnUtil.Success("加载成功", map, null);
    }



    /**
     * 通过分页查询es数据
     */
    @GetMapping("getHoneypotAttackDataByPage")
    @ResponseBody
    public  ModelMap getHoneypotAttackDataByPage(HonepotAttack honepotAttack){
        ModelMap map = new ModelMap();
        List list = new ArrayList();
        int start=honepotAttack.getOffset();
        int size=honepotAttack.getLimit();
        SearchResponse response = ElasticsearchRestClientUtils.pageQueryRequest("", "", "", "", start, size, restHighLevelClient);
        SearchHits hits= response.getHits();
        long totalRecordNum= hits.getTotalHits();
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd")
                .create();
        for (SearchHit searchHit : hits) {
            Map<String, Object> source = searchHit.getSourceAsMap();
            HonepotAttack entity =gson.fromJson(gson.toJson(source), HonepotAttack.class);
            System.out.println(entity);
            list.add(entity);
        }

        map.put("queryParam", honepotAttack);
        PageInfo pageInfo= new PageInfo<HonepotAttack>(list);
        pageInfo.setTotal(totalRecordNum);
        map.put("pageInfo",pageInfo);
        return ReturnUtil.Success("加载成功", map, null);
    }


    /**
     * 分组查询
     */
    @GetMapping("group")
    @ResponseBody
    public  ModelMap group(){

        SearchResponse response = ElasticsearchRestClientUtils.getCountGroupByType(restHighLevelClient);
        Map<String, Aggregation> aggMap = response.getAggregations().getAsMap();
        ParsedStringTerms gradeTerms = (ParsedStringTerms) aggMap.get("estateIdAgg");
        List list = gradeTerms.getBuckets();
        Map dataMap=new HashMap();
      List   xList = new ArrayList();
      List   yList = new ArrayList();
        for (Object object : list) {
            ParsedStringTerms.ParsedBucket obj = (ParsedStringTerms.ParsedBucket) object;
            String key = obj.getKeyAsString();
            long count = obj.getDocCount();
            xList.add(key);
            yList.add(count);
            System.out.println("key::"+key+" ,count::"+count);
        }
        dataMap.put("xData",xList);
        dataMap.put("yData",yList);
        return ReturnUtil.Success("加载成功", dataMap, null);
    }


}
