package com.geekcattle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;



//@MapperScan("com.geekcattle.mapper.**")
//@MapperScan(basePackages = {"com.base.core.dao","com.base.dao"})
@SpringBootApplication//SpringBoot启动核心
@EnableWebMvc//启动MVC
@EnableTransactionManagement // 启注解事务管理
public class Application extends WebMvcConfigurerAdapter {

    /**
     * 如果要发布到自己的Tomcat中的时候，需要继承SpringBootServletInitializer类，并且增加如下的configure方法。
     * 如果不发布到自己的Tomcat中的时候，就无需上述的步骤
     */
   /* @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.clas);
    }*/
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    // 启动的时候要注意，由于我们在controller中注入了RestTemplate，所以启动的时候需要实例化该类的一个实例
    @Autowired
    private RestTemplateBuilder builder;

    // 使用RestTemplateBuilder来实例化RestTemplate对象，spring默认已经注入了RestTemplateBuilder实例
    @Bean
    public RestTemplate restTemplate() {
        return builder.build();
    }
}
