package com.geekcattle.service.switches.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.geekcattle.mapper.switches.FlowInstructionMapper;
import com.geekcattle.mapper.switches.FlowTableDetailsMapper;
import com.geekcattle.mapper.switches.FlowTableMapper;
import com.geekcattle.mapper.switches.SwitchesNewMapper;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.console.Switches;
import com.geekcattle.model.switches.FlowInstruction;
import com.geekcattle.model.switches.FlowTable;
import com.geekcattle.model.switches.FlowTableDetails;
import com.geekcattle.model.switches.SwitchesNew;
import com.geekcattle.service.switches.FlowTableService;
import com.geekcattle.service.switches.SwitchesNewService;
import com.geekcattle.util.JsonUtil;
import com.geekcattle.util.PasswordUtil;
import com.geekcattle.util.UuidUtil;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.math.BigInteger;
import java.util.*;

/**
 * Created by 王鹏豪 on 2018/10/23.
 */
@Service
public class FlowTableServiceImpl implements FlowTableService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private FlowTableMapper flowTableMapper;
    @Autowired
    private SwitchesNewMapper switchesNewMapper;
    @Autowired
    private FlowTableDetailsMapper flowTableDetailsMapper;
    @Autowired
    private FlowInstructionMapper flowInstructionMapper;
    @Value("${odlIpAndPort}")
    private String odlIpAndPort;

    /**
     * 根据条件查询流表数据
     * @param example
     * @return
     */
    @Override
    public List<FlowTable> getByExample(Example example) {
        return flowTableMapper.selectByExample(example);
    }

    /**
     * 获取交换机流表信息
     */
    @Override
    @Transactional
    public void getSwitchFlow() {
        List<SwitchesNew> switchesNews = switchesNewMapper.selectAll();
        for(SwitchesNew s:switchesNews){
            //交换机名称
            String switchesName = s.getSwitchesName();
            logger.info("====> 交换机名称："+switchesName);
            String url_switch = odlIpAndPort+"/restconf/operational/opendaylight-inventory:nodes/node/"+switchesName+"/flow-node-inventory:table/0";
            String username = "admin";
            String password = "admin";
            HttpRequest.setBasicAuth(PasswordUtil.getBasicAuthStr(username,password));
            String str_switchData = "";
            try {
                str_switchData =    HttpRequest.sendGet(url_switch,"");
                System.err.println(str_switchData);
            }catch (Exception e){
                logger.error("====> 交换机："+switchesName+","+e.getMessage());
                continue;
            }

            //判断一个字符串是否是一个合法的json对象
            if(!JsonUtil.isJSONValid(str_switchData)){
                logger.info("====> 交换机："+switchesName+",获取到的流表数据有问题");
                //不是合法的字符串数据，证明请求有问题
                continue;
            }
            JSONObject jsonObject = JSON.parseObject(str_switchData);
            //交换机的流表
            JSONArray flowTable =   jsonObject.getJSONArray("flow-node-inventory:table");
            if(flowTable==null){
                logger.info("====> 交换机："+switchesName+",没有流表信息");
                continue;
            }
            System.err.println("flowTable:::"+flowTable);
            for(int i=0;i<flowTable.size();i++){
                //单个流表对象
                JSONObject flow =flowTable.getJSONObject(i);
                //流表
                System.err.println("流表:"+flow);
                JSONObject flow_Table = flow.getJSONObject("opendaylight-flow-table-statistics:flow-table-statistics");

                System.err.println("flow_Table数据:"+flow_Table);
                Integer id = flow.getInteger("id");
                BigInteger packets_matched = flow_Table.getBigInteger("packets-matched");
                BigInteger packets_looked_up = flow_Table.getBigInteger("packets-looked-up");
                String active_flows = flow_Table.getString("active-flows");
                //插入流表主表数据===========
                FlowTable flowTable1 = new FlowTable();
                flowTable1.setActiveFlows(active_flows==null?0:Integer.parseInt(active_flows));
                flowTable1.setCreateTime(new Date());
                flowTable1.setId(id);
                String fowTableId = UuidUtil.getUUID();
                flowTable1.setFlowTableId(fowTableId);
                flowTable1.setPacketsLookedUp(packets_looked_up==null?new BigInteger("0"):packets_matched);
                flowTable1.setPacketsMatched(packets_matched==null?new BigInteger("0"):packets_matched);
            flowTable1.setSwitchesId(s.getSwitchesName());//交换机name
                logger.info("====> 开始插入流表成功");
                flowTableMapper.insert(flowTable1);
                logger.info("====> 插入流表成功");

                System.err.println("流表id:"+id+",流表匹配报数量："+packets_matched+"流表查看报数量:"+packets_looked_up+"活跃流："+active_flows);

                //流表详细信息
                JSONArray flowDetail = flow.getJSONArray("flow");
                for(int j=0;j<flowDetail.size();j++){
                    //单个流详情对象
                    JSONObject detail =flowDetail.getJSONObject(j);
                    String detailId = detail.getString("id");

                    //字节和包数量
                    JSONObject byteAndPacket =detail.getJSONObject("opendaylight-flow-statistics:flow-statistics");
                    // 该流规则转发的比特数
                    String byte_count = byteAndPacket.getString("byte-count");
                    // 该流规则转发的包数量
                    BigInteger packet_count = byteAndPacket.getBigInteger("packet-count");
                    System.err.println("流详情id:"+detailId+",转发比特数："+byte_count+"转发包数量:"+packet_count);


                    //匹配规则
                    JSONObject match =detail.getJSONObject("match");
                    List<Integer> typeList = (List<Integer>) JSONPath.eval(match,"$..type");
                    Integer count=0;
                    if(typeList !=null && typeList.size()>0){
                        System.err.println("匹配type:"+typeList.get(0));
                        System.err.println("匹配type:"+typeList.get(0));
                        count = typeList.get(0);
                    }
                    //流表详情
                    FlowTableDetails flowTableDetails = new FlowTableDetails();
                    flowTableDetails.setCreateTime(new Date());
                    flowTableDetails.setId(detailId);
                    flowTableDetails.setByteCount(byte_count==null?0:Integer.parseInt(byte_count));
                    flowTableDetails.setPacketCount(packet_count==null?new BigInteger("0"):packet_count);
                    flowTableDetails.setMatchEthernetType(count);
                    flowTableDetails.setFlowTableId(fowTableId);
                    //详情id
                    String flowTableDetailsId = UuidUtil.getUUID();
                    flowTableDetails.setFlowTableDetailsId(flowTableDetailsId);
                    logger.info("====> 开始插入流表详情");
                    flowTableDetailsMapper.insert(flowTableDetails);
                    logger.info("====> 插入流表详情成功");
                    //动作列表对象
                    JSONObject instructions =detail.getJSONObject("instructions");
                    System.err.println("aaaaa:"+instructions);
                    if(instructions==null)
                        continue;
                    JSONArray instructionList =instructions.getJSONArray("instruction");

                    System.err.println("bbbb:"+instructionList);
                    for(int a=0;a<instructionList.size();a++){
                        JSONObject instruction =instructionList.getJSONObject(a);
                        System.err.println("cccc:"+instruction);
                        if(instruction==null)
                            continue;
                        JSONObject applyActions =instruction.getJSONObject("apply-actions");
                        JSONArray actionList =applyActions.getJSONArray("action");
                        for(int b=0;b<actionList.size();b++){//动作action
                            JSONObject action =actionList.getJSONObject(b);
                            JSONObject outputAction =action.getJSONObject("output-action");
                            String outputNodeConnector = outputAction.getString("output-node-connector");
                            String maxLength = outputAction.getString("max-length");
                            String order = outputAction.getString("order");
                            System.err.println("order:"+order+"action1:"+outputNodeConnector+",action2:"+maxLength);
                            //插入指令
                            FlowInstruction flowInstruction = new FlowInstruction();
                            flowInstruction.setCreateTime(new Date());
                            flowInstruction.setMaxLength(maxLength==null?0:Integer.parseInt(maxLength));
                            flowInstruction.setOrder(order);
                            flowInstruction.setOutputNodeConnector(outputNodeConnector);
                            flowInstruction.setFlowTableDetailsId(flowTableDetailsId);
                            logger.info("====> 开始插入流表指令");
                            flowInstructionMapper.insert(flowInstruction);
                            logger.info("====> 插入流表指令成功");

                        }
                    }

                }

            }










        }

    }

    /**
     * 通过交换机id查询流表项的id
     * @param switchesId
     * @return
     */
    @Override
    public List<Object> getSwitchesFlowDetailsBySwitchesId(String switchesId) {
        List dataList = new ArrayList();
        List<Map<String, Object>> flowDetailLists = flowTableMapper.selectFlowBySwitchesId(switchesId);
        if(flowDetailLists!=null&&flowDetailLists.size()>0){
            for(Map<String, Object> map:flowDetailLists){
                //流表项id
                String flowDetailId = MapUtils.getString(map, "id");
                    List<Map<String, Object>> flowDetailDataList = flowTableMapper.selectFlowDetailDataById(ArrayUtils.toMap(new String[][]{
                        {"switchesId", switchesId},
                        {"flowDetailId", flowDetailId},
                }));
                if(flowDetailDataList!=null&&flowDetailDataList.size()>0){
                    for(Map<String, Object> m:flowDetailDataList){
                            List data = new ArrayList();
                        data.add(MapUtils.getString(m,"byte_count"));
                        data.add(MapUtils.getString(m,"packet_count"));
                        dataList.add(data);
                    }

                }

            }


        }

        return dataList;
    }

    /**
     * 交换机流表项个数
     * @return
     */
    @Override
    public Map<String, Object> getTotalFlowDetailBySwitchesId() {
        Map flowTableData = new HashMap();
        List switchList = new ArrayList();
        List flowList = new ArrayList();

        List<SwitchesNew> switchesList = switchesNewMapper.selectAll();
        for(SwitchesNew switches:switchesList){
            switchList.add(switches.getSwitchesName());
            Map<String, Object> flowMap = flowTableMapper.getTotalFlowDetailBySwitchesId(switches.getSwitchesName());
            String total = MapUtils.getString(flowMap, "total");
            flowList.add(Integer.parseInt(total));
        }
        flowTableData.put("switchList",switchList);
        flowTableData.put("flowList",flowList);

        return flowTableData;
    }
}
