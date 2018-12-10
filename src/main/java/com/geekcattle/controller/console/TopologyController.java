package com.geekcattle.controller.console;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geekcattle.model.console.TopologySwitchData;
import com.geekcattle.model.console.HttpRequest;
import com.geekcattle.model.console.Links;
import com.geekcattle.model.console.TopologySwitch2Switch;
import com.geekcattle.model.console.TopologySwitchData.Entities;
import com.geekcattle.model.console.TopologySwitchData.Node;
import com.geekcattle.model.console.TopologySwitchData.NodeConnector;
import com.geekcattle.model.console.TopologySwitch2Switch.Topology;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class TopologyController {
	@Value("${odlIpAndPort}")
	private String odlIpAndPort;
	private Logger log = LoggerFactory.getLogger(this.getClass());
	private List<OldPacket> oldPacketList = new ArrayList<>();
	public class OldPacket {	//记录刷新前的历史包数据，用以和当前时刻进行比较，从而推断出流量变化情况
		private String connector;	
		public String getConnector() {
			return connector;
		}		
		public void setConnector(String input) {
			this.connector = input;
		}		
		private long old_packet_received = 0;	
		public void setOldPacketReceived(long input) {
			this.old_packet_received = input;
		}
		public long getOldPacketReceived() {
			return old_packet_received;
		}	
		private long old_packet_transmitted = 0;	
		public void setOldPacketTransmitted(long input) {
			this.old_packet_transmitted = input;
		}
		public long getOldPackettransmitted() {
			return old_packet_transmitted;
		}
	}
	
	private String getBasicAuthStr(String name,String password){
        return "Basic " + Base64.getEncoder().encodeToString((name + ":" + password).getBytes());
    }
	
    //单击菜单栏上的网络拓扑跳转至此
	@RequestMapping(value = "/admin/function/topology", method = {RequestMethod.GET})
    public String TopologyShow(Model model) {
        return "/admin/function/topology";
    }
	
	//拓扑网页提交表单至此	 
    @RequestMapping(value = "/admin/function/topologyData", method = {RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> TopologyData() {      
    	String url_switchData = odlIpAndPort+"/restconf/operational/network-topology:network-topology/topology/flow:1";//获取交换机之间的链路信息
    	String url_hostData = odlIpAndPort+"/restconf/operational/opendaylight-inventory:nodes";//获取主机信息以及主机与交换机之间的链路信息
        String username = "admin";
        String password = "admin";
    	HttpRequest.setBasicAuth(getBasicAuthStr(username,password));
        String str_switchData = HttpRequest.sendGet(url_switchData,"");
		System.err.println("str_switchData::"+str_switchData);
        String str_hostData = HttpRequest.sendGet(url_hostData,"");
		System.err.println("str_hostData::"+str_hostData);
    	Map<String,Object>data = new HashMap<String,Object>();
        Gson gson = new Gson();	
        java.lang.reflect.Type type = new TypeToken<TopologySwitchData>() {}.getType();
        TopologySwitchData hostdata = gson.fromJson(str_hostData, type);

		List<Map> nodeList = new ArrayList<>();
		List<Map> linkList = new ArrayList<>();
		List<String> dynamicList = new ArrayList<>();//记录哪些端口有流量     
		List<String> sourceList = new ArrayList<>();//记录哪些端口是源端口，因为流量实时显示的时候是有方向性的，所以需要记录源端口是谁，从而推断出流向  
		List<String> recordList = new ArrayList<>();//避免链路重复画两次，凡是画过得节点都记录一下，每次再画链路的时候，比较源和目的节点是否记录过。
        List<Node> listSwitchNodes = hostdata.getNodes().getNode();    
        for(Node switchNodes : listSwitchNodes) {
        	//交换机实体数据map开始
        	Map<String,Object>switchData = new HashMap<String,Object>();
        	switchData.put("id", switchNodes.getId());
        	switchData.put("rip", "");
        	switchData.put("vip", "");  
        	switchData.put("rmac", "");    
        	switchData.put("port", "");
        	switchData.put("vdomain", "");
        	switchData.put("vip_time", "");
        	switchData.put("vdomain_time", "");  
        	switchData.put("create_time", "");
        	switchData.put("type", "/static/img/switch");//拓扑中显示的图片
        	switchData.put("type_output", "switch");
			//交换机实体数据map结束
            nodeList.add(switchData);
            //交换机连接信息开始
            List<NodeConnector>listNodeConnectors = switchNodes.getNodeConnector();
            for(NodeConnector nodeConnector : listNodeConnectors) {//遍历所有的交换机的所有端口
            	long old_packet_received = 0;
                long old_packet_transmitted = 0;
                int tag = 0;    
            	if(oldPacketList == null) {   //如果还未建立历史端口数据列表，则把当前端口的id以及收到的数据包数量，发送的数据包数量存入列表中
            		OldPacket packetAdd = new OldPacket();
            		packetAdd.setConnector(nodeConnector.getId());
					if(nodeConnector.getPortStatistics()!=null){
						packetAdd.setOldPacketReceived(nodeConnector.getPortStatistics().getPackets().getReceived());
						packetAdd.setOldPacketTransmitted(nodeConnector.getPortStatistics().getPackets().getTransmitted());
					}else{
						packetAdd.setOldPacketReceived(0);
						packetAdd.setOldPacketTransmitted(0);
					}

            		oldPacketList.add(packetAdd);
            	}else { //如果历史数据端口列表中有数据，则判断列表中是否有和当前遍历的端口id一致的端口信息，有的话，提取历史数据进行比对，没有的话建立新的
            		tag = 0;  //用于判断oldPacketList中是否存在有和当前connector一样的ID
            		for(OldPacket packetAdd : oldPacketList) {
            			if(packetAdd.getConnector().equals(nodeConnector.getId())) {
            				old_packet_received = packetAdd.getOldPacketReceived();
            				old_packet_transmitted = packetAdd.getOldPackettransmitted();
							if(nodeConnector.getPortStatistics()!=null){
								packetAdd.setOldPacketReceived(nodeConnector.getPortStatistics().getPackets().getReceived());
								packetAdd.setOldPacketTransmitted(nodeConnector.getPortStatistics().getPackets().getTransmitted());
							}else {
								packetAdd.setOldPacketReceived(0);
								packetAdd.setOldPacketTransmitted(0);
							}

            				tag = 1;
            				break;
            			}	
            			else
            				continue;
            		}
            	}
            	//tag==0 代表没有一样的
            	if(tag == 0) {
            		OldPacket packetAdd = new OldPacket();
            		packetAdd.setConnector(nodeConnector.getId());
					if(nodeConnector.getPortStatistics()!=null){
						packetAdd.setOldPacketReceived(nodeConnector.getPortStatistics().getPackets().getReceived());
						packetAdd.setOldPacketTransmitted(nodeConnector.getPortStatistics().getPackets().getTransmitted());
					}else{
						packetAdd.setOldPacketReceived(0);
						packetAdd.setOldPacketTransmitted(0);
					}

            		oldPacketList.add(packetAdd);
            	}
            	//当前最新的端口流量
				long current_packet_received = 0;
				long current_packet_transmitted =0;
				if(nodeConnector.getPortStatistics()!=null){
					 current_packet_received = nodeConnector.getPortStatistics().getPackets().getReceived();
					 current_packet_transmitted = nodeConnector.getPortStatistics().getPackets().getTransmitted();
				}

            	if ((current_packet_received - old_packet_received > 5) || (current_packet_transmitted - old_packet_transmitted > 5)) {//端口有流量
        			nodeConnector.setTag(1);
        			//该端口有数据流量包，并且添加到list中
        			dynamicList.add(nodeConnector.getId());
        			//判断源端口
            		if ((current_packet_transmitted - old_packet_transmitted)>=(current_packet_received - old_packet_received)) {//该端口是源端口
            			nodeConnector.setTagSource(1);//激活源端口标识
            			sourceList.add(nodeConnector.getId());
            		}
            		else
            			nodeConnector.setTagSource(0);
            	}
            	else
            		nodeConnector.setTag(0);     	
            	if(nodeConnector.getEntities()!=null) {//表明该交换机端口连接的是主机
            		List<Entities> listEntities = nodeConnector.getEntities();
            		for(Entities entities : listEntities) {
                    	Map<String,Object>hostData = new HashMap<String,Object>();
                    	Map<String,Object>switchToHost = new HashMap<String,Object>();
                    	hostData.put("id", entities.getMac());
                    	hostData.put("rip", entities.getRip());
                    	hostData.put("vip", entities.getVip());  
                    	hostData.put("rmac", entities.getMac());    
                    	hostData.put("port","");
                    	hostData.put("vdomain", entities.getVdomain());
                    	hostData.put("vip_time", entities.getVipLastMutation());
                    	hostData.put("vdomain_time", entities.getVdomainLastMutation());  
                    	hostData.put("create_time", "");
                    	hostData.put("type", "/static/img/host");//拓扑中显示的图片
                    	hostData.put("type_output", "host");
                        nodeList.add(hostData); 
                   
                        if(nodeConnector.getTagSource()==1) {//根据该端口是不是源端口来调整源和目的对应的节点
                            switchToHost.put("source", switchNodes.getId());
                            switchToHost.put("target", entities.getMac());
                            switchToHost.put("src_type", "open");
                            switchToHost.put("dst_type", "host");
                            switchToHost.put("src_port", nodeConnector.getPortNumber());
                            switchToHost.put("dst_port", "");
                        }
                        else {
                            switchToHost.put("target", switchNodes.getId());
                            switchToHost.put("source", entities.getMac());
                            switchToHost.put("src_type", "host");
                            switchToHost.put("dst_type", "open");
                            switchToHost.put("src_port", "");
                            switchToHost.put("dst_port", nodeConnector.getPortNumber());
                        }
                        if(nodeConnector.getTag()==1)//链路分为两种，static是静态链路也就是拓扑中显示的黑色实线，dynamic是动态流量
                        	switchToHost.put("type", "dynamic"); 
                        else
                        	switchToHost.put("type", "static"); 
                        switchToHost.put("bandwidth", "");  
                        linkList.add(switchToHost);    
            		}
            	}
            }
        }
        //节点信息
		data.put("nodes", nodeList);
		//System.out.println(data);
		/*获取交换机之间的链路信息*/
        java.lang.reflect.Type typeOfTopology = new TypeToken<TopologySwitch2Switch>() {}.getType();
        TopologySwitch2Switch topo = gson.fromJson(str_switchData, typeOfTopology);
        List<Topology>topology = topo.getTopology();
        for(Topology list : topology) {
        	String topology_id = list.getTopologyId();//拓扑ID是交换机的名字：端口号
        	topology_id = topology_id.substring(0,4);//  	
        //	if ("flow".equals(topology_id)) {    因为现在获取的只有交换机信息，因此不需要在通过id来判断该节点是交换机还是主机了，但是如果拓扑中能够获取到主机信息的话，则需要将此句放开
        	List<Links> links = list.getLink();
			for(Links list_links : links) {
	        	int iterationTag = 0;
	        	int sourceTag = 0;
	            Map<String,Object>linkData = new HashMap<String,Object>();
	            String sourceNode = list_links.getSource().getSourceNode();
	            String targetNode = list_links.getDestination().getDestNode();    
	            String src_port = list_links.getSource().getSourceTp();
	            String dst_port = list_links.getDestination().getDestTp();            
	            if(recordList != null) { //避免链路重复画两次，凡是画过得节点都记录一下，每次再画链路的时候，比较源和目的节点是否记录过。
	            	for(String record : recordList) {
	            		if(record.equals(src_port)||record.equals(dst_port)) {//表明针对该节点的链路已经画过了
	            			iterationTag = 1;
	            			break;
	            		}
	            	}
	            }
	            if(iterationTag == 1) {
	            	continue;
	            }
	            recordList.add(src_port);
	            recordList.add(dst_port);
	            String linkType = "static";
	            for(String linkId : dynamicList) {
	            	if(linkId.equals(src_port)||(linkId.equals(dst_port))) {
	    	            linkType = "dynamic";
	    	            for(String linkSourceId : sourceList) {    	            	
	    	            	if(linkSourceId.equals(src_port)) {
	    	    	            sourceTag = 1;
	    	            	}
	    	            }
	            	}
	            }
	            linkData.put("type", linkType); 
	            if(sourceTag == 0) {//说明源节点和目的节点弄反了，需要交换
	            	String temp = sourceNode;
	            	sourceNode = targetNode;
	            	targetNode = temp; 	
	            	temp = src_port;
	            	src_port = dst_port;
	            	dst_port = temp;
	            }
	            linkData.put("source", sourceNode);
	            linkData.put("target", targetNode);  
	            String src_forename = src_port.substring(0, 8);
	            String dst_forename = dst_port.substring(0, 8);
	            if("openflow".equals(src_forename)) {//根据ID名字判断源节点类型以及目的节点类型，因为在展示拓扑的时候，只有交换机显示端口号，所以要区分节点类型
	            	src_port = src_port.replaceAll(sourceNode, "");
	            	src_port = src_port.replaceAll(":", "");
	                linkData.put("src_port", src_port);  
	                linkData.put("src_type", "open");
	            }
	            else {
	                linkData.put("src_type", "host");
	            }
	            if("openflow".equals(dst_forename)) {
	            	dst_port = dst_port.replaceAll(targetNode, "");
	            	dst_port = dst_port.replaceAll(":", "");
	                linkData.put("dst_port", dst_port);  
	                linkData.put("dst_type", "open");
	            } 
	            else {
	                linkData.put("dst_type", "host");
	            }                 
	            linkData.put("bandwidth", "");                    
	            linkList.add(linkData);
			}
			//链路信息
			data.put("links", linkList);
			System.out.println(data+"\n");
	}      
    return data;     
    }
}
