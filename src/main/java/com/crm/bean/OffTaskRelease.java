package com.crm.bean;

import java.util.Date;

public class OffTaskRelease {
    private Integer missionId;

    private Integer offId;

    private Integer sysDeptId;

    private String releaseState;

    private Date operateTime;
    
    private String sysStaffName;
    
    private String offContent;
    
    
    public String getSysStaffName() {
		return sysStaffName;
	}

	public void setSysStaffName(String sysStaffName) {
		this.sysStaffName = sysStaffName;
	}

	public String getOffContent() {
		return offContent;
	}

	public void setOffContent(String offContent) {
		this.offContent = offContent;
	}

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

    public Integer getSysDeptId() {
        return sysDeptId;
    }

    public void setSysDeptId(Integer sysDeptId) {
        this.sysDeptId = sysDeptId;
    }

    public String getReleaseState() {
        return releaseState;
    }

    public void setReleaseState(String releaseState) {
        this.releaseState = releaseState == null ? null : releaseState.trim();
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }
}