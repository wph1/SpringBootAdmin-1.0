package com.geekcattle.core;
//import com.base.core.domain.shiro.ShiroConfig;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * Created by 王鹏豪 on 2018/10/8.
 */
@Aspect
@Component
public class QxDataAop {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 定义一个切入点.
     * 解释下：
     * <p>
     * ~ 第一个 * 代表任意修饰符及任意返回值.
     * ~ 第二个 * 任意包名
     * ~ 第三个 * 代表任意方法.
     * ~ 第四个 * 定义在web包或者子包
     * ~ 第五个 * 任意方法
     * ~ .. 匹配任意数量的参数.
     */
    @Pointcut("execution(public * com.jms.dao..*.*(..))")
    public void executeJmsDao() {
    }

    private String getParameterMap(String key) {
        Map mapParam = JsonHelp.getRequest().getParameterMap();
        Object objVal = mapParam.get(key);
        String str = "";
        if (null == objVal) {
            str = "";
        } else if (objVal instanceof String[]) {
            String[] values = (String[]) objVal;
            for (String value : values) {
                str = value + ",";
            }
            str = str.substring(0, str.length() - 1);
        } else {
            str = objVal.toString();
        }
        return str;
    }

    @Around(value = "executeJmsDao()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        // 接收到请求，记录请求内容
//        String sqlWhere = (String) ShiroConfig.getSession("QX_DATA");
        String sqlWhere="";
        String cmdSjqx = getParameterMap("CMD_SJQX");
        if ("0".equals(cmdSjqx) || null == sqlWhere || sqlWhere.isEmpty()) {
            return pjp.proceed(pjp.getArgs());
        }

        String classMethod = pjp.getSignature().getDeclaringTypeName() + "." + pjp.getSignature().getName();
        log.info("{}请求->{} 调用方法:{}",
                JsonHelp.getRequest().getMethod(),
                JsonHelp.getRequest().getRequestURI(),
                classMethod);

        int iArg = 0;
        Object[] args = pjp.getArgs();
        Map mapArgs;
        //从参数列表中获取参数对象
        for (Object obj : args) {//查看参数值
            if (obj instanceof Map) {
                mapArgs = (Map) obj;
                //SingletonMap是不允许修改值
                if (obj.getClass().toString().contains("SingletonMap")) {
                    mapArgs = new HashMap();
                    mapArgs.putAll((Map) obj);
                }
                //参数中有CMD_SJQX=0,USER_ID 或JG_DM为空时不添加数据范围
                log.info("动态追加数据权限参数:{}", sqlWhere);
                mapArgs.put("QX_DATA", sqlWhere);

                args[iArg] = mapArgs;
                break;
            } else if (obj instanceof List) {
                List list = (List) obj;
                if (list.size() > 0) {
                    Object objTem = list.get(0);
                    if (objTem instanceof Map) {
//                        mapArgs = (Map) list.get(0);
                        mapArgs = (Map) objTem;

                        //SingletonMap是不允许修改值
                        if (objTem.getClass().toString().contains("SingletonMap")) {
                            mapArgs = new HashMap();
                            mapArgs.putAll((Map) objTem);
                        }

                        log.info("动态追加数据权限参数:{}", sqlWhere);
                        mapArgs.put("QX_DATA", sqlWhere);

                        //取代原值
                        list.set(0, mapArgs);
                        args[iArg] = list;
                        break;
                    }
                }
            }
            ++iArg;
        }
        return pjp.proceed(args);
    }

}
