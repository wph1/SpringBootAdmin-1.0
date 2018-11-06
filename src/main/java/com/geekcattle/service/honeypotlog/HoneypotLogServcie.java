package com.geekcattle.service.honeypotlog;

import com.geekcattle.model.honeypotlog.HoneypotLog;

import java.util.List;

/**
 * 蜜罐日志接口
 */
public interface HoneypotLogServcie {
    /**
     * 列表分页查询
     * @param honeypotLog
     * @return
     */
     List<HoneypotLog> getPageList(HoneypotLog honeypotLog);

    /**
     *从odl获取日志信息并 保存日志信息
     */
    void saveHoneypotLogDataByOdl();

}
