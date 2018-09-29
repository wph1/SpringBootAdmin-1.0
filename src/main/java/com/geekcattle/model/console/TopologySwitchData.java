package com.geekcattle.model.console;

import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class TopologySwitchData {//用来获得交换机端口信息
	
	private Nodes nodes;	
	public Nodes getNodes(){
		return nodes;
	}		
	public class Nodes {		
		private List<Node> node;	
		public List<Node> getNode(){
			return node;
		}
	}
	
	public class Node{	
		private String id;	
		public String getId() {
			return id;
		}	
		@SerializedName("node-connector")		
		private List<NodeConnector> node_connector;	
		public List<NodeConnector> getNodeConnector() {
			return node_connector;
		}			
	}
	
	public class NodeConnector {
		private String id;	
		public String getId() {
			return id;
		}	
		private int tag = 0;//判断该节点是否有数据包	
		public int getTag() {
			return tag;
		}	
		public void setTag(int input) {
			this.tag = input;
		}
		private int tagSource = 0;//判断该节点是源还是目的
		public int getTagSource() {
			return tagSource;
		}
		public void setTagSource(int input) {
			this.tagSource = input;
		}
		@SerializedName("opendaylight-port-statistics:flow-capable-node-connector-statistics")
		private PortStatistics packet;	
		public PortStatistics getPortStatistics() {
			return packet;
		}		
		@SerializedName("flow-node-inventory:port-number")
		private String portNumber;	
		public String getPortNumber() {
			return portNumber;
		}	
		@SerializedName("dip-data:vip-address-entities")	
		private List<Entities> entities;	
		public List<Entities> getEntities() {
			return entities;
		}		
	}
	
	public class PortStatistics{	
		@SerializedName("packets")	
		private Packets packet;
		public Packets getPackets() {
			return packet;
		}	
	}
	
	public class Packets{	
		private long received = 0;
		public long getReceived() {
			return received;
		}
		private long transmitted = 0;
		public long getTransmitted() {
			return transmitted;
		}
	}
	
	public class Entities {	
		private String mac;
		public String getMac() {
			return mac;
		}
		@SerializedName("vdomain-last-mutation")	
		private String vdomainLastMutation;
		public String getVdomainLastMutation() {
			return vdomainLastMutation;
		}
		@SerializedName("w-ip")
		private String wIp;
		public String getWIp() {
			return wIp;
		}
		@SerializedName("vip-last-mutation")
		private String vipLastMutation;
		public String getVipLastMutation() {
			return vipLastMutation;
		}
		private String vip;
		public String getVip() {
			return vip;
		}
		private String rip;
		public String getRip() {
			return rip;
		}
		private String vdomain;
		public String getVdomain() {
			return vdomain;
		}
	}
}
