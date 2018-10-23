package com.geekcattle.model.switches;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "switches_node_connector")
public class SwitchesNodeConnector extends BaseEntity implements Serializable {
    /**
     * 交换机端口id
     */
    @Id
    @Column(name = "node_connector_id")
    @GeneratedValue(generator = "UUID")
    private String nodeConnectorId;

    /**
     * 交换机id
     */
    private String id;

    @Column(name = "transmit_drops")
    private Integer transmitDrops;

    @Column(name = "receive_frame_error")
    private Integer receiveFrameError;

    @Column(name = "receive_drops")
    private Integer receiveDrops;

    @Column(name = "receive_crc_error")
    private Integer receiveCrcError;

    /**
     * 该接口转发的bit数
     */
    @Column(name = "bytes_transmitted")
    private Integer bytesTransmitted;

    /**
     * 该接口接收的比特数
     */
    @Column(name = "bytes_received")
    private Integer bytesReceived;

    private Integer nanosecond;

    private Integer second;

    @Column(name = "receive_errors")
    private Integer receiveErrors;

    @Column(name = "transmit_errors")
    private Integer transmitErrors;

    @Column(name = "receive_over_run_error")
    private Integer receiveOverRunError;

    @Column(name = "collision_count")
    private Integer collisionCount;

    /**
     * 该端口转发的数据包数
     */
    @Column(name = "packets_transmitted")
    private Integer packetsTransmitted;

    /**
     * 该端口接收的数据包数
     */
    @Column(name = "packets_received")
    private Integer packetsReceived;

    @Column(name = "link_down")
    private String linkDown;

    private String live;

    private String blocked;

    @Column(name = "flow_name")
    private String flowName;

    @Column(name = "flow_speed")
    private Integer flowSpeed;

    @Column(name = "flow_configuration")
    private String flowConfiguration;

    @Column(name = "flow_supported")
    private String flowSupported;

    @Column(name = "flow_peer_features")
    private String flowPeerFeatures;

    @Column(name = "flow_port_number")
    private Integer flowPortNumber;

    @Column(name = "flow_advertised_features")
    private String flowAdvertisedFeatures;

    @Column(name = "flow_current_feature")
    private String flowCurrentFeature;

    @Column(name = "flow_hardware_address")
    private String flowHardwareAddress;

    @Column(name = "flow_current_speed")
    private Integer flowCurrentSpeed;

    /**
     * 对应的交换机id
     */
    @Column(name = "switches_id")
    private String switchesId;

    @Column(name = "create_time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" ,  timezone="GMT+8")
    private Date createTime;

    /**
     * 获取交换机端口id
     *
     * @return node_connector_id - 交换机端口id
     */
    public String getNodeConnectorId() {
        return nodeConnectorId;
    }

    /**
     * 设置交换机端口id
     *
     * @param nodeConnectorId 交换机端口id
     */
    public void setNodeConnectorId(String nodeConnectorId) {
        this.nodeConnectorId = nodeConnectorId;
    }

    /**
     * 获取交换机id
     *
     * @return id - 交换机id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置交换机id
     *
     * @param id 交换机id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return transmit_drops
     */
    public Integer getTransmitDrops() {
        return transmitDrops;
    }

    /**
     * @param transmitDrops
     */
    public void setTransmitDrops(Integer transmitDrops) {
        this.transmitDrops = transmitDrops;
    }

    /**
     * @return receive_frame_error
     */
    public Integer getReceiveFrameError() {
        return receiveFrameError;
    }

    /**
     * @param receiveFrameError
     */
    public void setReceiveFrameError(Integer receiveFrameError) {
        this.receiveFrameError = receiveFrameError;
    }

    /**
     * @return receive_drops
     */
    public Integer getReceiveDrops() {
        return receiveDrops;
    }

    /**
     * @param receiveDrops
     */
    public void setReceiveDrops(Integer receiveDrops) {
        this.receiveDrops = receiveDrops;
    }

    /**
     * @return receive_crc_error
     */
    public Integer getReceiveCrcError() {
        return receiveCrcError;
    }

    /**
     * @param receiveCrcError
     */
    public void setReceiveCrcError(Integer receiveCrcError) {
        this.receiveCrcError = receiveCrcError;
    }

    /**
     * 获取该接口转发的bit数
     *
     * @return bytes_transmitted - 该接口转发的bit数
     */
    public Integer getBytesTransmitted() {
        return bytesTransmitted;
    }

    /**
     * 设置该接口转发的bit数
     *
     * @param bytesTransmitted 该接口转发的bit数
     */
    public void setBytesTransmitted(Integer bytesTransmitted) {
        this.bytesTransmitted = bytesTransmitted;
    }

    /**
     * 获取该接口接收的比特数
     *
     * @return bytes_received - 该接口接收的比特数
     */
    public Integer getBytesReceived() {
        return bytesReceived;
    }

    /**
     * 设置该接口接收的比特数
     *
     * @param bytesReceived 该接口接收的比特数
     */
    public void setBytesReceived(Integer bytesReceived) {
        this.bytesReceived = bytesReceived;
    }

    /**
     * @return nanosecond
     */
    public Integer getNanosecond() {
        return nanosecond;
    }

    /**
     * @param nanosecond
     */
    public void setNanosecond(Integer nanosecond) {
        this.nanosecond = nanosecond;
    }

    /**
     * @return second
     */
    public Integer getSecond() {
        return second;
    }

    /**
     * @param second
     */
    public void setSecond(Integer second) {
        this.second = second;
    }

    /**
     * @return receive_errors
     */
    public Integer getReceiveErrors() {
        return receiveErrors;
    }

    /**
     * @param receiveErrors
     */
    public void setReceiveErrors(Integer receiveErrors) {
        this.receiveErrors = receiveErrors;
    }

    /**
     * @return transmit_errors
     */
    public Integer getTransmitErrors() {
        return transmitErrors;
    }

    /**
     * @param transmitErrors
     */
    public void setTransmitErrors(Integer transmitErrors) {
        this.transmitErrors = transmitErrors;
    }

    /**
     * @return receive_over_run_error
     */
    public Integer getReceiveOverRunError() {
        return receiveOverRunError;
    }

    /**
     * @param receiveOverRunError
     */
    public void setReceiveOverRunError(Integer receiveOverRunError) {
        this.receiveOverRunError = receiveOverRunError;
    }

    /**
     * @return collision_count
     */
    public Integer getCollisionCount() {
        return collisionCount;
    }

    /**
     * @param collisionCount
     */
    public void setCollisionCount(Integer collisionCount) {
        this.collisionCount = collisionCount;
    }

    /**
     * 获取该端口转发的数据包数
     *
     * @return packets_transmitted - 该端口转发的数据包数
     */
    public Integer getPacketsTransmitted() {
        return packetsTransmitted;
    }

    /**
     * 设置该端口转发的数据包数
     *
     * @param packetsTransmitted 该端口转发的数据包数
     */
    public void setPacketsTransmitted(Integer packetsTransmitted) {
        this.packetsTransmitted = packetsTransmitted;
    }

    /**
     * 获取该端口接收的数据包数
     *
     * @return packets_received - 该端口接收的数据包数
     */
    public Integer getPacketsReceived() {
        return packetsReceived;
    }

    /**
     * 设置该端口接收的数据包数
     *
     * @param packetsReceived 该端口接收的数据包数
     */
    public void setPacketsReceived(Integer packetsReceived) {
        this.packetsReceived = packetsReceived;
    }

    /**
     * @return link_down
     */
    public String getLinkDown() {
        return linkDown;
    }

    /**
     * @param linkDown
     */
    public void setLinkDown(String linkDown) {
        this.linkDown = linkDown;
    }

    /**
     * @return live
     */
    public String getLive() {
        return live;
    }

    /**
     * @param live
     */
    public void setLive(String live) {
        this.live = live;
    }

    /**
     * @return blocked
     */
    public String getBlocked() {
        return blocked;
    }

    /**
     * @param blocked
     */
    public void setBlocked(String blocked) {
        this.blocked = blocked;
    }

    /**
     * @return flow_name
     */
    public String getFlowName() {
        return flowName;
    }

    /**
     * @param flowName
     */
    public void setFlowName(String flowName) {
        this.flowName = flowName;
    }

    /**
     * @return flow_speed
     */
    public Integer getFlowSpeed() {
        return flowSpeed;
    }

    /**
     * @param flowSpeed
     */
    public void setFlowSpeed(Integer flowSpeed) {
        this.flowSpeed = flowSpeed;
    }

    /**
     * @return flow_configuration
     */
    public String getFlowConfiguration() {
        return flowConfiguration;
    }

    /**
     * @param flowConfiguration
     */
    public void setFlowConfiguration(String flowConfiguration) {
        this.flowConfiguration = flowConfiguration;
    }

    /**
     * @return flow_supported
     */
    public String getFlowSupported() {
        return flowSupported;
    }

    /**
     * @param flowSupported
     */
    public void setFlowSupported(String flowSupported) {
        this.flowSupported = flowSupported;
    }

    /**
     * @return flow_peer_features
     */
    public String getFlowPeerFeatures() {
        return flowPeerFeatures;
    }

    /**
     * @param flowPeerFeatures
     */
    public void setFlowPeerFeatures(String flowPeerFeatures) {
        this.flowPeerFeatures = flowPeerFeatures;
    }

    /**
     * @return flow_port_number
     */
    public Integer getFlowPortNumber() {
        return flowPortNumber;
    }

    /**
     * @param flowPortNumber
     */
    public void setFlowPortNumber(Integer flowPortNumber) {
        this.flowPortNumber = flowPortNumber;
    }

    /**
     * @return flow_advertised_features
     */
    public String getFlowAdvertisedFeatures() {
        return flowAdvertisedFeatures;
    }

    /**
     * @param flowAdvertisedFeatures
     */
    public void setFlowAdvertisedFeatures(String flowAdvertisedFeatures) {
        this.flowAdvertisedFeatures = flowAdvertisedFeatures;
    }

    /**
     * @return flow_current_feature
     */
    public String getFlowCurrentFeature() {
        return flowCurrentFeature;
    }

    /**
     * @param flowCurrentFeature
     */
    public void setFlowCurrentFeature(String flowCurrentFeature) {
        this.flowCurrentFeature = flowCurrentFeature;
    }

    /**
     * @return flow_hardware_address
     */
    public String getFlowHardwareAddress() {
        return flowHardwareAddress;
    }

    /**
     * @param flowHardwareAddress
     */
    public void setFlowHardwareAddress(String flowHardwareAddress) {
        this.flowHardwareAddress = flowHardwareAddress;
    }

    /**
     * @return flow_current_speed
     */
    public Integer getFlowCurrentSpeed() {
        return flowCurrentSpeed;
    }

    /**
     * @param flowCurrentSpeed
     */
    public void setFlowCurrentSpeed(Integer flowCurrentSpeed) {
        this.flowCurrentSpeed = flowCurrentSpeed;
    }

    /**
     * 获取对应的交换机id
     *
     * @return switches_id - 对应的交换机id
     */
    public String getSwitchesId() {
        return switchesId;
    }

    /**
     * 设置对应的交换机id
     *
     * @param switchesId 对应的交换机id
     */
    public void setSwitchesId(String switchesId) {
        this.switchesId = switchesId;
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