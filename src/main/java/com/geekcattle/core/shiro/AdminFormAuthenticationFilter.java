/*
 * Copyright (c) 2017 <l_iupeiyu@qq.com> All rights reserved.
 */

package com.geekcattle.core.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import com.geekcattle.core.LoginEnum;


/**
 * author geekcattle
 * date 2017/3/21 0021 下午 16:33
 */
public class AdminFormAuthenticationFilter extends FormAuthenticationFilter {
	//解决一个浏览器登陆冲突问题
	 @Override
	    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
	        Subject subject = getSubject(request, response);
	        if(subject.getPrincipal() != null){
	            Session session = subject.getSession();
	            if(session.getAttribute("loginType").equals(LoginEnum.ADMIN.toString())){
	                return super.isAccessAllowed(request, response, mappedValue);
	            }else{
	                return false;
	            }
	        }else{
	            return super.isAccessAllowed(request, response, mappedValue);
	        }
	    }
    @Override
    public void setLoginUrl(String loginUrl) {
        super.setLoginUrl("/console/login");
    }

    @Override
    public void setSuccessUrl(String successUrl) {
        super.setSuccessUrl("/console/index");
    }

}
