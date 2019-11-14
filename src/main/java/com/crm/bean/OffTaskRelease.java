package com.crm.bean;

import java.util.Date;

public class OffTaskRelease {
    private Integer missionId;

    private Integer offId;

    private String offContent;

    private Integer sysDeptId;

    private String offReceiveStatus;

    private Date offTime;

    public Integer getMissionId() {
        return missionId;
    }

    public void setMissionId(Integer missionId) {
        this.missionId = missionId;
    }

    public Integer getOffId() {
        return offId;
    }

    public void setOffId(Integer offId) {
        this.offId = offId;
    }

    public String getOffContent() {
        return offContent;
    }

    public void setOffContent(String offContent) {
        this.offContent = offContent == null ? null : offContent.trim();
    }

    public Integer getSysDeptId() {
        return sysDeptId;
    }

    public void setSysDeptId(Integer sysDeptId) {
        this.sysDeptId = sysDeptId;
    }

    public String getOffReceiveStatus() {
        return offReceiveStatus;
    }

    public void setOffReceiveStatus(String offReceiveStatus) {
        this.offReceiveStatus = offReceiveStatus == null ? null : offReceiveStatus.trim();
    }

    public Date getOffTime() {
        return offTime;
    }

    public void setOffTime(Date offTime) {
        this.offTime = offTime;
    }
}