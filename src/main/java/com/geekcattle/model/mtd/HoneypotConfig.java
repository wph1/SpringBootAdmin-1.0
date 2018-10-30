package com.geekcattle.model.mtd;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "honeypot_config")
public class HoneypotConfig extends BaseEntity implements Serializable {
    /**
     * 蜜罐配置id
     */
    @Id
    @Column(name = "honeypot_config_id")
    @GeneratedValue(generator = "UUID")
    private String honeypotConfigId;

    /**
     * 蜜罐IP
     */
    @Column(name = "honeypot_ip")
    private String honeypotIp;

    /**
     * 蜜罐服务器mac地址
     */
    @Column(name = "honeypot_mac")
    private String honeypotMac;
    /**
     * 蜜罐网关
     */
    @Column(name = "honeypot_gateway")
    private String honeypotGateway;

    public String getHoneypotGateway() {
        return honeypotGateway;
    }

    public void setHoneypotGateway(String honeypotGateway) {
        this.honeypotGateway = honeypotGateway;
    }

    /**
     * 蜜罐所接交换机及端口
     */
    @Column(name = "honeypot_switch_port")
    private String honeypotSwitchPort;

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
     * 获取蜜罐配置id
     *
     * @return honeypot_config_id - 蜜罐配置id
     */
    public String getHoneypotConfigId() {
        return honeypotConfigId;
    }

    /**
     * 设置蜜罐配置id
     *
     * @param honeypotConfigId 蜜罐配置id
     */
    public void setHoneypotConfigId(String honeypotConfigId) {
        this.honeypotConfigId = honeypotConfigId;
    }

    /**
     * 获取蜜罐IP
     *
     * @return honeypot_ip - 蜜罐IP
     */
    public String getHoneypotIp() {
        return honeypotIp;
    }

    /**
     * 设置蜜罐IP
     *
     * @param honeypotIp 蜜罐IP
     */
    public void setHoneypotIp(String honeypotIp) {
        this.honeypotIp = honeypotIp;
    }

    /**
     * 获取蜜罐服务器mac地址
     *
     * @return honeypot_mac - 蜜罐服务器mac地址
     */
    public String getHoneypotMac() {
        return honeypotMac;
    }

    /**
     * 设置蜜罐服务器mac地址
     *
     * @param honeypotMac 蜜罐服务器mac地址
     */
    public void setHoneypotMac(String honeypotMac) {
        this.honeypotMac = honeypotMac;
    }

    /**
     * 获取蜜罐所接交换机及端口
     *
     * @return honeypot_switch_port - 蜜罐所接交换机及端口
     */
    public String getHoneypotSwitchPort() {
        return honeypotSwitchPort;
    }

    /**
     * 设置蜜罐所接交换机及端口
     *
     * @param honeypotSwitchPort 蜜罐所接交换机及端口
     */
    public void setHoneypotSwitchPort(String honeypotSwitchPort) {
        this.honeypotSwitchPort = honeypotSwitchPort;
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