package com.geekcattle.controller.functionview;


import com.alibaba.fastjson.JSON;
import com.geekcattle.model.mtd.HoneypotConfig;
import com.geekcattle.model.mtd.MtdConfig2;
import com.geekcattle.model.virtualipconf.VirtualIpConf;
import com.geekcattle.service.console.RipsService;
import com.geekcattle.service.mtd.FixedPortService;
import com.geekcattle.service.mtd.HoneypotConfigService;
import com.geekcattle.service.mtd.MtdConfigService;
import com.geekcattle.service.virtualipconf.VirtualIpConfServcie;
import com.geekcattle.util.JsonUtil;
import com.geekcattle.util.ReturnUtil;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 虚拟ip池controller
 */
@Controller
@RequestMapping("/functionView/vip")
public class VirutalIpConfController {


    @Autowired
    private MtdConfigService mtdConfigService;
    @Autowired
    private HoneypotConfigService honeypotConfigService;
    @Autowired
    private FixedPortService fixedPortService;

    @Autowired
    private VirtualIpConfServcie virtualIpConfServcie;
    /**
     * mtd配置列表页跳转
     * @return
     */
    @GetMapping(value = "/vipIndex")
    public String index() {
        return "/console/vip/vip_index";
    }

    /**
     * 虚拟ip池配置列表
     * @param virtualIpConf
     * @return
     */
    @GetMapping(value = "/vipList")
    @ResponseBody
    public ModelMap vipList(VirtualIpConf virtualIpConf) {
        ModelMap map = new ModelMap();
        List<VirtualIpConf> Lists = virtualIpConfServcie.getPageList(virtualIpConf);

        map.put("queryParam", virtualIpConf);
        map.put("pageInfo", new PageInfo<VirtualIpConf>(Lists));
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * vip配置添加页面
     * @return
     */
    @GetMapping(value = "/vipAdd")
    public String ripAdd() {
        return "/console/vip/vip_add";
    }

    /**
     * 添加mtd配置
     * @param
     * @return
     */
    @Transactional
    @RequestMapping(value = "/vipSave", method = {RequestMethod.POST})
    @ResponseBody
    public ModelMap vipSave(@RequestParam("STR_JSON")String strJson) {
        Map<String,Object> map = JsonUtil.getMapByJson(strJson);
        try {
            List<Map> mapList = (List)MapUtils.getObject(map,"mgList",new ArrayList<>());
           virtualIpConfServcie.saveOdl(mapList);
            return ReturnUtil.Success("操作成功", null, null);
        }catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ReturnUtil.Error("操作失败", null, null);
        }
    }

    /**
     * vip配置删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/vipDelete", method = {RequestMethod.GET})
    @ResponseBody
    public ModelMap vipDelete(String ids) {
        try {
            if (StringUtils.isNotEmpty(ids)) {
               String[] idList =  ids.split(",");
                virtualIpConfServcie.deleteVirtualConfigAndOdl(idList);
                return ReturnUtil.Success("删除成功", null, null);
            } else {
                return ReturnUtil.Error("删除失败", null, null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ReturnUtil.Error("删除失败", null, null);
        }
    }

}
