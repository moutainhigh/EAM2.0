package com.tiansu.eam.modules.maintain.entity;/**
 * Created by suven on 2017/11/2.
 */

import com.tiansu.eam.common.persistence.DataEntity;

import java.util.Date;
import java.util.List;

/**
 * @creator duanfuju
 * @createtime 2017/11/2 15:22
 * @description:
 *      保养年计划
 */
public class MaintainProject  extends DataEntity<MaintainProject> {

    private String id_key;//主键
    private String project_code;//保养计划编码
    private String project_name;//名称
    private String project_mode;//类型
    private String project_type;//分类
    private String project_empid;//保养人
    private String project_sp_empid;//审批人
    private Date project_sp_time;//审批时间
    private String project_cycleyear;//保养年份
    private String project_period;  //保养周期
    private String project_cycle;//	保养周期详情
    private Date project_stime;//启动时间
    private String project_status;//审批状态
    private String project_bm;//保养部门
    private String status;//状态
    private String project_reason;//退回理由
    private String dev_id;//设备
    private List<MaintainProjectContent> maintainProjectContents;//保养内容
    private String project_produceyear;//生成年份
    private String projectset_id;//关联设置id

    public String getDev_id() {
        return dev_id;
    }

    public void setDev_id(String dev_id) {
        this.dev_id = dev_id;
    }

    public List<MaintainProjectContent> getMaintainProjectContents() {
        return maintainProjectContents;
    }

    public void setMaintainProjectContents(List<MaintainProjectContent> maintainProjectContents) {
        this.maintainProjectContents = maintainProjectContents;
    }

    public String getId_key() {
        return id_key;
    }

    public void setId_key(String id_key) {
        this.id_key = id_key;
    }

    public String getProject_period() {
        return project_period;
    }

    public void setProject_period(String project_period) {
        this.project_period = project_period;
    }

    public String getProject_code() {
        return project_code;
    }

    public void setProject_code(String project_code) {
        this.project_code = project_code;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getProject_mode() {
        return project_mode;
    }

    public void setProject_mode(String project_mode) {
        this.project_mode = project_mode;
    }

    public String getProject_type() {
        return project_type;
    }

    public void setProject_type(String project_type) {
        this.project_type = project_type;
    }

    public String getProject_empid() {
        return project_empid;
    }

    public void setProject_empid(String project_empid) {
        this.project_empid = project_empid;
    }

    public String getProject_sp_empid() {
        return project_sp_empid;
    }

    public void setProject_sp_empid(String project_sp_empid) {
        this.project_sp_empid = project_sp_empid;
    }

    public Date getProject_sp_time() {
        return project_sp_time;
    }

    public void setProject_sp_time(Date project_sp_time) {
        this.project_sp_time = project_sp_time;
    }

    public String getProject_cycleyear() {
        return project_cycleyear;
    }

    public void setProject_cycleyear(String project_cycleyear) {
        this.project_cycleyear = project_cycleyear;
    }

    public String getProject_cycle() {
        return project_cycle;
    }

    public void setProject_cycle(String project_cycle) {
        this.project_cycle = project_cycle;
    }

    public Date getProject_stime() {
        return project_stime;
    }

    public void setProject_stime(Date project_stime) {
        this.project_stime = project_stime;
    }

    public String getProject_status() {
        return project_status;
    }

    public void setProject_status(String project_status) {
        this.project_status = project_status;
    }

    public String getProject_bm() {
        return project_bm;
    }

    public void setProject_bm(String project_bm) {
        this.project_bm = project_bm;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProject_reason() {
        return project_reason;
    }

    public void setProject_reason(String project_reason) {
        this.project_reason = project_reason;
    }

    public String getProject_produceyear() {
        return project_produceyear;
    }

    public void setProject_produceyear(String project_produceyear) {
        this.project_produceyear = project_produceyear;
    }

    public String getProjectset_id() {
        return projectset_id;
    }

    public void setProjectset_id(String projectset_id) {
        this.projectset_id = projectset_id;
    }
}
