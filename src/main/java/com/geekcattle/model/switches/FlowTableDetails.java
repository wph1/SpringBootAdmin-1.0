package com.geekcattle.model.switches;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.*;

@Table(name = "flow_table_details")
public class FlowTableDetails extends BaseEntity implements Serializable {
    /**
     * 流表详情id
     */
    @Id
    @Column(name = "flow_table_details_id")
    @GeneratedValue(generator = "UUID")
    private String flowTableDetailsId;

    /**
     * 流规则id
     */
    private String id;

    @Column(name = "idle_timeout")
    private Integer idleTimeout;

    private Integer cookie;

    private String flags;

    @Column(name = "hard_timeout")
    private Integer hardTimeout;

    @Column(name = "cookie_mask")
    private Integer cookieMask;

    @Column(name = "duration_nanosecond")
    private Integer durationNanosecond;

    private Integer second;

    /**
     * 该流规则转发的比特数
     */
    @Column(name = "byte_count")
    private Integer byteCount;

    /**
     * 该流规则转发的包数量
     */
    @Column(name = "packet_count")
    private BigInteger packetCount;

    private Integer priority;

    @Column(name = "table_id")
    private Integer tableId;

    @Column(name = "match_tcp_destination_port")
    private Integer matchTcpDestinationPort;

    @Column(name = "match_tcp_source_port")
    private Integer matchTcpSourcePort;

    @Column(name = "match_ip_protocol")
    private Integer matchIpProtocol;

    @Column(name = "match_ipv4_source")
    private String matchIpv4Source;

    @Column(name = "match_ipv4_destination")
    private String matchIpv4Destination;

    @Column(name = "match_ethernet_type")
    private Integer matchEthernetType;

    /**
     * 流表id
     */
    @Column(name = "flow_table_id")
    private String flowTableId;

    @Column(name = "create_time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" ,  timezone="GMT+8")
    private Date createTime;

    /**
     * 获取流表详情id
     *
     * @return flow_table_details_id - 流表详情id
     */
    public String getFlowTableDetailsId() {
        return flowTableDetailsId;
    }

    /**
     * 设置流表详情id
     *
     * @param flowTableDetailsId 流表详情id
     */
    public void setFlowTableDetailsId(String flowTableDetailsId) {
        this.flowTableDetailsId = flowTableDetailsId;
    }

    /**
     * 获取流规则id
     *
     * @return id - 流规则id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置流规则id
     *
     * @param id 流规则id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return idle_timeout
     */
    public Integer getIdleTimeout() {
        return idleTimeout;
    }

    /**
     * @param idleTimeout
     */
    public void setIdleTimeout(Integer idleTimeout) {
        this.idleTimeout = idleTimeout;
    }

    /**
     * @return cookie
     */
    public Integer getCookie() {
        return cookie;
    }

    /**
     * @param cookie
     */
    public void setCookie(Integer cookie) {
        this.cookie = cookie;
    }

    /**
     * @return flags
     */
    public String getFlags() {
        return flags;
    }

    /**
     * @param flags
     */
    public void setFlags(String flags) {
        this.flags = flags;
    }

    /**
     * @return hard_timeout
     */
    public Integer getHardTimeout() {
        return hardTimeout;
    }

    /**
     * @param hardTimeout
     */
    public void setHardTimeout(Integer hardTimeout) {
        this.hardTimeout = hardTimeout;
    }

    /**
     * @return cookie_mask
     */
    public Integer getCookieMask() {
        return cookieMask;
    }

    /**
     * @param cookieMask
     */
    public void setCookieMask(Integer cookieMask) {
        this.cookieMask = cookieMask;
    }

    /**
     * @return duration_nanosecond
     */
    public Integer getDurationNanosecond() {
        return durationNanosecond;
    }

    /**
     * @param durationNanosecond
     */
    public void setDurationNanosecond(Integer durationNanosecond) {
        this.durationNanosecond = durationNanosecond;
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
     * 获取该流规则转发的比特数
     *
     * @return byte_count - 该流规则转发的比特数
     */
    public Integer getByteCount() {
        return byteCount;
    }

    /**
     * 设置该流规则转发的比特数
     *
     * @param byteCount 该流规则转发的比特数
     */
    public void setByteCount(Integer byteCount) {
        this.byteCount = byteCount;
    }

    /**
     * 获取该流规则转发的包数量
     *
     * @return packet_count - 该流规则转发的包数量
     */
    public BigInteger getPacketCount() {
        return packetCount;
    }

    /**
     * 设置该流规则转发的包数量
     *
     * @param packetCount 该流规则转发的包数量
     */
    public void setPacketCount(BigInteger packetCount) {
        this.packetCount = packetCount;
    }

    /**
     * @return priority
     */
    public Integer getPriority() {
        return priority;
    }

    /**
     * @param priority
     */
    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    /**
     * @return table_id
     */
    public Integer getTableId() {
        return tableId;
    }

    /**
     * @param tableId
     */
    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }

    /**
     * @return match_tcp_destination_port
     */
    public Integer getMatchTcpDestinationPort() {
        return matchTcpDestinationPort;
    }

    /**
     * @param matchTcpDestinationPort
     */
    public void setMatchTcpDestinationPort(Integer matchTcpDestinationPort) {
        this.matchTcpDestinationPort = matchTcpDestinationPort;
    }

    /**
     * @return match_tcp_source_port
     */
    public Integer getMatchTcpSourcePort() {
        return matchTcpSourcePort;
    }

    /**
     * @param matchTcpSourcePort
     */
    public void setMatchTcpSourcePort(Integer matchTcpSourcePort) {
        this.matchTcpSourcePort = matchTcpSourcePort;
    }

    /**
     * @return match_ip_protocol
     */
    public Integer getMatchIpProtocol() {
        return matchIpProtocol;
    }

    /**
     * @param matchIpProtocol
     */
    public void setMatchIpProtocol(Integer matchIpProtocol) {
        this.matchIpProtocol = matchIpProtocol;
    }

    /**
     * @return match_ipv4_source
     */
    public String getMatchIpv4Source() {
        return matchIpv4Source;
    }

    /**
     * @param matchIpv4Source
     */
    public void setMatchIpv4Source(String matchIpv4Source) {
        this.matchIpv4Source = matchIpv4Source;
    }

    /**
     * @return match_ipv4_destination
     */
    public String getMatchIpv4Destination() {
        return matchIpv4Destination;
    }

    /**
     * @param matchIpv4Destination
     */
    public void setMatchIpv4Destination(String matchIpv4Destination) {
        this.matchIpv4Destination = matchIpv4Destination;
    }

    /**
     * @return match_ethernet_type
     */
    public Integer getMatchEthernetType() {
        return matchEthernetType;
    }

    /**
     * @param matchEthernetType
     */
    public void setMatchEthernetType(Integer matchEthernetType) {
        this.matchEthernetType = matchEthernetType;
    }

    /**
     * 获取流表id
     *
     * @return flow_table_id - 流表id
     */
    public String getFlowTableId() {
        return flowTableId;
    }

    /**
     * 设置流表id
     *
     * @param flowTableId 流表id
     */
    public void setFlowTableId(String flowTableId) {
        this.flowTableId = flowTableId;
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