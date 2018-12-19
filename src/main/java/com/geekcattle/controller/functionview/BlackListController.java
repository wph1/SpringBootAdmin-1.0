package com.geekcattle.controller.functionview;


import com.geekcattle.model.blacklist.BlackList;
import com.geekcattle.model.mtd.HoneypotConfig;
import com.geekcattle.model.virtualipconf.VirtualIpConf;
import com.geekcattle.service.blacklist.BlackListServcie;
import com.geekcattle.service.mtd.FixedPortService;
import com.geekcattle.service.mtd.HoneypotConfigService;
import com.geekcattle.service.mtd.MtdConfigService;
import com.geekcattle.service.virtualipconf.VirtualIpConfServcie;
import com.geekcattle.util.JsonUtil;
import com.geekcattle.util.ReturnUtil;
import com.github.pagehelper.PageInfo;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 黑名单controller
 */
@Controller
@RequestMapping("/functionView/blackList")
public class BlackListController {


    @Autowired
    private MtdConfigService mtdConfigService;
    @Autowired
    private HoneypotConfigService honeypotConfigService;
    @Autowired
    private FixedPortService fixedPortService;

    @Autowired
    private BlackListServcie blackListServcie;

    @Autowired
    private VirtualIpConfServcie virtualIpConfServcie;
    /**
     * 黑名单列表页跳转
     * @return
     */
    @GetMapping(value = "/blackListIndex2")
    public String index2(Model model) {
        //源ip
        model.addAttribute("srcBlackList",blackListServcie.getBlackListByFlag(0)==null?new ArrayList<>():blackListServcie.getBlackListByFlag(0));
        //目的ip
        model.addAttribute("dstBlackList",blackListServcie.getBlackListByFlag(1)==null?new ArrayList<>():blackListServcie.getBlackListByFlag(1));
        //蜜罐列表
        List<HoneypotConfig> honeypotConfigList = honeypotConfigService.getAllHoneypotConfig();
        model.addAttribute("honeypotConfigList",honeypotConfigList);
        //黑名单是否开启
        List<BlackList> blackListByFlag = blackListServcie.selectAll();
        if(blackListByFlag.size()==0){//黑名单关闭
            model.addAttribute("blackListByFlag",0);
            model.addAttribute("isUseBlack",0);
        }else{
            model.addAttribute("blackListByFlag",1);
            model.addAttribute("isUseBlack",1);
        }
        return "/console/blacklist/black_index2";
    }
    /**
     * 黑名单列表页跳转
     * @return
     */
    @GetMapping(value = "/blackListIndex")
    public String index() {
        return "/console/blacklist/black_index";
    }

    /**
     * 黑名单列表
     * @param blackList
     * @return
     */
    @GetMapping(value = "/blackList")
    @ResponseBody
    public ModelMap vipList(BlackList blackList) {
        ModelMap map = new ModelMap();
        List<BlackList> Lists = blackListServcie.getPageList(blackList);
        map.put("queryParam", blackList);
        map.put("pageInfo", new PageInfo<BlackList>(Lists));
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * 黑名单添加页面
     * @return
     */
    @GetMapping(value = "/blackAdd")
    public String ripAdd() {
        return "/console/blacklist/black_add";
    }

    /**
     * 添加黑名单配置
     * @param
     * @return
     */
    @Transactional
    @RequestMapping(value = "/blackSave", method = {RequestMethod.POST})
    @ResponseBody
    public ModelMap blackSave(@RequestParam("STR_JSON")String strJson) {
        Map<String,Object> map = JsonUtil.getMapByJson(strJson);
        try {
//            List<Map> mapList = (List)MapUtils.getObject(map,"mgList",new ArrayList<>());
           blackListServcie.saveBlackListAndOdl(map);
            return ReturnUtil.Success("操作成功", null, null);
        }catch (Exception e) {
            e.printStackTrace();
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ReturnUtil.Error("操作失败", null, null);
        }
    }

    /**
     * 黑名单配置删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/blackDelete", method = {RequestMethod.GET})
    @ResponseBody
    public ModelMap blackDelete(String ids) {
        try {
            if (StringUtils.isNotEmpty(ids)) {
               String[] idList =  ids.split(",");
                blackListServcie.deleteBlackListAndOdl(idList);
                return ReturnUtil.Success("删除成功", null, null);
            } else {
                return ReturnUtil.Error("删除失败", null, null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ReturnUtil.Error("删除失败", null, null);
        }
    }

}
