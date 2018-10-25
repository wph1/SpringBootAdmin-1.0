package com.geekcattle.controller.functionview;


import com.alibaba.fastjson.JSON;
import com.geekcattle.model.mtd.HoneypotConfig;
import com.geekcattle.model.mtd.MtdConfig2;
import com.geekcattle.service.console.RipsService;
import com.geekcattle.service.console.RipsServiceInterface;
import com.geekcattle.service.mtd.FixedPortService;
import com.geekcattle.service.mtd.HoneypotConfigService;
import com.geekcattle.service.mtd.MtdConfigService;
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
 * mtd功能controller
 */
@Controller
@RequestMapping("/functionView/mtd")
public class MtdController {

    @Autowired
    private RipsServiceInterface ripsService;

    @Autowired
    private MtdConfigService mtdConfigService;
    @Autowired
    private HoneypotConfigService honeypotConfigService;
    @Autowired
    private FixedPortService fixedPortService;
    /**
     * mtd配置列表页跳转
     * @return
     */
    @GetMapping(value = "/mtdIndex")
    public String index() {
        return "/console/mtd/mtd_index";
    }

    /**
     * mtd配置列表
     * @param mtdConfig2
     * @return
     */
    @GetMapping(value = "/mtdList")
    @ResponseBody
    public ModelMap mtdList(MtdConfig2 mtdConfig2) {
        ModelMap map = new ModelMap();
        List<MtdConfig2> Lists = mtdConfigService.getPageList(mtdConfig2);

        map.put("queryParam", mtdConfig2);
        map.put("pageInfo", new PageInfo<MtdConfig2>(Lists));
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * mtd配置添加页面
     * @return
     */
    @GetMapping(value = "/mtdAdd")
    public String ripAdd() {
        return "/console/mtd/mtd_add";
    }

    /**
     * 添加mtd配置
     * @param
     * @return
     */
    @Transactional
    @RequestMapping(value = "/mtdSave", method = {RequestMethod.POST})
    @ResponseBody
    public ModelMap RipsSave(@RequestParam("STR_JSON")String strJson) {
        Map<String,Object> map = JsonUtil.getMapByJson(strJson);
        try {
            //mtd配置
            MtdConfig2   mtdConfig2 = JSON.parseObject(JSON.toJSONString(map), MtdConfig2.class);
            mtdConfig2.setCreateAt(new Date());
            mtdConfigService.insert(mtdConfig2);
            //蜜罐配置
            List<Map> mapList = (List)MapUtils.getObject(map,"mgList",new ArrayList<>());
            for(Map m:mapList){
                HoneypotConfig honeypotConfig=new HoneypotConfig();
                BeanUtils.populate(honeypotConfig,m);
                honeypotConfig.setCreateAt(new Date());
                honeypotConfigService.insert(honeypotConfig);
            }
            //静态ip配置
//            List<Map> mapList = (List)MapUtils.getObject(map,"mpList",new ArrayList<>());
//            for(Map m:mapList){
//                HoneypotConfig honeypotConfig = new HoneypotConfig();
//                BeanUtils.populate(honeypotConfig,m);
//                honeypotConfigService.insert(honeypotConfig);
//            }




            return ReturnUtil.Success("操作成功", null, "/functionView/mtd/mtdIndex");
        }catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ReturnUtil.Error("操作失败", null, null);
        }
    }

    /**
     * mtd配置删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/mtdDelete", method = {RequestMethod.GET})
    @ResponseBody
    public ModelMap ripDelete(String ids) {  //真实网络删除函数
        try {
            if (StringUtils.isNotEmpty(ids)) {
               String[] idList =  ids.split(",");
                    for (String id : idList) {
                        mtdConfigService.deleteByPrimaryKey(id);
                }
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
