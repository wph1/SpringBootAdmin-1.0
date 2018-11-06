package com.geekcattle.model.honeypotlog;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "honeypot_log")
public class HoneypotLog  extends BaseEntity implements Serializable {
    /**
     * 蜜罐日志id
     */
    @Id
    @Column(name = "honeyptlog_id")
    @GeneratedValue(generator = "UUID")
    private String honeyptlogId;

    /**
     * 源mac地址
     */
    @Column(name = "src_mac")
    private String srcMac;

    /**
     * 目的mac地址
     */
    @Column(name = "dst_mac")
    private String dstMac;

    /**
     * 源ip
     */
    @Column(name = "src_ip")
    private String srcIp;

    /**
     * 目的ip
     */
    @Column(name = "dst_ip")
    private String dstIp;

    /**
     * 源端口
     */
    @Column(name = "src_port")
    private String srcPort;

    /**
     * 目的端口
     */
    @Column(name = "dst_port")
    private String dstPort;

    /**
     * 协议
     */
    private String proto;

    /**
     * 蜜罐ip
     */
    @Column(name = "honeypt_ip")
    private String honeyptIp;

    /**
     * 日志时间
     */
    private Date time;

    /**
     * 日志入库时间
     */
    @Column(name = "create_time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" ,  timezone="GMT+8")
    private Date createTime;

    /**
     * 获取蜜罐日志id
     *
     * @return honeyptlog_id - 蜜罐日志id
     */
    public String getHoneyptlogId() {
        return honeyptlogId;
    }

    /**
     * 设置蜜罐日志id
     *
     * @param honeyptlogId 蜜罐日志id
     */
    public void setHoneyptlogId(String honeyptlogId) {
        this.honeyptlogId = honeyptlogId;
    }

    /**
     * 获取源mac地址
     *
     * @return src_mac - 源mac地址
     */
    public String getSrcMac() {
        return srcMac;
    }

    /**
     * 设置源mac地址
     *
     * @param srcMac 源mac地址
     */
    public void setSrcMac(String srcMac) {
        this.srcMac = srcMac;
    }

    /**
     * 获取目的mac地址
     *
     * @return dst_mac - 目的mac地址
     */
    public String getDstMac() {
        return dstMac;
    }

    /**
     * 设置目的mac地址
     *
     * @param dstMac 目的mac地址
     */
    public void setDstMac(String dstMac) {
        this.dstMac = dstMac;
    }

    /**
     * 获取源ip
     *
     * @return src_ip - 源ip
     */
    public String getSrcIp() {
        return srcIp;
    }

    /**
     * 设置源ip
     *
     * @param srcIp 源ip
     */
    public void setSrcIp(String srcIp) {
        this.srcIp = srcIp;
    }

    /**
     * 获取目的ip
     *
     * @return dst_ip - 目的ip
     */
    public String getDstIp() {
        return dstIp;
    }

    /**
     * 设置目的ip
     *
     * @param dstIp 目的ip
     */
    public void setDstIp(String dstIp) {
        this.dstIp = dstIp;
    }

    /**
     * 获取源端口
     *
     * @return src_port - 源端口
     */
    public String getSrcPort() {
        return srcPort;
    }

    /**
     * 设置源端口
     *
     * @param srcPort 源端口
     */
    public void setSrcPort(String srcPort) {
        this.srcPort = srcPort;
    }

    /**
     * 获取目的端口
     *
     * @return dst_port - 目的端口
     */
    public String getDstPort() {
        return dstPort;
    }

    /**
     * 设置目的端口
     *
     * @param dstPort 目的端口
     */
    public void setDstPort(String dstPort) {
        this.dstPort = dstPort;
    }

    /**
     * 获取协议
     *
     * @return proto - 协议
     */
    public String getProto() {
        return proto;
    }

    /**
     * 设置协议
     *
     * @param proto 协议
     */
    public void setProto(String proto) {
        this.proto = proto;
    }

    /**
     * 获取蜜罐ip
     *
     * @return honeypt_ip - 蜜罐ip
     */
    public String getHoneyptIp() {
        return honeyptIp;
    }

    /**
     * 设置蜜罐ip
     *
     * @param honeyptIp 蜜罐ip
     */
    public void setHoneyptIp(String honeyptIp) {
        this.honeyptIp = honeyptIp;
    }

    /**
     * 获取日志时间
     *
     * @return time - 日志时间
     */
    public Date getTime() {
        return time;
    }

    /**
     * 设置日志时间
     *
     * @param time 日志时间
     */
    public void setTime(Date time) {
        this.time = time;
    }

    /**
     * 获取日志入库时间
     *
     * @return create_time - 日志入库时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置日志入库时间
     *
     * @param createTime 日志入库时间
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