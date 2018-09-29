package com.geekcattle.model.console;

import com.google.gson.annotations.SerializedName;

public class Links {
	@SerializedName("link-id")
	private String link_id;
	
	private Source source;
	
	private Destination destination;
	
	public String getLinkId() {
		return link_id;
	}
	
	public Source getSource() {
		return source;
	}
	
	public Destination getDestination() {
		return destination;
	}
	
	public static class Source {
		@SerializedName("source-tp")
		private String source_tp;
		
		@SerializedName("source-node")
		private String source_node;
		
		public String getSourceTp() {
			return source_tp;
		}
		
		public String getSourceNode() {
			return source_node;
		}
	}
	
	public static class Destination {
		@SerializedName("dest-node")
		private String dest_node;
		
		@SerializedName("dest-tp")		
		private String dest_tp;
		
		public String getDestNode() {
			return dest_node;
		}
		
		public String getDestTp() {
			return dest_tp;
		}
	}

}
