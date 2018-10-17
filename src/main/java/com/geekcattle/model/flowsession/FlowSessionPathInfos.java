package com.geekcattle.model.flowsession;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.geekcattle.model.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "flow_session_path_infos")
public class FlowSessionPathInfos  extends BaseEntity implements Serializable {
    /**
     * 交换机id
     */
    private String id;

    @Id
    @Column(name = "path_info_id")
    @GeneratedValue(generator = "UUID")
    private String pathInfoId;

    /**
     * 交换机节点名称
     */
    private String node;

    /**
     * 数据包接收端口
     */
    @Column(name = "src_nc")
    private String srcNc;

    /**
     * 数据包传送端口
     */
    @Column(name = "dst_nc")
    private String dstNc;

    /**
     * flowSessionPath对应的id
     */
    @Column(name = "flow_session_path_id")
    private String flowSessionPathId;

    /**
     * 创建时间
     */
    @Column(name = "create_at")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createAt;

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
     * @return path_info_id
     */
    public String getPathInfoId() {
        return pathInfoId;
    }

    /**
     * @param pathInfoId
     */
    public void setPathInfoId(String pathInfoId) {
        this.pathInfoId = pathInfoId;
    }

    /**
     * 获取交换机节点名称
     *
     * @return node - 交换机节点名称
     */
    public String getNode() {
        return node;
    }

    /**
     * 设置交换机节点名称
     *
     * @param node 交换机节点名称
     */
    public void setNode(String node) {
        this.node = node;
    }

    /**
     * 获取数据包接收端口
     *
     * @return src_nc - 数据包接收端口
     */
    public String getSrcNc() {
        return srcNc;
    }

    /**
     * 设置数据包接收端口
     *
     * @param srcNc 数据包接收端口
     */
    public void setSrcNc(String srcNc) {
        this.srcNc = srcNc;
    }

    /**
     * 获取数据包传送端口
     *
     * @return dst_nc - 数据包传送端口
     */
    public String getDstNc() {
        return dstNc;
    }

    /**
     * 设置数据包传送端口
     *
     * @param dstNc 数据包传送端口
     */
    public void setDstNc(String dstNc) {
        this.dstNc = dstNc;
    }

    /**
     * 获取flowSessionPath对应的id
     *
     * @return flow_session_path_id - flowSessionPath对应的id
     */
    public String getFlowSessionPathId() {
        return flowSessionPathId;
    }

    /**
     * 设置flowSessionPath对应的id
     *
     * @param flowSessionPathId flowSessionPath对应的id
     */
    public void setFlowSessionPathId(String flowSessionPathId) {
        this.flowSessionPathId = flowSessionPathId;
    }

    /**
     * 获取创建时间
     *
     * @return create_at - 创建时间
     */
    public Date getCreateAt() {
        return createAt;
    }

    /**
     * 设置创建时间
     *
     * @param createAt 创建时间
     */
    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
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