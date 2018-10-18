package com.geekcattle.controller.functionview;


import com.geekcattle.model.console.Rips;
import com.geekcattle.service.console.RipsService;
import com.geekcattle.util.DateUtil;
import com.geekcattle.util.ReturnUtil;
import com.geekcattle.util.UuidUtil;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;

/**
 * 真实子网功能controller
 */
@Controller
@RequestMapping("/functionView/rip")
public class RipController {

    @Autowired
    private RipsService ripsService;
    /**
     * 真实子网列表页跳转
     * @return
     */
    @GetMapping(value = "/index")
    public String index() {
        return "/console/rip/rip_index";
    }

    /**
     * 真实子网列表
     * @param rip
     * @return
     */
    @GetMapping(value = "/ripList")
    @ResponseBody
    public ModelMap ripList(Rips rip) {
        ModelMap map = new ModelMap();
        List<Rips> Lists = ripsService.getPageList(rip);
        for (Rips list : Lists) {
            list.integer2IPV4_startIp();
            list.integer2IPV4_endIp();
        }
        map.put("queryParam", rip);
        map.put("pageInfo", new PageInfo<Rips>(Lists));
        return ReturnUtil.Success("加载成功", map, null);
    }

    /**
     * 真实子网添加页面
     * @return
     */
    @GetMapping(value = "/ripAdd")
    public String ripAdd() {
        return "/console/rip/rip_add";
    }

    /**
     * 添加真实子网
     * @param rips
     * @param result
     * @return
     */
    @Transactional
    @RequestMapping(value = "/ripSave", method = {RequestMethod.POST})
    @ResponseBody
    public ModelMap RipsSave(@Valid Rips rips, BindingResult result) {
        try {
            if (result.hasErrors()) {
                for (ObjectError er : result.getAllErrors())
                    return ReturnUtil.Error(er.getDefaultMessage(), null, null);
            }
            Integer netCount = ripsService.getCountByNet(rips.getNet());
            if(netCount>0) {
                return  ReturnUtil.Error("网络名称重复！", null, null);
            }
            rips.IPV42Integer_startIp(rips.getStartIpString());
            rips.IPV42Integer_endIp(rips.getEndIpString());
            if((rips.getEndIp()-rips.getStartIp())<= 0){
                return ReturnUtil.Error("结束地址IP必须大于起始地址IP！", null, null);
            }
            String Id = UuidUtil.getUUID();
            rips.setId(Id);
            rips.setNet(rips.getNet());
            rips.setVirtualPeriod(rips.getVirtualPeriod());
            rips.setGateway(rips.getGateway());
            String rips_start_str = rips.getStartIpString();
            String rips_end_str = rips.getEndIpString();
            rips.IPV42Integer_startIp(rips_start_str);
            rips.IPV42Integer_endIp(rips_end_str);
            rips.setCreateTime(DateUtil.getCurrentTime());
            System.out.println("test="+rips.getVirtualPeriod());

            ripsService.insert(rips);
            return ReturnUtil.Success("操作成功", null, "/functionView/rip/index");
        }catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ReturnUtil.Error("操作失败", null, null);
        }
    }

    /**
     * 真实子网删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/ripDelete", method = {RequestMethod.GET})
    @ResponseBody
    public ModelMap ripDelete(String ids) {  //真实网络删除函数
        try {
            if (StringUtils.isNotEmpty(ids)) {
               String[] idList =  ids.split(",");
                    for (String id : idList) {
                        ripsService.deleteById(id);
                }
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
