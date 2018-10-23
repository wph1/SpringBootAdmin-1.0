package com.geekcattle.controller.functionview;


import com.geekcattle.model.flowsession.FlowSession;
import com.geekcattle.model.flowsession.FlowSessionPath;
import com.geekcattle.model.flowsession.FlowSessionPathInfos;
import com.geekcattle.model.switches.FlowTable;
import com.geekcattle.model.switches.FlowTableDetails;
import com.geekcattle.model.switches.SwitchesNew;
import com.geekcattle.model.switches.SwitchesNodeConnector;
import com.geekcattle.service.flowsession.FlowSessionPathInfosServcie;
import com.geekcattle.service.flowsession.FlowSessionPathServcie;
import com.geekcattle.service.flowsession.FlowSessionServcie;
import com.geekcattle.service.switches.FlowTableDetailsService;
import com.geekcattle.service.switches.FlowTableService;
import com.geekcattle.service.switches.SwitchesNewService;
import com.geekcattle.service.switches.SwitchesNodeConnectorService;
import com.geekcattle.util.ReturnUtil;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * 交换机信息controller
 */
@Controller
@RequestMapping("/functionView/switches")
public class SwitchesController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private FlowSessionServcie flowSessionServcie;
    @Autowired
    private FlowSessionPathServcie flowSessionPathServcie;
    @Autowired
    private FlowSessionPathInfosServcie flowSessionPathInfosServcie;


    @Autowired
    private SwitchesNewService switchesNewService;

    @Autowired
    private FlowTableService flowTableService;
    @Autowired
    private FlowTableDetailsService flowTableDetailsService;
    @Autowired
    private SwitchesNodeConnectorService switchesNodeConnectorService;

    /**
     * 交换机信息列表页面
     *
     * @return
     */
    @GetMapping(value = "/switchesIndex")
    public String index() {
        return "/console/switches/switches_index";
    }

    /**
     * 会话下某个路径的详细节点信息
     * @return
     */
    @GetMapping(value = "/toPathInfos")
    public String toPathInfos(Model model,String pathId) {
        model.addAttribute("flowSessionPathId",pathId);
        return "/console/flowsession/flow_path_infos";
    }
    /**
     * 会话信息列表数据
     * @param switchesNew
     * @return
     */
    @GetMapping(value = "/list")
    @ResponseBody
    public ModelMap list(SwitchesNew switchesNew) {
        ModelMap map = new ModelMap();
        List<SwitchesNew> Lists = switchesNewService.getPageList(switchesNew);
        map.put("pageInfo", new PageInfo<SwitchesNew>(Lists));
        map.put("queryParam", switchesNew);
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * 交换机详情页跳转
     * @param switchesNew
     * @param model
     * @return
     */
    @GetMapping(value = "/toDetails")
    public String toDetails(SwitchesNew switchesNew, Model model) {
        if (!StringUtils.isEmpty(switchesNew.getSwitchesId())) {
            Example flowTableExample = new Example(FlowSession.class);
            flowTableExample.createCriteria().andCondition("switches_id = ", switchesNew.getSwitchesId());
            //流表数据
            List<FlowTable> flowTables = flowTableService.getByExample(flowTableExample);
//            //流表对应的流详细信息列表
//            Example flowTableDetailsExample = new Example(FlowSession.class);
//            flowTableDetailsExample.createCriteria().andCondition("flow_table_id = ",flowTables.get(0).getFlowTableId());
//            List<FlowTableDetails> flowTableDetails = flowTableDetailsService.getByExample(flowTableDetailsExample);
//            //交换机的端口列表
//            Example switchesNodeConnectorExample = new Example(FlowSession.class);
//            switchesNodeConnectorExample.createCriteria().andCondition("switches_id = ",switchesNew.getSwitchesId());
//            List<SwitchesNodeConnector> switchesNodeConnectors = switchesNodeConnectorService.getByExample(switchesNodeConnectorExample);

            model.addAttribute("flowTables", flowTables.get(0));
            model.addAttribute("flowTablesId", flowTables.get(0).getFlowTableId());
            model.addAttribute("switchesId", switchesNew.getSwitchesId());
        }else{
            model.addAttribute("flowTables", new ArrayList<FlowTable>());
            model.addAttribute("flowTablesId", "-1");
        }

        return "/console/switches/switches_details";
    }

    /**
     * 获取某个流下面的流列表
     * @param flowTableDetails
     * @return
     */
    @GetMapping(value = "/flowDetailsList")
    @ResponseBody
    public ModelMap flowDetailsList(FlowTableDetails flowTableDetails) {
        ModelMap map = new ModelMap();
        Example example = new Example(FlowTableDetails.class);
        example.createCriteria().andCondition("flow_table_id = ", flowTableDetails.getFlowTableId());
        List<FlowTableDetails> Lists = flowTableDetailsService.getPageList(flowTableDetails,example);
        map.put("pageInfo", new PageInfo<FlowTableDetails>(Lists));
        map.put("queryParam", flowTableDetails);
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * 获取某个交换机下的端口列表
     * @param switchesNodeConnector
     * @return
     */
    @GetMapping(value = "/switchNodeList")
    @ResponseBody
    public ModelMap switchNodeList(SwitchesNodeConnector switchesNodeConnector) {
        ModelMap map = new ModelMap();
        Example example = new Example(SwitchesNodeConnector.class);
        example.createCriteria().andCondition("switches_id = ", switchesNodeConnector.getSwitchesId());
        List<SwitchesNodeConnector> Lists = switchesNodeConnectorService.getPageList(switchesNodeConnector,example);
        map.put("pageInfo", new PageInfo<SwitchesNodeConnector>(Lists));
        map.put("queryParam", switchesNodeConnector);
        return ReturnUtil.Success("加载成功", map, null);
    }

}
