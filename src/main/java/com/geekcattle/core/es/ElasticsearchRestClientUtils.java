package com.geekcattle.core.es;

import com.geekcattle.model.PeopleTest;
import com.geekcattle.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.*;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.BucketOrder;
import org.elasticsearch.search.aggregations.bucket.terms.ParsedStringTerms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortBuilders;
import org.elasticsearch.search.sort.SortOrder;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class ElasticsearchRestClientUtils {

    /**
     * 获取时间段内某个时间的攻击数量
     * @param client
     * @param startTime
     * @return
     * @throws IOException
     */
    public static Integer getAttacTypekNum(RestHighLevelClient client, String startTime) throws IOException {
//        int attackNum = 0;
//        // 这个sourcebuilder就类似于查询语句中最外层的部分。包括查询分页的起始，
//        // 查询语句的核心，查询结果的排序，查询结果截取部分返回等一系列配置
//        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
//        // 查询结果终止处
//        sourceBuilder.size(0);
//        // 查询的等待时间
//        sourceBuilder.timeout(new TimeValue(5, TimeUnit.SECONDS));
//        // 查询在时间区间范围内的结果
//        RangeQueryBuilder rangbuilder = QueryBuilders.rangeQuery("date");
//        if (StringUtils.isNotEmpty(flag) && "1".equals(flag)) {
//            String endDate = DateUtil.addDateMinut(DateUtil.getCurrentTime(), -1);
//            rangbuilder.lte(endDate);
//        } else if (StringUtils.isNotEmpty(flag) && "2".equals(flag)) {
//            String endDate = DateUtil.addDateMinut(DateUtil.getCurrentTime(), -24);
//            rangbuilder.lte(endDate);
//        }
//
//        // 等同于bool，将两个查询合并
//        BoolQueryBuilder boolBuilder = QueryBuilders.boolQuery();
//        boolBuilder.must(rangbuilder);
//        sourceBuilder.query(boolBuilder);
//        SearchRequest searchRequest = new SearchRequest("honeypot");
//        searchRequest.types("doc");
//        searchRequest.source(sourceBuilder);
//        SearchResponse response = null;
//        response = client.search(searchRequest);
//        SearchHits hits = response.getHits();
//        attackNum = (int) hits.getTotalHits();
//        System.err.println("查询最近一小时的总数：：" + attackNum);
        return null;
    }
    /**
     * 查询攻击数量
     *
     * @param flag 1-最近1小时    2-最近24小时
     * @return
     */
    public static Integer getAttackNum(RestHighLevelClient client, String flag) throws IOException {
        int attackNum = 0;
        // 这个sourcebuilder就类似于查询语句中最外层的部分。包括查询分页的起始，
        // 查询语句的核心，查询结果的排序，查询结果截取部分返回等一系列配置
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        // 查询结果终止处
        sourceBuilder.size(0);
        // 查询的等待时间
        sourceBuilder.timeout(new TimeValue(5, TimeUnit.SECONDS));
        // 查询在时间区间范围内的结果
        RangeQueryBuilder rangbuilder = QueryBuilders.rangeQuery("date");
        if (StringUtils.isNotEmpty(flag) && "1".equals(flag)) {
            String endDate = DateUtil.addDateMinut(DateUtil.getCurrentTime(), -1);
            rangbuilder.lte(endDate);
        } else if (StringUtils.isNotEmpty(flag) && "2".equals(flag)) {
            String endDate = DateUtil.addDateMinut(DateUtil.getCurrentTime(), -24);
            rangbuilder.lte(endDate);
        }

        // 等同于bool，将两个查询合并
        BoolQueryBuilder boolBuilder = QueryBuilders.boolQuery();
        boolBuilder.must(rangbuilder);
        sourceBuilder.query(boolBuilder);
        SearchRequest searchRequest = new SearchRequest("honeypot");
        searchRequest.types("doc");
        searchRequest.source(sourceBuilder);
        SearchResponse response = null;
        response = client.search(searchRequest);
        SearchHits hits = response.getHits();
        attackNum = (int) hits.getTotalHits();
        System.err.println("查询最近一小时的总数：：" + attackNum);
        return attackNum;
    }


    /**
     * @param keyword1  关键字1
     * @param keyword2  关键字2
     * @param startDate 起始时间
     * @param endDate   终止时间
     **/
    public static SearchResponse pageQueryRequest(String keyword1, String keyword2, String startDate, String endDate,
                                                  int start, int size, RestHighLevelClient client) {

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
//        FieldSortBuilder fsb = SortBuilders.fieldSort("date");
//        fsb.order(SortOrder.DESC);
//        sourceBuilder.sort(fsb);

        sourceBuilder.query(boolBuilder);
        //System.out.println(sourceBuilder);
        SearchRequest searchRequest = new SearchRequest("honeypot");
        searchRequest.types("doc");
        searchRequest.source(sourceBuilder);
        SearchResponse response = null;
        try {
            response = client.search(searchRequest);
            SearchHits hits = response.getHits();
            int totalRecordNum = (int) hits.getTotalHits();
//            Gson gson = new GsonBuilder()
//                    .setDateFormat("yyyy-MM-dd")
//                    .create();
//            for (SearchHit searchHit : hits) {
//                Map<String, Object> source = searchHit.getSourceAsMap();
//                Object entity =gson.fromJson(gson.toJson(source), PeopleTest.class);
//                System.out.println(entity);
//            }


//            client.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return response;
    }

    /**
     * 通过类型分组求和
     *
     * @param client
     * @return
     */
    public static SearchResponse getCountGroupByType(RestHighLevelClient client) {


        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        sourceBuilder.size(0);
        // 查询的等待时间
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));
        TermsAggregationBuilder aggregationBuilder = AggregationBuilders.terms("estateIdAgg").field("type.keyword");
//        aggregationBuilder.order(BucketOrder.count(false));
//        aggregationBuilder.size(Integer.MAX_VALUE);//todo
        sourceBuilder.aggregation(aggregationBuilder);
        //System.out.println(sourceBuilder);
        SearchRequest searchRequest = new SearchRequest("honeypot");
        searchRequest.types("doc");
        searchRequest.source(sourceBuilder);
        SearchResponse response = null;
        try {
            response = client.search(searchRequest);
            SearchHits hits = response.getHits();
//            int totalRecordNum= (int) hits.getTotalHits();


        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return response;
    }
}
