package com.geekcattle.model.console;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class TopologySwitch2Switch {//用来获取交换机与交换机之间的链路信息
	
	private List<Topology> topology;	
	public List<Topology> getTopology(){
		return topology;
	}	
	public static class Topology {
		@SerializedName("topology-id")
		private String topology_id;	
		private List<Nodes> node;
		private List<Links> link;	
		public String getTopologyId() {
			return topology_id;
		}	
		public List<Nodes> getNode(){
			return  node;
		}	
		public List<Links> getLink(){
			return  link;
		}	
	}
}
