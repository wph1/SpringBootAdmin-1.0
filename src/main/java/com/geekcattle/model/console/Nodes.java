package com.geekcattle.model.console;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class Nodes {
	
	@SerializedName("node-id")
	private String node_id;
	
	@SerializedName("opendaylight-topology-inventory:inventory-node-ref")
	private String opendaylight_topology_inventory_inventory_node_ref;
	
	@SerializedName("termination-point")
	private List<TerminationPoint> termination_point;
	
	@SerializedName("host-tracker-service:attachment-points")
	private List<HostTrackerServiceAttachmentPoints> host_tracker_service_attachment_points;
	
	@SerializedName("host-tracker-service:addresses")
	private List<HostTrackerServiceAddress> host_tracker_service_address;

	@SerializedName("host-tracker-service:id")
	private String host_tracker_service_id;
	
	public String getNodeId() {
		return node_id;
	}
	
	public String getOpendaylightTopologyInventoryInventoryNodeRef() {
		return opendaylight_topology_inventory_inventory_node_ref;
	}
	
	public List<TerminationPoint> getListTerminationPoint(){
		return termination_point;
	}
	
	public List<HostTrackerServiceAttachmentPoints> getHostTrackerServiceAttachmentPoints(){
		return host_tracker_service_attachment_points;
	}
	
	public List<HostTrackerServiceAddress> getHostTrackerServiceAddress(){
		return host_tracker_service_address;
	}
	
	public String getHostTrackerServiceId() {
		return host_tracker_service_id;
	}
	
	public static class TerminationPoint{
		@SerializedName("tp-id")
		private String tp_id;
		
		@SerializedName("opendaylight-topology-inventory:inventory-node-connector-ref")		
		private String opendaylight_topology_inventory_inventory_node_connector_ref;
	}
	
	public static class HostTrackerServiceAttachmentPoints{
		@SerializedName("tp-id")
		private String tp_id;
		
		@SerializedName("corresponding-tp")
		private String corresponding_tp;
		
		private boolean active;
		
		public String getTpId() {
			return tp_id;
		}
		
		public String getCorrespondingTp() {
			return corresponding_tp;
		}
		
		public boolean getActive() {
			return active;
		}
	}
	
	public static class HostTrackerServiceAddress {
		private int id;
		private String mac;
		
		@SerializedName("last-seen")		
		private long last_seen;
		
		private String ip;
		
		@SerializedName("first-seen")		
		private long first_seen;
		
		public int getId() {
			return id;
		}
		
		public String getMac() {
			return mac;
		}
		
		public long getLastSeen() {
			return last_seen;
		}
		
		public String getIp() {
			return ip;
		}
		
		public long getFirstSeen() {
			return first_seen;
		}
	}
	
	

	
}
