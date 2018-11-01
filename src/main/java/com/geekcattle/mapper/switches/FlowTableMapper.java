package com.geekcattle.mapper.switches;

import com.geekcattle.model.switches.FlowTable;
import com.geekcattle.util.CustomerMapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface FlowTableMapper extends CustomerMapper<FlowTable> {
    /**
     * 通过交换机id查询下面的流表项id
     * @param switchesId
     * @return
     */
   List<Map<String,Object>> selectFlowBySwitchesId(String switchesId);

    /**
     * 获取某个交换机最后10分钟的流表项个数
     * @param switchesId
     * @return
     */
   Map<String,Object> getTotalFlowDetailBySwitchesId(String switchesId);

    /**
     * 获取某个流表项的详细字节和包的数据（最近10分钟）
     * @param map
     * @return
     */
   List<Map<String,Object>> selectFlowDetailDataById(Map<Object,Object> map);
}