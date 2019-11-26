package com.crm.bean;

import java.util.Date;
import java.util.List;

public class SysDept {
    private Integer sysDeptId;

    private String sysDeptName;

    private String sysDeptRemark;

    private Integer sysCompanyId;

    private Date sysDeptTime;
    

    public Integer getSysDeptId() {
        return sysDeptId;
    }

    public void setSysDeptId(Integer sysDeptId) {
        this.sysDeptId = sysDeptId;
    }

    public String getSysDeptName() {
        return sysDeptName;
    }

    public void setSysDeptName(String sysDeptName) {
        this.sysDeptName = sysDeptName == null ? null : sysDeptName.trim();
    }

    public String getSysDeptRemark() {
        return sysDeptRemark;
    }

    public void setSysDeptRemark(String sysDeptRemark) {
        this.sysDeptRemark = sysDeptRemark == null ? null : sysDeptRemark.trim();
    }

    public Integer getSysCompanyId() {
        return sysCompanyId;
    }

    public void setSysCompanyId(Integer sysCompanyId) {
        this.sysCompanyId = sysCompanyId;
    }

    public Date getSysDeptTime() {
        return sysDeptTime;
    }

    public void setSysDeptTime(Date sysDeptTime) {
        this.sysDeptTime = sysDeptTime;
    }


    
}