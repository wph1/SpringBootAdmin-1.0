package com.geekcattle.model.console;

import com.google.gson.annotations.SerializedName;

public class MTD {
	@SerializedName("mtd-config")	
	private MTDConfig mtd_config;
	
	public MTDConfig getMTDConfig(){
		return mtd_config;
	}
	
	public class MTDConfig{
		
		@SerializedName("external-gateway")		
		private String external_gateway;
		
		@SerializedName("open-external")		
		private boolean open_external;
		
		@SerializedName("external-address")		
		private String external_address;
		
		@SerializedName("dns-forward-address")		
		private String dns_forward_address;
		
		@SerializedName("dns-address")		
		private String dns_address;
		
		@SerializedName("external-switch-port")		
		private String external_switch_port;
		
		@SerializedName("external-switch")		
		private String external_switch;
		
		@SerializedName("is-mtd-mode")		
		private boolean is_mtd_mode;
		
		public String getExternalGateway() {
			return external_gateway;
		}
		
		public void setExternalGateway(String input) {
			this.external_gateway = input;
		}
		
		public boolean getOpenExternal() {
			return open_external;
		}
		
		public void setOpenExternal(boolean input) {
			this.open_external = input;
		}
		
		public String getExternalAddress() {
			return external_address;
		}
		
		public void setExternalAddress(String input) {
			this.external_address = input;
		}
	
		public String getDnsForwardAddress() {
			return dns_forward_address;
		}
		
		public void setDnsForwardAddress(String input) {
			this.dns_forward_address = input;
		}

		public String getDnsAddress() {
			return dns_address;
		}
		
		public void setDnsAddress(String input) {
			this.dns_address = input;
		}

		public String getExternalSwitchPort() {
			return external_switch_port;
		}
		
		public void setExternalSwitchPort(String input) {
			this.external_switch_port = input;
		}
		
		public String getExternalSwitch() {
			return external_switch;
		}
		
		public void setExternalSwitch(String input) {
			this.external_switch = input;
		}
		
		public boolean getIsMtdMode() {
			return is_mtd_mode;
		}
		
		public void setIsMtdMode(boolean input) {
			this.is_mtd_mode = input;
		}
	}

}
