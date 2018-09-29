package com.geekcattle.model.console;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;

public class Switches extends BaseEntity implements Serializable{
    
	@Id
    @Column(name = "id")
    @GeneratedValue(generator = "UUID")
	private String id;
	
	private String name;
	
    @Column(name = "create_time")
    private String createTime;
	
	@Transient
	@JsonIgnore
	private String sort = "";
	    
	@Transient
	@JsonIgnore	            
	private String order = "";
	
	public String getId() {
		return id;
	}
	
	public void setId(String input) {
		this.id = input;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String input) {
		this.name = input;
	}
	
    public String getSort() {
        if(StringUtils.isEmpty(sort)){
            return "createTime";
        }else{
            return sort;
        }
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        if(StringUtils.isEmpty(sort)){
            return "desc";
        }else{
            return order;
        }
    }

    public void setOrder(String order) {
        this.order = order;
    }
	
    public String getCreateTime() {
        return createTime;
    }
    
    public void setCreateTime(String time) {
    	this.createTime = time;
    }

}
