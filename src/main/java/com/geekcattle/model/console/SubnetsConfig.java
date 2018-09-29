package com.geekcattle.model.console;

import java.util.List;

import com.geekcattle.model.console.Nodes.TerminationPoint;
import com.google.gson.annotations.SerializedName;

public class SubnetsConfig {
	
	private Subnets subnets;
	
	public void setSubnets(Subnets input) {
		this.subnets = input;
	}
	
	public Subnets getSubnets() {
		return subnets;
	}
	
	public class Subnets{
		
		@SerializedName("ip-conf")
		private List<IpConf> ipConf;
		
		public List<IpConf> getListIpConf(){
			return ipConf;
		}
		
	}
	
	public class IpConf{
		@SerializedName("rips-id")
		private String ripsId;
		
		@SerializedName("domain-period")
		private int domainPeriod;
		
		private String gateway;
		
		@SerializedName("ip-global-period")
		private int ipGlobalPeriod;
		
		@SerializedName("start-ip")
		private String startIp;
		
		@SerializedName("end-ip")
		private String endIp;
		
		@SerializedName("domain-prefix")
		private String domainPrefix;
		
		@SerializedName("virtual-ip-period")
		private int virtualIpPeriod ;
		
		public void setVirtualIpPeriod(int input) {
			this.virtualIpPeriod = input;
		}
		
		public int getVirtualIpPeriod() {
			return virtualIpPeriod;
		}
		
		public void setRipsId(String input) {
			this.ripsId = input;
		}
		
		public String getRipsId() {
			return ripsId;
		}
		
		public void setGateway(String input) {
			this.gateway = input;
		}
		
		public String getGateway() {
			return gateway;
		}
		
		public void setIpGlobalPeriod(int input) {
			this.ipGlobalPeriod = input;
		}
		
		public int getIpGlobalPeriod() {
			return ipGlobalPeriod;
		}
		
		public void setDomainPeriod(int input) {
			this.domainPeriod = input;
		}
		
		public int getDomainPeriod() {
			return domainPeriod;
		}
		
		
		public void setStartIp(String input) {
			this.startIp = input;
		}
		
		public String getStartIp() {
			return startIp;
		}
		
		public void setEndIp(String input) {
			this.endIp = input;
		}
		
		public String getEndIp() {
			return endIp;
		}
		
		public void setDomainPrefix(String input) {
			this.domainPrefix = input;
		}
		
		public String getDomainPrefix() {
			return domainPrefix;
		}
		
		
	}
	
}