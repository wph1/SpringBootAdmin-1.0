package com.geekcattle.model.mtd;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Table(name = "mtd_dynamic_port")
public class MtdDynamicPort {
    /**
     * 主键id与mtd主表关联
     */
    @Column(name = "dynamicport_id")
    @GeneratedValue(generator = "UUID")
    private String dynamicportId;

    /**
     * 交换机端口
     */
    @Column(name = "switch_port")
    private String switchPort;

    /**
     * mtd主表关联id
     */
    @Column(name = "mtd_id")
    private String mtdId;

    /**
     * 获取主键id与mtd主表关联
     *
     * @return dynamicport_id - 主键id与mtd主表关联
     */
    public String getDynamicportId() {
        return dynamicportId;
    }

    /**
     * 设置主键id与mtd主表关联
     *
     * @param dynamicportId 主键id与mtd主表关联
     */
    public void setDynamicportId(String dynamicportId) {
        this.dynamicportId = dynamicportId;
    }

    /**
     * 获取交换机端口
     *
     * @return switch_port - 交换机端口
     */
    public String getSwitchPort() {
        return switchPort;
    }

    /**
     * 设置交换机端口
     *
     * @param switchPort 交换机端口
     */
    public void setSwitchPort(String switchPort) {
        this.switchPort = switchPort;
    }

    /**
     * 获取mtd主表关联id
     *
     * @return mtd_id - mtd主表关联id
     */
    public String getMtdId() {
        return mtdId;
    }

    /**
     * 设置mtd主表关联id
     *
     * @param mtdId mtd主表关联id
     */
    public void setMtdId(String mtdId) {
        this.mtdId = mtdId;
    }

    /**
     * 创建时间
     */
    @Column(name = "create_at")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",  timezone="GMT+8")
    private Date createAt;

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
}