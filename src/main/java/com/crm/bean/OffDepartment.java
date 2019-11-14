package com.crm.bean;

import java.util.Date;

public class OffDepartment {
    private Integer sysDeptId;

    private Integer offId;

    private String dTaskStatus;

    private Date dTime;

    public Integer getSysDeptId() {
        return sysDeptId;
    }

    public void setSysDeptId(Integer sysDeptId) {
        this.sysDeptId = sysDeptId;
    }

    public Integer getOffId() {
        return offId;
    }

    public void setOffId(Integer offId) {
        this.offId = offId;
    }

    public String getdTaskStatus() {
        return dTaskStatus;
    }

    public void setdTaskStatus(String dTaskStatus) {
        this.dTaskStatus = dTaskStatus == null ? null : dTaskStatus.trim();
    }

    public Date getdTime() {
        return dTime;
    }

    public void setdTime(Date dTime) {
        this.dTime = dTime;
    }
}