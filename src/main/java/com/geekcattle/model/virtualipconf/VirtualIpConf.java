package com.geekcattle.model.virtualipconf;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "virtual_ip_conf")
public class VirtualIpConf extends BaseEntity implements Serializable {
    /**
     * 虚拟ip配置id
     */
    @Id
    @Column(name = "virtual_ip_conf_id")
    @GeneratedValue(generator = "UUID")
    private String virtualIpConfId;

    /**
     * 虚拟ip开始
     */
    @Column(name = "start_ip")
    private String startIp;

    /**
     * 虚拟ip结束
     */
    @Column(name = "end_ip")
    private String endIp;

    /**
     * 创建时间
     */
    @Column(name = "create_at")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createAt;
    /**
     * 虚拟ip池是否开启 1-开启 ，0-不开气，默认-0
     */
    @Column(name = "virtual_ip_conf_status")
    private Integer virtualIpConfStatus;

    public Integer getVirtualIpConfStatus() {
        return virtualIpConfStatus;
    }

    public void setVirtualIpConfStatus(Integer virtualIpConfStatus) {
        this.virtualIpConfStatus = virtualIpConfStatus;
    }

    /**
     * 获取虚拟ip配置id
     *
     * @return virtual_ip_conf_id - 虚拟ip配置id
     */
    public String getVirtualIpConfId() {
        return virtualIpConfId;
    }

    /**
     * 设置虚拟ip配置id
     *
     * @param virtualIpConfId 虚拟ip配置id
     */
    public void setVirtualIpConfId(String virtualIpConfId) {
        this.virtualIpConfId = virtualIpConfId;
    }

    /**
     * 获取虚拟ip开始
     *
     * @return start_ip - 虚拟ip开始
     */
    public String getStartIp() {
        return startIp;
    }

    /**
     * 设置虚拟ip开始
     *
     * @param startIp 虚拟ip开始
     */
    public void setStartIp(String startIp) {
        this.startIp = startIp;
    }

    /**
     * 获取虚拟ip结束
     *
     * @return end_ip - 虚拟ip结束
     */
    public String getEndIp() {
        return endIp;
    }

    /**
     * 设置虚拟ip结束
     *
     * @param endIp 虚拟ip结束
     */
    public void setEndIp(String endIp) {
        this.endIp = endIp;
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