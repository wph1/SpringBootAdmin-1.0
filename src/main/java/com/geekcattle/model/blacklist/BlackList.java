package com.geekcattle.model.blacklist;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "black_list")
public class BlackList extends BaseEntity implements Serializable {
    @Id
    @Column(name = "black_list_id")
    @GeneratedValue(generator = "UUID")
    private String blackListId;
    /**
     * 0-源ip，1-目的ip
     * 默认值0
     */
    @Column(name = "flag")
    private int flag;
    /**
     * 是否开启黑名单，1-开启，0-关闭
     */
    @Column(name = "is_use_black_list")
    private Integer isUseBlackList;

    @Column(name = "black_list_ip")
    private String blackListIp;

    @Column(name = "create_time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",  timezone="GMT+8")
    private Date createTime;

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    /**
     * @return black_list_id
     */
    public String getBlackListId() {
        return blackListId;
    }

    /**
     * @param blackListId
     */
    public void setBlackListId(String blackListId) {
        this.blackListId = blackListId;
    }

    /**
     * 获取是否开启黑名单，1-开启，0-关闭
     *
     * @return is_use_black_list - 是否开启黑名单，1-开启，0-关闭
     */
    public Integer getIsUseBlackList() {
        return isUseBlackList;
    }

    /**
     * 设置是否开启黑名单，1-开启，0-关闭
     *
     * @param isUseBlackList 是否开启黑名单，1-开启，0-关闭
     */
    public void setIsUseBlackList(Integer isUseBlackList) {
        this.isUseBlackList = isUseBlackList;
    }

    /**
     * @return black_list_ip
     */
    public String getBlackListIp() {
        return blackListIp;
    }

    /**
     * @param blackListIp
     */
    public void setBlackListIp(String blackListIp) {
        this.blackListIp = blackListIp;
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