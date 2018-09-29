##项目部署方式
1.将pom文件里的打包方式修改为war
2.直接运行maven的package打包命令
3.将target中的war包名称修改为ROOT.war,上传至tomcat中


##更新记录

近段时间一直忙公司的项目，忽略的本项目的更新，最近有时间了，结合ISSUES修复了jwt的一些不理想之处，更新内容如下


###更新

* 增加了JWT工具类

* 修复了jwt验证成功之后用户信息的传递，通过shiro的token登录传递，移除了以前的参数传递方法，此方法更为灵活好用

* 引入了refresh_token的概念


###更新

* 项目整合redis存储，shiro可使用redisSession可使用于集群访问

* 项目增加jwt模式

* 增加默认启动模式为开发模式

* 优化已知BUG


***

# SpringBootAdmin 微服务快速开发脚手架

## 平台简介

SpringBootAdmin是基于多个优秀的开源项目，高度整合封装而成的高效，高性能，强安全性的**开源**Java微服务快速开发框架。

SpringBootAdmin是在SpringBoot基础上搭建的一个Java基础开发框架，以Spring MVC为模型视图控制器，MyBatis为数据访问层，
Apache Shiro为权限授权层，Ehcahe或**redis**对常用数据进行缓存。

SpringBootAdmin主要定位于微应用的开发，已内置后台系统的基础功能，用户管理、角色管理、权限管理、会员管理、日志管理等；前台已经实现用户登录，注册等基础功能。
同时前后台会员实现分表管理，可扩展多角色系统、多权限系统。
采用分层设计、双重验证、提交数据安全编码、密码加密、访问验证、数据权限验证。
使用Maven做项目管理，提高项目的易开发性、扩展性。

## 内置功能

1.	管理员管理：管理员是系统操作者，该功能主要完成系统管理员相关配置和角色授权。
2.	角色管理：角色的基础功能以及角色分配权限。
3.	菜单管理：配置系统菜单，操作权限，按钮权限标识等。
4. 会员管理：对前台注册会员的基础的管理。
5.	操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。

## 技术选型

1、后端

* 核心框架：SpringBoot 1.5.2.RELEASE
* 集成运行框架：Tomcat 8.5.11
* 安全框架：Apache Shiro 1.2
* 视图框架：Spring MVC 4.1
* 服务端验证：Hibernate Validator 5.3.4
* 布局框架：Thymeleaf 1.5.2
* 持久层框架：MyBatis 3.3.1
* 数据处理框架：Mapper 3.3.9
* 数据库连接池：Alibaba Druid 1.0
* 缓存框架：Ehcache 2.6、Redis
* 日志管理：SLF4J 1.7、Log4j
* TOKEN模式： jsonwebtoken 0.6
* 工具类：Apache Commons、Jackson 2.8.5、Junit 4.12

2、前端

* JQ框架：jQuery 2.2.4
* JQ兼容插件：jQuery-Migrate 1.4.1
* CSS框架：Twitter Bootstrap 3.3.7+AdminLte 2.3.7
* 客户端验证：jQuery Validate Plugin 1.15。
* 数据表格：BootStrap-Table 1.11
* 树数据列表：jQuery-Treegrid 0.2
* 树结构控件：BootStrap-Treeview 1.2
* 工具类框架：Layer 3.0

4、平台

* 服务器中间件：项目默认支持Tomcat8.5版本，如果需要打包部署到已有的Tomcat需做特殊处理后续会更新。
* 数据库支持：目前仅提供MySql数据库的支持，但不限于数据库，后续会增加其它数据库支持接口，
* 开发环境：Java1.7以上、IDEA、Maven 3.1以上、Git

## 安全考虑

1. 开发语言：系统采用Java 语言开发，具有卓越的通用性、高效性、平台移植性和安全性。
2. 分层设计：（数据库层，数据访问层，业务逻辑层，展示层）层次清楚，低耦合，各层必须通过接口才能接入并进行参数校验（如：在展示层不可直接操作数据库），保证数据操作的安全。
3. 双重验证：用户表单提交双验证：包括服务器端验证及客户端验证，防止用户通过浏览器恶意修改（如不可写文本域、隐藏变量篡改、上传非法文件等），跳过客户端验证操作数据库。
4. 安全编码：用户表单提交所有数据，在服务器端都进行安全编码，防止用户提交非法脚本及SQL注入获取敏感数据等，确保数据安全。
5. 密码加密：登录用户密码进行SHA1散列加密，此加密方法是不可逆的。保证密文泄露后的安全问题。
6. 强制访问：系统对所有管理端链接都进行用户身份权限验证，防止用户直接填写url进行访问。



PS：测试数据库会不定期恢复。

## 快速体验

1. 具备运行环境：JDK1.7+、Maven3.0+、MySql5+。
2. 修改src\main\resources\application.properties、application-dev.properties、application-pro.properties文件中的数据库设置参数(application-dev.properties为开发环境的相应参数，application-pro.properties为部署环境的相应参数)。
3. 根据修改参数创建对应MySql数据库用户和参数。
4. 运行mvn package脚本，即可创建项目jar文件，同时也可以通过java -jar *.jar 即可本地预览
5. 将src\main\resources\geekcattle.sql导入本地数据库即可
6. 最高管理员账号，用户名：admin 密码：admin
7. 由于项目只是基础功能实现，可能还有一些没有优化到的时候，后续会持续优化和改进
