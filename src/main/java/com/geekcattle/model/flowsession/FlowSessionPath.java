package com.geekcattle.model.flowsession;

import java.util.Date;
import javax.persistence.*;

@Table(name = "flow_session_path")
public class FlowSessionPath {
    /**
     * 路径id
     */
    private String id;

    @Id
    @Column(name = "path_id")
    @GeneratedValue(generator = "UUID")
    private String pathId;

    /**
     * session对应得id
     */
    @Column(name = "flow_session_id")
    private String flowSessionId;

    /**
     * 创建时间
     */
    @Column(name = "create_at")
    private Date createAt;

    /**
     * 获取路径id
     *
     * @return id - 路径id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置路径id
     *
     * @param id 路径id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return path_id
     */
    public String getPathId() {
        return pathId;
    }

    /**
     * @param pathId
     */
    public void setPathId(String pathId) {
        this.pathId = pathId;
    }

    /**
     * 获取session对应得id
     *
     * @return flow_session_id - session对应得id
     */
    public String getFlowSessionId() {
        return flowSessionId;
    }

    /**
     * 设置session对应得id
     *
     * @param flowSessionId session对应得id
     */
    public void setFlowSessionId(String flowSessionId) {
        this.flowSessionId = flowSessionId;
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
}