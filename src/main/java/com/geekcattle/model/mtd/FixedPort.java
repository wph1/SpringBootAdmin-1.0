package com.geekcattle.model.mtd;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "fixed_port")
public class FixedPort extends BaseEntity implements Serializable {
    /**
     * 固定静态ip
     */
    @Id
    @Column(name = "fixed_port_id")
    @GeneratedValue(generator = "UUID")
    private String fixedPortId;

    /**
     * 交换机端口
     */
    @Column(name = "switch_port")
    private String switchPort;

    /**
     * mtd的id
     */
    @Column(name = "mtd_id")
    private String mtdId;

    /**
     * 创建时间
     */
    @Column(name = "create_at")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createAt;

    /**
     * 获取固定静态ip
     *
     * @return fixed_port_id - 固定静态ip
     */
    public String getFixedPortId() {
        return fixedPortId;
    }

    /**
     * 设置固定静态ip
     *
     * @param fixedPortId 固定静态ip
     */
    public void setFixedPortId(String fixedPortId) {
        this.fixedPortId = fixedPortId;
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
     * 获取mtd的id
     *
     * @return mtd_id - mtd的id
     */
    public String getMtdId() {
        return mtdId;
    }

    /**
     * 设置mtd的id
     *
     * @param mtdId mtd的id
     */
    public void setMtdId(String mtdId) {
        this.mtdId = mtdId;
    }

    /**
     * 获取创建时间
     *
     * @return create_at - 创建时间
     */
    public Date getCreateAt() {
        return createAt;
    }

    /**
     * 设置创建时间
     *
     * @param createAt 创建时间
     */
    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
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