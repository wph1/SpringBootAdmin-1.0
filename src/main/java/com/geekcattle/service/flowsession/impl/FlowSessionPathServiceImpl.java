package com.geekcattle.service.flowsession.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.geekcattle.mapper.flowsession.FlowSessionPathMapper;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.flowsession.FlowSession;
import com.geekcattle.model.flowsession.FlowSessionPath;
import com.geekcattle.model.switches.SwitchesNew;
import com.geekcattle.model.switches.SwitchesNodeConnector;
import com.geekcattle.service.flowsession.FlowSessionPathServcie;
import com.geekcattle.util.CamelCaseUtil;
import com.geekcattle.util.PasswordUtil;
import com.geekcattle.util.RestTemplateUtils;
import com.geekcattle.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

@Service
public class FlowSessionPathServiceImpl implements FlowSessionPathServcie {

    @Autowired
    private FlowSessionPathMapper flowSessionPathMapper;

    /**
     * 通过主键id查询
     * @param id
     * @return
     */
    @Override
    public FlowSessionPath getById(String id) {
        return flowSessionPathMapper.selectByPrimaryKey(id);
    }
    /**
     * 根据条件获取数据
     * @param example
     * @return

     *
     */
    @Override
    public List<FlowSessionPath> getByExample(Example example) {
        return flowSessionPathMapper.selectByExample(example);
    }

    /**
     * 列表分页查询
     * @param flowSessionPath
     * @return
     */
    @Override
    public List<FlowSessionPath> getPageList(FlowSessionPath flowSessionPath) {
        PageHelper.offsetPage(flowSessionPath.getOffset(), flowSessionPath.getLimit(), CamelCaseUtil.toUnderlineName(flowSessionPath.getSort())+" "+flowSessionPath.getOrder());
        return flowSessionPathMapper.selectAll();
    }



}
