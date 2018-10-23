package com.geekcattle.model.switches;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Date;
import javax.persistence.*;

@Table(name = "switches_dip_data")
public class SwitchesDipData {
    @Id
    @Column(name = "dip_data_id")
    @GeneratedValue(generator = "UUID")
    private String dipDataId;

    private String mac;

    private String vdomain;

    private Integer count;

    private String rip;

    private String vip;

    @Column(name = "vip_last_mutation")
    private Integer vipLastMutation;

    @Column(name = "vdomain_last_mutation")
    private Integer vdomainLastMutation;

    private String vmac;

    /**
     * 交换机端口id,对应表node_connector
     */
    @Column(name = "node_connector_id")
    private String nodeConnectorId;

    @Column(name = "create_time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" ,  timezone="GMT+8")
    private Date createTime;

    /**
     * @return dip_data_id
     */
    public String getDipDataId() {
        return dipDataId;
    }

    /**
     * @param dipDataId
     */
    public void setDipDataId(String dipDataId) {
        this.dipDataId = dipDataId;
    }

    /**
     * @return mac
     */
    public String getMac() {
        return mac;
    }

    /**
     * @param mac
     */
    public void setMac(String mac) {
        this.mac = mac;
    }

    /**
     * @return vdomain
     */
    public String getVdomain() {
        return vdomain;
    }

    /**
     * @param vdomain
     */
    public void setVdomain(String vdomain) {
        this.vdomain = vdomain;
    }

    /**
     * @return count
     */
    public Integer getCount() {
        return count;
    }

    /**
     * @param count
     */
    public void setCount(Integer count) {
        this.count = count;
    }

    /**
     * @return rip
     */
    public String getRip() {
        return rip;
    }

    /**
     * @param rip
     */
    public void setRip(String rip) {
        this.rip = rip;
    }

    /**
     * @return vip
     */
    public String getVip() {
        return vip;
    }

    /**
     * @param vip
     */
    public void setVip(String vip) {
        this.vip = vip;
    }

    /**
     * @return vip_last_mutation
     */
    public Integer getVipLastMutation() {
        return vipLastMutation;
    }

    /**
     * @param vipLastMutation
     */
    public void setVipLastMutation(Integer vipLastMutation) {
        this.vipLastMutation = vipLastMutation;
    }

    /**
     * @return vdomain_last_mutation
     */
    public Integer getVdomainLastMutation() {
        return vdomainLastMutation;
    }

    /**
     * @param vdomainLastMutation
     */
    public void setVdomainLastMutation(Integer vdomainLastMutation) {
        this.vdomainLastMutation = vdomainLastMutation;
    }

    /**
     * @return vmac
     */
    public String getVmac() {
        return vmac;
    }

    /**
     * @param vmac
     */
    public void setVmac(String vmac) {
        this.vmac = vmac;
    }

    /**
     * 获取交换机端口id,对应表node_connector
     *
     * @return node_connector_id - 交换机端口id,对应表node_connector
     */
    public String getNodeConnectorId() {
        return nodeConnectorId;
    }

    /**
     * 设置交换机端口id,对应表node_connector
     *
     * @param nodeConnectorId 交换机端口id,对应表node_connector
     */
    public void setNodeConnectorId(String nodeConnectorId) {
        this.nodeConnectorId = nodeConnectorId;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
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