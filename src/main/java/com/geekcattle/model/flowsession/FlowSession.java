package com.geekcattle.model.flowsession;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "flow_session")
public class FlowSession  extends BaseEntity implements Serializable {
    /**
     * id
     */
    private String id;

    /**
     * session信息id
     */
    @Id
    @Column(name = "sessionid")
    @GeneratedValue(generator = "UUID")
    private String sessionId;

    /**
     * 源虚拟MAC地址
     */
    @Column(name = "src_v_mac")
    private String srcVMac;

    /**
     * 目的真实MAC
     */
    @Column(name = "dst_mac")
    private String dstMac;

    /**
     * 目的服务端口
     */
    @Column(name = "dst_port")
    private String dstPort;

    /**
     * 协议类型
     */
    private String proto;

    /**
     * 目的虚拟IP
     */
    @Column(name = "dst_v_ip")
    private String dstVIp;

    /**
     * 目的虚拟MAC地址
     */
    @Column(name = "dst_v_mac")
    private String dstVMac;

    /**
     * 源真实MAC
     */
    @Column(name = "src_mac")
    private String srcMac;

    /**
     * 目的真实IP
     */
    @Column(name = "dst_ip")
    private String dstIp;

    /**
     * 路径是否动态跳变
     */
    @Column(name = "s_type")
    private String sType;

    /**
     * 源真实IP
     */
    @Column(name = "src_ip")
    private String srcIp;

    /**
     * 路径跳变周期
     */
    @Column(name = "topo_mutation")
    private String topoMutation;

    /**
     * 源服务端口
     */
    @Column(name = "src_port")
    private String srcPort;

    /**
     * 会话生命(存活)周期
     */
    private String ttl;

    /**
     * 源虚拟ip
     */
    @Column(name = "src_v_ip")
    private String srcVIp;

    /**
     * 创建时间
     */
    @Column(name = "create_at")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createAt;

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

    /**
     * 获取id
     *
     * @return id - id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置id
     *
     * @param id id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取session信息id
     *
     * @return sessionId - session信息id
     */
    public String getSessionId() {
        return sessionId;
    }

    /**
     * 设置session信息id
     *
     * @param sessionId session信息id
     */
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    /**
     * 获取源虚拟MAC地址
     *
     * @return src_v_mac - 源虚拟MAC地址
     */
    public String getSrcVMac() {
        return srcVMac;
    }

    /**
     * 设置源虚拟MAC地址
     *
     * @param srcVMac 源虚拟MAC地址
     */
    public void setSrcVMac(String srcVMac) {
        this.srcVMac = srcVMac;
    }

    /**
     * 获取目的真实MAC
     *
     * @return dst_mac - 目的真实MAC
     */
    public String getDstMac() {
        return dstMac;
    }

    /**
     * 设置目的真实MAC
     *
     * @param dstMac 目的真实MAC
     */
    public void setDstMac(String dstMac) {
        this.dstMac = dstMac;
    }

    /**
     * 获取目的服务端口
     *
     * @return dst_port - 目的服务端口
     */
    public String getDstPort() {
        return dstPort;
    }

    /**
     * 设置目的服务端口
     *
     * @param dstPort 目的服务端口
     */
    public void setDstPort(String dstPort) {
        this.dstPort = dstPort;
    }

    /**
     * 获取协议类型
     *
     * @return proto - 协议类型
     */
    public String getProto() {
        return proto;
    }

    /**
     * 设置协议类型
     *
     * @param proto 协议类型
     */
    public void setProto(String proto) {
        this.proto = proto;
    }

    /**
     * 获取目的虚拟IP
     *
     * @return dst_v_ip - 目的虚拟IP
     */
    public String getDstVIp() {
        return dstVIp;
    }

    /**
     * 设置目的虚拟IP
     *
     * @param dstVIp 目的虚拟IP
     */
    public void setDstVIp(String dstVIp) {
        this.dstVIp = dstVIp;
    }

    /**
     * 获取目的虚拟MAC地址
     *
     * @return dst_v_mac - 目的虚拟MAC地址
     */
    public String getDstVMac() {
        return dstVMac;
    }

    /**
     * 设置目的虚拟MAC地址
     *
     * @param dstVMac 目的虚拟MAC地址
     */
    public void setDstVMac(String dstVMac) {
        this.dstVMac = dstVMac;
    }

    /**
     * 获取源真实MAC
     *
     * @return src_mac - 源真实MAC
     */
    public String getSrcMac() {
        return srcMac;
    }

    /**
     * 设置源真实MAC
     *
     * @param srcMac 源真实MAC
     */
    public void setSrcMac(String srcMac) {
        this.srcMac = srcMac;
    }

    /**
     * 获取目的真实IP
     *
     * @return dst_ip - 目的真实IP
     */
    public String getDstIp() {
        return dstIp;
    }

    /**
     * 设置目的真实IP
     *
     * @param dstIp 目的真实IP
     */
    public void setDstIp(String dstIp) {
        this.dstIp = dstIp;
    }

    /**
     * 获取路径是否动态跳变
     *
     * @return s_type - 路径是否动态跳变
     */
    public String getsType() {
        return sType;
    }

    /**
     * 设置路径是否动态跳变
     *
     * @param sType 路径是否动态跳变
     */
    public void setsType(String sType) {
        this.sType = sType;
    }

    /**
     * 获取源真实IP
     *
     * @return src_ip - 源真实IP
     */
    public String getSrcIp() {
        return srcIp;
    }

    /**
     * 设置源真实IP
     *
     * @param srcIp 源真实IP
     */
    public void setSrcIp(String srcIp) {
        this.srcIp = srcIp;
    }

    /**
     * 获取路径跳变周期
     *
     * @return topo_mutation - 路径跳变周期
     */
    public String getTopoMutation() {
        return topoMutation;
    }

    /**
     * 设置路径跳变周期
     *
     * @param topoMutation 路径跳变周期
     */
    public void setTopoMutation(String topoMutation) {
        this.topoMutation = topoMutation;
    }

    /**
     * 获取源服务端口
     *
     * @return src_port - 源服务端口
     */
    public String getSrcPort() {
        return srcPort;
    }

    /**
     * 设置源服务端口
     *
     * @param srcPort 源服务端口
     */
    public void setSrcPort(String srcPort) {
        this.srcPort = srcPort;
    }

    /**
     * 获取会话生命(存活)周期
     *
     * @return ttl - 会话生命(存活)周期
     */
    public String getTtl() {
        return ttl;
    }

    /**
     * 设置会话生命(存活)周期
     *
     * @param ttl 会话生命(存活)周期
     */
    public void setTtl(String ttl) {
        this.ttl = ttl;
    }

    /**
     * 获取源虚拟ip
     *
     * @return src_v_ip - 源虚拟ip
     */
    public String getSrcVIp() {
        return srcVIp;
    }

    /**
     * 设置源虚拟ip
     *
     * @param srcVIp 源虚拟ip
     */
    public void setSrcVIp(String srcVIp) {
        this.srcVIp = srcVIp;
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


}