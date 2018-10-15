/*
 * Copyright (c) 2017 <l_iupeiyu@qq.com> All rights reserved.
 */

package com.geekcattle.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;


@Configuration
public class ErrorPageConfig {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Bean
    public EmbeddedServletContainerCustomizer embeddedServletContainerCustomizer() {
        return new EmbeddedServletContainerCustomizer() {
            public void customize(ConfigurableEmbeddedServletContainer container) {
                ErrorPage error400Page = new ErrorPage(HttpStatus.BAD_REQUEST, "/error/400.htm");
                ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/error/401.htm");
                ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/403");
                ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/403");

                container.addErrorPages(error400Page, error401Page, error404Page, error500Page);
            }
        };
    }

}






