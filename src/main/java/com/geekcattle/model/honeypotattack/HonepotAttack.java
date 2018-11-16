package com.geekcattle.model.honeypotattack;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

public class HonepotAttack extends BaseEntity implements Serializable {
    /**
     * 原ip
     */
    private String src_ip;
    /**
     * 信息
     */
    private String message;
    /**
     * 用户名
     */
    private String  username;
    /**
     * 密码
     */
   private String password;
    /**
     * 类型
     */
   private String type;
    /**
     * 事件id
     */
   private String eventid;
    /**
     * 目的端口
     */
   private Integer dest_port;
    /**
     * 目的ip
     */
   private String dest_ip;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",  timezone="GMT+8")
    private Date timestamp;
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

    public String getSrc_ip() {
        return src_ip;
    }

    public void setSrc_ip(String src_ip) {
        this.src_ip = src_ip;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEventid() {
        return eventid;
    }

    public void setEventid(String eventid) {
        this.eventid = eventid;
    }

    public Integer getDest_port() {
        return dest_port;
    }

    public void setDest_port(Integer dest_port) {
        this.dest_port = dest_port;
    }

    public String getDest_ip() {
        return dest_ip;
    }

    public void setDest_ip(String dest_ip) {
        this.dest_ip = dest_ip;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "HonepotAttack{" +
                "src_ip='" + src_ip + '\'' +
                ", message='" + message + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", type='" + type + '\'' +
                ", eventid='" + eventid + '\'' +
                ", dest_port=" + dest_port +
                ", dest_ip='" + dest_ip + '\'' +
                ", timestamp=" + timestamp +
                ", sort='" + sort + '\'' +
                ", order='" + order + '\'' +
                '}';
    }
}
