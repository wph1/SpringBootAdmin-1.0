package com.geekcattle.model.console;

public class MtdConfig{
	private String externalGateway;
	
	private boolean openExternal = false;
	
	private String externalAddress;
	
	private String dnsForwardAddress;
	
	private String dnsAddress;
	
	private String externalSwitchPort;
	
	private String externalSwitch;
	
	private boolean isMtdMode = false;
	
    public String getExternalGateway() {
    	return externalGateway;
    }
    
    public void setExternalGateway(String input) {
    	this.externalGateway = input;
    }
	
	public boolean getOpenExternal() {
    	return openExternal;
    }
    
    public void setOpenExternal(boolean input) {
    	this.openExternal = input;
    }
	
    public String getExternalAddress() {
    	return externalAddress;
    }
    
    public void setExternalAddress(String input) {
    	this.externalAddress = input;
    }
    
    public String getDnsForwardAddress() {
    	return dnsForwardAddress;
    }
    
    public void setDnsForwardAddress(String input) {
    	this.dnsForwardAddress = input;
    }
    
    public String getDnsAddress() {
    	return dnsAddress;
    }
    
    public void setDnsAddress(String input) {
    	this.dnsAddress = input;
    }
    
    public String getExternalSwitchPort() {
    	return externalSwitchPort;
    }
    
    public void setExternalSwitchPort(String input) {
    	this.externalSwitchPort = input;
    }
    
    public String getExternalSwitch() {
    	return externalSwitch;
    }
    
    public void setExternalSwitch(String input) {
    	this.externalSwitch = input;
    }
    
    public boolean getIsMtdMode() {
    	return isMtdMode;
    }
    
    public void setIsMtdMode(boolean input) {
    	this.isMtdMode = input;
    }

}
