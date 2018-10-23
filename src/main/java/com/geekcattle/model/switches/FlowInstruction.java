package com.geekcattle.model.switches;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "flow_instruction")
public class FlowInstruction extends BaseEntity implements Serializable {
    /**
     * 流表动作id
     */
    @Id
    @Column(name = "flow_instruction_id")
    @GeneratedValue(generator = "UUID")
    private String flowInstructionId;
    @Column(name = "instruction_order")
    private Integer instructionOrder;

    @Column(name = "ethernet_source_address")
    private String ethernetSourceAddress;

    @Column(name = "ipv4_source")
    private String ipv4Source;

    @Column(name = "ethernet_destination_address")
    private String ethernetDestinationAddress;

    @Column(name = "ipv4_destination")
    private String ipv4Destination;

    @Column(name = "output_node_connector")
    private String outputNodeConnector;

    @Column(name = "max_length")
    private Integer maxLength;

    /**
     * 流详情id
     */
    @Column(name = "flow_table_details_id")
    private String flowTableDetailsId;

    @Column(name = "create_time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" ,  timezone="GMT+8")
    private Date createTime;

    /**
     * 获取流表动作id
     *
     * @return flow_instruction_id - 流表动作id
     */
    public String getFlowInstructionId() {
        return flowInstructionId;
    }

    /**
     * 设置流表动作id
     *
     * @param flowInstructionId 流表动作id
     */
    public void setFlowInstructionId(String flowInstructionId) {
        this.flowInstructionId = flowInstructionId;
    }

    public Integer getInstructionOrder() {
        return instructionOrder;
    }

    public void setInstructionOrder(Integer instructionOrder) {
        this.instructionOrder = instructionOrder;
    }

    /**
     * @return ethernet_source_address
     */
    public String getEthernetSourceAddress() {
        return ethernetSourceAddress;
    }

    /**
     * @param ethernetSourceAddress
     */
    public void setEthernetSourceAddress(String ethernetSourceAddress) {
        this.ethernetSourceAddress = ethernetSourceAddress;
    }

    /**
     * @return ipv4_source
     */
    public String getIpv4Source() {
        return ipv4Source;
    }

    /**
     * @param ipv4Source
     */
    public void setIpv4Source(String ipv4Source) {
        this.ipv4Source = ipv4Source;
    }

    /**
     * @return ethernet_destination_address
     */
    public String getEthernetDestinationAddress() {
        return ethernetDestinationAddress;
    }

    /**
     * @param ethernetDestinationAddress
     */
    public void setEthernetDestinationAddress(String ethernetDestinationAddress) {
        this.ethernetDestinationAddress = ethernetDestinationAddress;
    }

    /**
     * @return ipv4_destination
     */
    public String getIpv4Destination() {
        return ipv4Destination;
    }

    /**
     * @param ipv4Destination
     */
    public void setIpv4Destination(String ipv4Destination) {
        this.ipv4Destination = ipv4Destination;
    }

    /**
     * @return output_node_connector
     */
    public String getOutputNodeConnector() {
        return outputNodeConnector;
    }

    /**
     * @param outputNodeConnector
     */
    public void setOutputNodeConnector(String outputNodeConnector) {
        this.outputNodeConnector = outputNodeConnector;
    }

    /**
     * @return max_length
     */
    public Integer getMaxLength() {
        return maxLength;
    }

    /**
     * @param maxLength
     */
    public void setMaxLength(Integer maxLength) {
        this.maxLength = maxLength;
    }

    /**
     * 获取流详情id
     *
     * @return flow_table_details_id - 流详情id
     */
    public String getFlowTableDetailsId() {
        return flowTableDetailsId;
    }

    /**
     * 设置流详情id
     *
     * @param flowTableDetailsId 流详情id
     */
    public void setFlowTableDetailsId(String flowTableDetailsId) {
        this.flowTableDetailsId = flowTableDetailsId;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    @Transient
    @JsonIgnore
    private String sort = "";

    @Transient
    @JsonIgnore
    private String order = "";

    public void setSort(String sort) {
        this.sort = sort;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getSort() {
        return sort;
    }

    public String getOrder() {
        return order;
    }

}