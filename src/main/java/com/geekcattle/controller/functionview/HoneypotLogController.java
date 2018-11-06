package com.geekcattle.controller.functionview;


import com.geekcattle.model.honeypotlog.HoneypotLog;
import com.geekcattle.service.honeypotlog.HoneypotLogServcie;
import com.geekcattle.util.ReturnUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 蜜罐日志controller
 */
@Controller
@RequestMapping("/functionView/honeyLog")
public class HoneypotLogController {
    @Autowired
    private HoneypotLogServcie honeypotLogServcie;

    /**
     * 回话信息列表页面跳转
     *
     * @return
     */
    @GetMapping(value = "/honeyLogIndex")
    public String index() {
        return "/console/honeypotlog/honeypotlog_index";
    }

    /**
     * 列表数据
     * @param honeypotLog
     * @return
     */
    @GetMapping(value = "/list")
    @ResponseBody
    public ModelMap list(HoneypotLog honeypotLog) {
        ModelMap map = new ModelMap();
        List<HoneypotLog> Lists = honeypotLogServcie.getPageList(honeypotLog);
        map.put("pageInfo", new PageInfo<HoneypotLog>(Lists));
        map.put("queryParam", honeypotLog);
        return ReturnUtil.Success("加载成功", map, null);
    }

}
