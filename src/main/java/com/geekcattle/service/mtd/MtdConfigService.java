package com.geekcattle.service.mtd;

import com.geekcattle.model.mtd.MtdConfig2;

import java.util.List;

public interface MtdConfigService {
    /**
     * 列表分页查询
     * @param mtdConfig2
     * @return
     */
    List<MtdConfig2> getPageList(MtdConfig2 mtdConfig2);
}
