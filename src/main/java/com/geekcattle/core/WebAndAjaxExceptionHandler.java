//package com.geekcattle.core;
//
//import com.geekcattle.util.ReturnUtil;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Created by 王鹏豪 on 2018/10/24.
// */
//@ControllerAdvice
//public class WebAndAjaxExceptionHandler {
//
//    static final String TO_URL = "/403";
//
//
//    /**
//     * ajax与uil访问异常都可以被拦截
//     * <p>Title: errExceyion</p>
//     * <p>Description: </p>
//     *
//     * @param request
//     * @param response
//     * @param e
//     * @return
//     * @throws Exception
//     */
//    @ExceptionHandler(value = Exception.class)
//    public Object errExceyion(HttpServletRequest request, HttpServletResponse response, Exception e) throws Exception {
//        e.printStackTrace();
//        if (isAjax(request)) {
//            return   ReturnUtil.Error("操作失败", null, null);
//        } else {
//            ModelAndView mav = new ModelAndView();
//            mav.addObject("e", e);
//            mav.addObject("url", request.getRequestURI());
//            mav.setViewName(TO_URL);
//            return mav;
//        }
//    }
//
//    /**
//     * 判断是否是ajax请求
//     * <p>Title: isAjax</p>
//     * <p>Description: </p>
//     *
//     * @param httpRequest
//     * @return
//     */
//    public static boolean isAjax(HttpServletRequest httpRequest) {
//        return (httpRequest.getHeader("X-Requested-With") != null
//                && "XMLHttpRequest"
//                .equals(httpRequest.getHeader("X-Requested-With").toString()));
//    }
//}
