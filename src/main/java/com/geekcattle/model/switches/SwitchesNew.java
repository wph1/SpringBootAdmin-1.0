package com.geekcattle.model.switches;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "switches_new")
public class SwitchesNew  extends BaseEntity implements Serializable {
    @Id
    @Column(name = "switches_id")
    @GeneratedValue(generator = "UUID")
    private String switchesId;

    @Column(name = "switches_name")
    private String switchesName;

    @Column(name = "create_time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" ,  timezone="GMT+8")
    private Date createTime;

    /**
     * @return switches_id
     */
    public String getSwitchesId() {
        return switchesId;
    }

    /**
     * @param switchesId
     */
    public void setSwitchesId(String switchesId) {
        this.switchesId = switchesId;
    }

    /**
     * @return switches_name
     */
    public String getSwitchesName() {
        return switchesName;
    }

    /**
     * @param switchesName
     */
    public void setSwitchesName(String switchesName) {
        this.switchesName = switchesName;
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