package com.geekcattle;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
/**
 * Created by 王鹏豪 on 2018/9/27.
 * <ol>
 * <li>创建文档</li>
 * <li>部署到JavaEE容器时修改启动类，
 * 继承 SpringBootServletInitializer 并重写 configure 方法</li>
 * <li>
 * <pre>
 *     部署到JavaEE容器(参照pom-war.xml):
 *     1.继承 SpringBootServletInitializer 并重写 configure 方法
 *     2.修改pom文件中jar 为 war
 *     3.修改pom，排除嵌入web容器的插件
 *     4.使用命令 mvn clean package 打包后，同一般J2EE项目一样部署到web容器
 *     </pre>
 * </li>
 * </ol>
 * <ol>

 */
public class SpringBootStartApplication  extends SpringBootServletInitializer{
    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        log.info("----------------\n\t以web容器方式启动:{}\n----------------", Application.class);
        return builder.sources(Application.class);
    }

}
