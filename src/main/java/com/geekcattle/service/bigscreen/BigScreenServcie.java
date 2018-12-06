package com.geekcattle.service.bigscreen;

import com.geekcattle.model.blacklist.BlackList;

import java.util.List;
import java.util.Map;

/**
 * 黑名单service接口
 */
public interface BigScreenServcie {
    /**
     * 获取大屏数据展示的交换机和主机数量
     * @return 交换机数量和主机数量
     */
   Map getSwitchAndHostNumForBigScreen();

    /**
     * 获取监控的会话数量
     * @return
     */
   Map getSessionNumForBigScreen();

    /**
     * 总流量的个数
     * @return
     */
   Map getFlowTableNumForBigScreen();
}
