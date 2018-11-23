package com.geekcattle.model.mtd;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Table(name = "mtd_mapping_port")
public class MtdMappingPort {
    /**
     * 映射端口id
     */
    @Column(name = "mappingport_id")
    @GeneratedValue(generator = "UUID")
    private String mappingportId;

    /**
     * 映射服务端口
     */
    @Column(name = "server_port")
    private String serverPort;

    /**
     * 动态端口id
     */
    @Column(name = "dynamic_port_id")
    private String dynamicPortId;

    /**
     * 获取映射端口id
     *
     * @return mappingport_id - 映射端口id
     */
    public String getMappingportId() {
        return mappingportId;
    }

    /**
     * 设置映射端口id
     *
     * @param mappingportId 映射端口id
     */
    public void setMappingportId(String mappingportId) {
        this.mappingportId = mappingportId;
    }

    /**
     * 获取映射服务端口
     *
     * @return server_port - 映射服务端口
     */
    public String getServerPort() {
        return serverPort;
    }

    /**
     * 设置映射服务端口
     *
     * @param serverPort 映射服务端口
     */
    public void setServerPort(String serverPort) {
        this.serverPort = serverPort;
    }

    /**
     * 获取动态端口id
     *
     * @return dynamic_port_id - 动态端口id
     */
    public String getDynamicPortId() {
        return dynamicPortId;
    }

    /**
     * 设置动态端口id
     *
     * @param dynamicPortId 动态端口id
     */
    public void setDynamicPortId(String dynamicPortId) {
        this.dynamicPortId = dynamicPortId;
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