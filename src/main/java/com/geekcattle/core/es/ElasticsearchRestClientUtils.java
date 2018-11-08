package com.geekcattle.core.es;

import com.geekcattle.model.PeopleTest;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.*;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortBuilders;
import org.elasticsearch.search.sort.SortOrder;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class ElasticsearchRestClientUtils {
    /**
     * @param keyword1 关键字1
     * @param keyword2 关键字2
     * @param startDate 起始时间
     * @param endDate 终止时间
     *
     **/
    public  static SearchResponse pageQueryRequest(String keyword1, String keyword2, String startDate, String endDate,
                                                   int start, int size,RestHighLevelClient client){

        // 这个sourcebuilder就类似于查询语句中最外层的部分。包括查询分页的起始，
        // 查询语句的核心，查询结果的排序，查询结果截取部分返回等一系列配置
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        // 结果开始处
        sourceBuilder.from(start);
        // 查询结果终止处
        sourceBuilder.size(size);
        // 查询的等待时间
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));
//        MatchQueryBuilder matchbuilder;
//        matchbuilder = QueryBuilders.matchQuery("message", keyword1+" "+keyword2);
//        // 同时满足两个关键字
//        matchbuilder.operator(Operator.AND);
        // 查询在时间区间范围内的结果
//        RangeQueryBuilder rangbuilder = QueryBuilders.rangeQuery("date");
//        if(!"".equals(startDate)){
//            rangbuilder.gte(startDate);
//        }
//        if(!"".equals(endDate)){
//            rangbuilder.lte(endDate);
//        }
        // 等同于bool，将两个查询合并
        BoolQueryBuilder boolBuilder = QueryBuilders.boolQuery();
//        boolBuilder.must(matchbuilder);
//        boolBuilder.must(rangbuilder);
        // 排序
        FieldSortBuilder fsb = SortBuilders.fieldSort("date");
        fsb.order(SortOrder.DESC);
        sourceBuilder.sort(fsb);

        sourceBuilder.query(boolBuilder);
        //System.out.println(sourceBuilder);
        SearchRequest searchRequest = new SearchRequest("people");
        searchRequest.types("man");
        searchRequest.source(sourceBuilder);
        SearchResponse response = null;
        try {
            response = client.search(searchRequest);
            SearchHits hits= response.getHits();
            int totalRecordNum= (int) hits.getTotalHits();
            Gson gson = new GsonBuilder()
                    .setDateFormat("yyyy-MM-dd")
                    .create();
            for (SearchHit searchHit : hits) {
                Map<String, Object> source = searchHit.getSourceAsMap();
                Object entity =gson.fromJson(gson.toJson(source), PeopleTest.class);
                System.out.println(entity);
            }


//            client.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return response;
    }

}
