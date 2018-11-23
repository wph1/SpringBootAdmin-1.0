package com.geekcattle.model.mtd;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "mtd_config")
public class MtdConfig2 extends BaseEntity implements Serializable {
    @Id
    @Column(name = "mtd_id")
    @GeneratedValue(generator = "UUID")
    private String mtdId;

    /**
     * 导向蜜罐的流量的流表最大空闲时间
     */
    @Column(name = "honeypot_path_idle")
    private String honeypotPathIdle;

    /**
     * 可跳变的最大路径数
     */
    @Column(name = "k_path")
    private String kPath;

    /**
     * 路径跳变周期
     */
    @Column(name = "path_ttl")
    private String pathTtl;

    /**
     * mtd模式开启与否,1-开启，0-关闭
     */
    @Column(name = "is_mtd_mode")
    private Integer isMtdMode;

    /**
     * 流表最大空闲时间
     */
    @Column(name = "session_idle")
    private String sessionIdle;

    /**
     * 内网提供的开放服务的地址
     */
    @Column(name = "external_address_for_d_port")
    private String externalAddressForDPort;

    /**
     * dns转发的采用的外网地址
     */
    @Column(name = "external_address_for_dns")
    private String externalAddressForDns;

    /**
     * 内网访问外网采用的IP地址
     */
    @Column(name = "external_address_for_s_nat")
    private String externalAddressForSNat;

    /**
     * 路径跳变开启与否,1-开启，0-关闭
     */
    @Column(name = "is_path_mutation")
    private Integer isPathMutation;

    /**
     * dns服务器地址
     */
    @Column(name = "dns_forward_address")
    private String dnsForwardAddress;

    /**
     * 内部dns服务器地址
     */
    @Column(name = "dns_address")
    private String dnsAddress;

    /**
     * 出外网的端口
     */
    @Column(name = "external_switch_port")
    private String externalSwitchPort;

    /**
     * 使用蜜罐与否,1-开启，0-关闭
     */
    @Column(name = "use_honeypot")
    private Integer useHoneypot;

    /**
     * 出外网的网关
     */
    @Column(name = "external_gateway")
    private String externalGateway;

    /**
     * 创建时间
     */
    @Column(name = "create_at")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" ,  timezone="GMT+8")
    private Date createAt;

    /**
     * @return mtd_id
     */
    public String getMtdId() {
        return mtdId;
    }

    /**
     * @param mtdId
     */
    public void setMtdId(String mtdId) {
        this.mtdId = mtdId;
    }

    /**
     * 获取导向蜜罐的流量的流表最大空闲时间
     *
     * @return honeypot_path_idle - 导向蜜罐的流量的流表最大空闲时间
     */
    public String getHoneypotPathIdle() {
        return honeypotPathIdle;
    }

    /**
     * 设置导向蜜罐的流量的流表最大空闲时间
     *
     * @param honeypotPathIdle 导向蜜罐的流量的流表最大空闲时间
     */
    public void setHoneypotPathIdle(String honeypotPathIdle) {
        this.honeypotPathIdle = honeypotPathIdle;
    }

    /**
     * 获取可跳变的最大路径数
     *
     * @return k_path - 可跳变的最大路径数
     */
    public String getkPath() {
        return kPath;
    }

    /**
     * 设置可跳变的最大路径数
     *
     * @param kPath 可跳变的最大路径数
     */
    public void setkPath(String kPath) {
        this.kPath = kPath;
    }

    /**
     * 获取路径跳变周期
     *
     * @return path_ttl - 路径跳变周期
     */
    public String getPathTtl() {
        return pathTtl;
    }

    /**
     * 设置路径跳变周期
     *
     * @param pathTtl 路径跳变周期
     */
    public void setPathTtl(String pathTtl) {
        this.pathTtl = pathTtl;
    }

    /**
     * 获取mtd模式开启与否,1-开启，0-关闭
     *
     * @return is_mtd_mode - mtd模式开启与否,1-开启，0-关闭
     */
    public Integer getIsMtdMode() {
        return isMtdMode;
    }

    /**
     * 设置mtd模式开启与否,1-开启，0-关闭
     *
     * @param isMtdMode mtd模式开启与否,1-开启，0-关闭
     */
    public void setIsMtdMode(Integer isMtdMode) {
        this.isMtdMode = isMtdMode;
    }

    /**
     * 获取流表最大空闲时间
     *
     * @return session_idle - 流表最大空闲时间
     */
    public String getSessionIdle() {
        return sessionIdle;
    }

    /**
     * 设置流表最大空闲时间
     *
     * @param sessionIdle 流表最大空闲时间
     */
    public void setSessionIdle(String sessionIdle) {
        this.sessionIdle = sessionIdle;
    }

    public String getExternalAddressForDPort() {
        return externalAddressForDPort;
    }

    public void setExternalAddressForDPort(String externalAddressForDPort) {
        this.externalAddressForDPort = externalAddressForDPort;
    }

    public String getExternalAddressForDns() {
        return externalAddressForDns;
    }

    public void setExternalAddressForDns(String externalAddressForDns) {
        this.externalAddressForDns = externalAddressForDns;
    }

    public String getExternalAddressForSNat() {
        return externalAddressForSNat;
    }

    public void setExternalAddressForSNat(String externalAddressForSNat) {
        this.externalAddressForSNat = externalAddressForSNat;
    }

    /**
     * 获取路径跳变开启与否,1-开启，0-关闭
     *
     * @return is_path_mutation - 路径跳变开启与否,1-开启，0-关闭
     */
    public Integer getIsPathMutation() {
        return isPathMutation;
    }

    /**
     * 设置路径跳变开启与否,1-开启，0-关闭
     *
     * @param isPathMutation 路径跳变开启与否,1-开启，0-关闭
     */
    public void setIsPathMutation(Integer isPathMutation) {
        this.isPathMutation = isPathMutation;
    }

    /**
     * 获取dns服务器地址
     *
     * @return dns_forward_address - dns服务器地址
     */
    public String getDnsForwardAddress() {
        return dnsForwardAddress;
    }

    /**
     * 设置dns服务器地址
     *
     * @param dnsForwardAddress dns服务器地址
     */
    public void setDnsForwardAddress(String dnsForwardAddress) {
        this.dnsForwardAddress = dnsForwardAddress;
    }

    /**
     * 获取内部dns服务器地址
     *
     * @return dns_address - 内部dns服务器地址
     */
    public String getDnsAddress() {
        return dnsAddress;
    }

    /**
     * 设置内部dns服务器地址
     *
     * @param dnsAddress 内部dns服务器地址
     */
    public void setDnsAddress(String dnsAddress) {
        this.dnsAddress = dnsAddress;
    }

    /**
     * 获取出外网的端口
     *
     * @return external_switch_port - 出外网的端口
     */
    public String getExternalSwitchPort() {
        return externalSwitchPort;
    }

    /**
     * 设置出外网的端口
     *
     * @param externalSwitchPort 出外网的端口
     */
    public void setExternalSwitchPort(String externalSwitchPort) {
        this.externalSwitchPort = externalSwitchPort;
    }

    /**
     * 获取使用蜜罐与否,1-开启，0-关闭
     *
     * @return use_honeypot - 使用蜜罐与否,1-开启，0-关闭
     */
    public Integer getUseHoneypot() {
        return useHoneypot;
    }

    /**
     * 设置使用蜜罐与否,1-开启，0-关闭
     *
     * @param useHoneypot 使用蜜罐与否,1-开启，0-关闭
     */
    public void setUseHoneypot(Integer useHoneypot) {
        this.useHoneypot = useHoneypot;
    }

    /**
     * 获取出外网的网关
     *
     * @return external_gateway - 出外网的网关
     */
    public String getExternalGateway() {
        return externalGateway;
    }

    /**
     * 设置出外网的网关
     *
     * @param externalGateway 出外网的网关
     */
    public void setExternalGateway(String externalGateway) {
        this.externalGateway = externalGateway;
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