package com.crm.bean;

import java.util.Date;

public class SysDuty {
    private Integer sysDutyId;

    private String sysDutyName;

    private Integer sysCompanyDept;

    private String sysDutyRemark;

    private Integer sysCompanyId;

    private Date sysDutyTime;

    public Integer getSysDutyId() {
        return sysDutyId;
    }

    public void setSysDutyId(Integer sysDutyId) {
        this.sysDutyId = sysDutyId;
    }

    public String getSysDutyName() {
        return sysDutyName;
    }

    public void setSysDutyName(String sysDutyName) {
        this.sysDutyName = sysDutyName == null ? null : sysDutyName.trim();
    }

    public Integer getSysCompanyDept() {
        return sysCompanyDept;
    }

    public void setSysCompanyDept(Integer sysCompanyDept) {
        this.sysCompanyDept = sysCompanyDept;
    }

    public String getSysDutyRemark() {
        return sysDutyRemark;
    }

    public void setSysDutyRemark(String sysDutyRemark) {
        this.sysDutyRemark = sysDutyRemark == null ? null : sysDutyRemark.trim();
    }

    public Integer getSysCompanyId() {
        return sysCompanyId;
    }

    public void setSysCompanyId(Integer sysCompanyId) {
        this.sysCompanyId = sysCompanyId;
    }

    public Date getSysDutyTime() {
        return sysDutyTime;
    }

    public void setSysDutyTime(Date sysDutyTime) {
        this.sysDutyTime = sysDutyTime;
    }
}