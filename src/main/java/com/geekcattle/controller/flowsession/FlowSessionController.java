package com.geekcattle.controller.flowsession;


import com.geekcattle.model.flowsession.FlowSession;
import com.geekcattle.model.flowsession.FlowSessionPath;
import com.geekcattle.model.flowsession.FlowSessionPathInfos;
import com.geekcattle.service.flowsession.FlowSessionPathInfosServcie;
import com.geekcattle.service.flowsession.FlowSessionPathServcie;
import com.geekcattle.service.flowsession.FlowSessionServcie;
import com.geekcattle.util.ReturnUtil;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * 回话信息controller
 */
@Controller
@RequestMapping("/nework/flowsession")
public class FlowSessionController {
    @Autowired
    private FlowSessionServcie flowSessionServcie;
    @Autowired
    private FlowSessionPathServcie flowSessionPathServcie;
    @Autowired
    private FlowSessionPathInfosServcie flowSessionPathInfosServcie;

    /**
     * 回话信息列表页面跳转
     *
     * @return
     */
    @GetMapping(value = "/index")
    public String index() {
        return "/console/flowsession/flow_index";
    }

    /**
     * 会话下某个路径的详细节点信息
     * @return
     */
    @GetMapping(value = "/toPathInfos")
    public String toPathInfos() {
        return "/console/flowsession/flow_path_infos";
    }
    /**
     * 会话信息列表数据
     * @param flowSession
     * @return
     */
    @GetMapping(value = "/list")
    @ResponseBody
    public ModelMap list(FlowSession flowSession) {
        ModelMap map = new ModelMap();
        List<FlowSession> Lists = flowSessionServcie.getPageList(flowSession);
        map.put("pageInfo", new PageInfo<FlowSession>(Lists));
        map.put("queryParam", flowSession);
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * 会话信息详情页跳转
     * @param flowSession
     * @param model
     * @return
     */
    @GetMapping(value = "/toDetails")
    public String from(FlowSession flowSession, Model model) {
        if (!StringUtils.isEmpty(flowSession.getSessionId())) {
             flowSession = flowSessionServcie.getByPrimaryKey(flowSession.getSessionId());
            Example example = new Example(FlowSession.class);
            example.createCriteria().andCondition("flow_session_id = ", flowSession.getSessionId());
            List<FlowSessionPath> flowSessionPaths = flowSessionPathServcie.getByExample(example);
            model.addAttribute("flowSessionPaths", flowSessionPaths);
            model.addAttribute("flowSession", flowSession);
        }else{
            model.addAttribute("flowSessionPaths", new ArrayList<FlowSessionPath>());
            model.addAttribute("flowSession", flowSession);
        }

        return "/console/flowsession/flow_details";
    }

    /**
     * 某个会话信息的路径信息
     * @param flowSessionPath
     * @return
     */
    @GetMapping(value = "/pathList")
    @ResponseBody
    public ModelMap pathList(FlowSessionPath flowSessionPath) {
        ModelMap map = new ModelMap();
        List<FlowSessionPath> Lists = flowSessionPathServcie.getPageList(flowSessionPath);
        map.put("pageInfo", new PageInfo<FlowSessionPath>(Lists));
        map.put("queryParam", flowSessionPath);
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * 某个路径下的节点信息
     * @param flowSessionPath
     * @return
     */
    @GetMapping(value = "/pathInfosList")
    @ResponseBody
    public ModelMap pathInfosList(FlowSessionPathInfos flowSessionPath) {
        ModelMap map = new ModelMap();
        List<FlowSessionPathInfos> Lists = flowSessionPathInfosServcie.getPageList(flowSessionPath);
        map.put("pageInfo", new PageInfo<FlowSessionPathInfos>(Lists));
        map.put("queryParam", flowSessionPath);
        return ReturnUtil.Success("加载成功", map, null);
    }

}
