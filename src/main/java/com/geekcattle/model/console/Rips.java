package com.geekcattle.model.console;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;

//@Table(name = "network")
public class Rips extends BaseEntity  implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "UUID")
    private String id;
    
    @Column(name = "net")
    @NotEmpty(message="网络名字不能为空")
    private String net;
    
    @Column(name = "domain_prefix")
    @NotEmpty(message="域名前缀不能为空")
    private String prefix;
    
    @Column(name = "start_ip")
    private int startIp = 0;
    
    @Column(name = "end_ip")
    private int endIp = 0;
    
    @Column(name = "global_period")
    private int period = 0;
    
    @Column(name = "domain_period")
    private int domainPeriod = 0;
    
    @Column(name = "virtual_period")
    private int virtualPeriod = 0;
    
    @Column(name = "create_time")
    private String createTime;
    
    @NotEmpty(message="网络起始地址不能为空")
    private String startIpString;
    
    @NotEmpty(message="网络结束地址不能为空")
    private String endIpString;
    
    private String gateway;
    
    @Transient
    @JsonIgnore
    private String sort = "";

    @Transient
    @JsonIgnore
    private String order = "";

    public String getId() {
        return id;
    }

    public void setId(String uid) {
        this.id = uid;
    }
    
    public String getNet() {
        return net;
    }
    
    public void setNet(String net) {
        this.net = net;
    }
    
    public String getGateway() {
        return gateway;
    }
    
    public void setGateway(String input) {
        this.gateway = input;
    }
    
    public int getStartIp() {
        return startIp;
    }
    
    public void setStartIp(int ip) {
        this.startIp = ip;
    }
    
    public int getEndIp() {
        return endIp;
    }
    
    public void setEndIp(int ip) {
    	this.endIp = ip;
    }
    
    public String getPrefix() {
        return prefix ;
    }
    
    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }
    
    public int getPeriod() {
        return period ;
    }
    
    public void setPeriod(int period) {
        this.period = period;
    }
    
    public int getVirtualPeriod() {
        return virtualPeriod ;
    }
    
    public void setVirtualPeriod(int input) {
        this.virtualPeriod = input;
    }
    
    public String getStartIpString() {
        return startIpString ;
    }
    
    public void setStartIpString(String sIpString) {
        this.startIpString = sIpString;
    }
    
	public void setDomainPeriod(int input) {
		this.domainPeriod = input;
	}
	
	public int getDomainPeriod() {
		return domainPeriod;
	}
    
    public String getEndIpString() {
        return endIpString ;
    }
    
    public void setEndIpString(String eIpString) {
        this.endIpString = eIpString;
    }
    
    public String getCreateTime() {
        return createTime;
    }
    
    public void setCreateTime(String time) {
    	this.createTime = time;
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
    
    public void integer2IPV4_startIp() {  
        StringBuilder sb = new StringBuilder();  
        for (int i = 3; i >= 0; i--) {  
            // right shift each byte of iIPV4 to the rightest side  
            // and then use 0xFF to mask this new-gotten integer.  
            // So we get the integer value of the rightest byte  
            int aSeg = (this.startIp >> (8 * i)) & 0xFF;  
            if (i == 0) {  
                sb.append(aSeg);  
            } else {  
                sb.append(aSeg + ".");  
            }  
        }  
        System.out.println(this.startIp + "-->" + sb.toString());  
        this.startIpString = sb.toString();
    }  
    
    public void IPV42Integer_startIp(String strIPV4_start) {  
        int iIPV4 = 0x00;  
        //logger.info("13");
        String[] segArray = strIPV4_start.split("\\.");  
        //logger.info("11");
        for (int i = 0; i < segArray.length; i++) {  
            // seg <=255, so all the bits except rightest 8 ones are 0  
            int seg = Integer.parseInt(segArray[i]);  
            // left shift the current iIPV4 1-byte-distance, then "append" the  
            // strIPV4Seg to rightest side  
            iIPV4 = (iIPV4 << 8) | seg;  
        }  
        //logger.info("12");
        System.out.println(strIPV4_start + "-->" + iIPV4); 
        this.startIp = iIPV4;
    }
    
    public void integer2IPV4_endIp() {  
        StringBuilder sb = new StringBuilder();  
        for (int i = 3; i >= 0; i--) {  
            // right shift each byte of iIPV4 to the rightest side  
            // and then use 0xFF to mask this new-gotten integer.  
            // So we get the integer value of the rightest byte  
            int aSeg = (this.endIp >> (8 * i)) & 0xFF;  
            if (i == 0) {  
                sb.append(aSeg);  
            } else {  
                sb.append(aSeg + ".");  
            }  
        }  
        System.out.println(this.endIp + "-->" + sb.toString());  
        this.endIpString = sb.toString();
    }  
    
    public void IPV42Integer_endIp(String strIPV4_end) {  
        int iIPV4 = 0x00;  
        //logger.info("13");
        String[] segArray = strIPV4_end.split("\\.");  
        //logger.info("11");
        for (int i = 0; i < segArray.length; i++) {  
            // seg <=255, so all the bits except rightest 8 ones are 0  
            int seg = Integer.parseInt(segArray[i]);  
            // left shift the current iIPV4 1-byte-distance, then "append" the  
            // strIPV4Seg to rightest side  
            iIPV4 = (iIPV4 << 8) | seg;  
        }  
        //logger.info("12");
        System.out.println(strIPV4_end + "-->" + iIPV4); 
        this.endIp = iIPV4;
    }

    @Override
    public String toString() {
        return "Rips{" +
                "id='" + id + '\'' +
                ", net='" + net + '\'' +
                ", start_ip='" + startIp + '\'' +
                ", end_ip='" + endIp + '\'' +
                ", create_time='" + createTime + '\'' +
                ", sort='" + sort + '\'' +
                ", order='" + order + '\'' +
                '}';
    }
}