package com.geekcattle.model.switches;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.*;

@Table(name = "flow_table")
public class FlowTable extends BaseEntity implements Serializable {
    /**
     * 交换机的流表id
     */
    @Id
    @Column(name = "flow_table_id")
    @GeneratedValue(generator = "UUID")
    private String flowTableId;

    private Integer id;

    @Column(name = "active_flows")
    private Integer activeFlows;

    /**
     * 该流表查看的包数量
     */
    @Column(name = "packets_looked_up")
    private BigInteger packetsLookedUp;

    /**
     * 匹配的包数量
     */
    @Column(name = "packets_matched")
    private BigInteger packetsMatched;

    /**
     * 交换机id
     */
    @Column(name = "switches_id")
    private String switchesId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" ,  timezone="GMT+8")
    private Date createTime;

    /**
     * 获取交换机的流表id
     *
     * @return flow_table_id - 交换机的流表id
     */
    public String getFlowTableId() {
        return flowTableId;
    }

    /**
     * 设置交换机的流表id
     *
     * @param flowTableId 交换机的流表id
     */
    public void setFlowTableId(String flowTableId) {
        this.flowTableId = flowTableId;
    }

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return active_flows
     */
    public Integer getActiveFlows() {
        return activeFlows;
    }

    /**
     * @param activeFlows
     */
    public void setActiveFlows(Integer activeFlows) {
        this.activeFlows = activeFlows;
    }

    /**
     * 获取该流表查看的包数量
     *
     * @return packets_looked_up - 该流表查看的包数量
     */
    public BigInteger getPacketsLookedUp() {
        return packetsLookedUp;
    }

    /**
     * 设置该流表查看的包数量
     *
     * @param packetsLookedUp 该流表查看的包数量
     */
    public void setPacketsLookedUp(BigInteger packetsLookedUp) {
        this.packetsLookedUp = packetsLookedUp;
    }

    /**
     * 获取匹配的包数量
     *
     * @return packets_matched - 匹配的包数量
     */
    public BigInteger getPacketsMatched() {
        return packetsMatched;
    }

    /**
     * 设置匹配的包数量
     *
     * @param packetsMatched 匹配的包数量
     */
    public void setPacketsMatched(BigInteger packetsMatched) {
        this.packetsMatched = packetsMatched;
    }

    /**
     * 获取交换机id
     *
     * @return switches_id - 交换机id
     */
    public String getSwitchesId() {
        return switchesId;
    }

    /**
     * 设置交换机id
     *
     * @param switchesId 交换机id
     */
    public void setSwitchesId(String switchesId) {
        this.switchesId = switchesId;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    @Transient
    @JsonIgnore
    private String sort = "";

    @Transient
    @JsonIgnore
    private String order = "";

    public void setSort(String sort) {
        this.sort = sort;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getSort() {
        return sort;
    }

    public String getOrder() {
        return order;
    }
}