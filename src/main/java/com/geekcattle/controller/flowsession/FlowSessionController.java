package com.geekcattle.controller.flowsession;


import com.geekcattle.model.flowsession.FlowSession;
import com.geekcattle.service.flowsession.FlowSessionServcie;
import com.geekcattle.util.ReturnUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 回话信息controller
 */
@Controller
@RequestMapping("/nework/flowsession")
public class FlowSessionController {
    @Autowired
    private FlowSessionServcie flowSessionServcie;
    /**
     * 回话信息列表页面跳转
     * @return
     */
    @GetMapping(value = "/index")
    public String index() {
        return "/console/flowsession/flow_index";
    }

    @GetMapping(value = "/list")
    @ResponseBody
    public ModelMap list(FlowSession flowSession) {
        ModelMap map = new ModelMap();
        List<FlowSession> Lists = flowSessionServcie.getPageList(flowSession);
        map.put("pageInfo", new PageInfo<FlowSession>(Lists));
        map.put("queryParam", flowSession);
        return ReturnUtil.Success("加载成功", map, null);
    }

    @GetMapping(value = "/toDetails")
    public String from(FlowSession flowSession, Model model) {
//        String checkRoleId = "";
//        if (!StringUtils.isEmpty(admin.getUid())) {
//            admin = adminService.getById(admin.getUid());
//            if (!"null".equals(admin)) {
//                AdminRole adminRole = new AdminRole();
//                adminRole.setAdminId(admin.getUid());
//                List<AdminRole> adminRoleLists = adminRoleService.getRoleList(adminRole);
//                admin.setUpdatedAt(DateUtil.getCurrentTime());
//                ArrayList<String> checkRoleIds = new ArrayList<String>();
//                for (AdminRole adminRoleList : adminRoleLists) {
//                    checkRoleIds.add(adminRoleList.getRoleId());
//                }
//                checkRoleId = String.join(",", checkRoleIds);
//            }
//        } else {
//            admin.setIsSystem(0);
//        }
//        model.addAttribute("checkRoleId", checkRoleId);
//        model.addAttribute("roleLists", this.getRoleList());
//        model.addAttribute("admin", admin);
        return "/console/flowsession/flow_details";
    }
}
