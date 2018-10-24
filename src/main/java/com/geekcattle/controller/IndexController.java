/*
 * Copyright (c) 2017 <l_iupeiyu@qq.com> All rights reserved.
 */

package com.geekcattle.controller;

import com.geekcattle.model.UserTest;
import com.geekcattle.service.UserTestService;
import com.geekcattle.util.DateUtil;
import com.geekcattle.util.ReturnUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping
public class IndexController {
    @Autowired
    private UserTestService userTestService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping
    public String index(Model model) {
        return "redirect:/console/login";
    }

    @RequestMapping(value = "/test", method = {RequestMethod.GET})
    public String test(Model model) {
        logger.debug("This is a debug message");
        logger.info("This is an info message");
        logger.warn("This is a warn message");
        logger.error("This is an error message");
        String rq = DateUtil.getCurrentTime();
        System.out.println(rq);
        model.addAttribute("rq", rq);
        return "test/test";
    }

    @ResponseBody
    @RequestMapping(value = "/testPost", method = {RequestMethod.POST})
    public String testpost(HttpServletRequest request) {
        return request.getParameter("rq");
    }

    /**
     * 测试事物问题
     *
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/testUser", method = {RequestMethod.GET})
    public ModelMap testUser(HttpServletRequest request) {
        try {
            UserTest test = new UserTest();
            test.setName("王鹏豪");
            test.setPassword("123456");
            test.setAddress("中国河南");

//        SimpleFormatter sdf = new SimpleFormatter();
//        String dateString = sdf.format(new Date());
//        test.setCreateDate();
//
            userTestService.insert(test);
//            int i=2/0;
            return ReturnUtil.Success("操作成功", null, null);
        } catch (Exception e) {
            logger.error("测试事务数据处理失败====》》》" + e.getMessage());
            return ReturnUtil.Success("操作失败", null, null);
        }


    }

    @RequestMapping("/403")
    public String forbidden() {
        return "/console/error/500";
    }

}
