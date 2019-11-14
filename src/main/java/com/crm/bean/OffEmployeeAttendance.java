package com.crm.bean;

import java.util.Date;

public class OffEmployeeAttendance {
    private Integer offStaffId;

    private Integer sysDeptId;

    private String offTaskStatus;

    private Integer offPromulgatorId;

    private String offReleaseState;

    private Date bookinTime;

    public Integer getOffStaffId() {
        return offStaffId;
    }

    public void setOffStaffId(Integer offStaffId) {
        this.offStaffId = offStaffId;
    }

    public Integer getSysDeptId() {
        return sysDeptId;
    }

    public void setSysDeptId(Integer sysDeptId) {
        this.sysDeptId = sysDeptId;
    }

    public String getOffTaskStatus() {
        return offTaskStatus;
    }

    public void setOffTaskStatus(String offTaskStatus) {
        this.offTaskStatus = offTaskStatus == null ? null : offTaskStatus.trim();
    }

    public Integer getOffPromulgatorId() {
        return offPromulgatorId;
    }

    public void setOffPromulgatorId(Integer offPromulgatorId) {
        this.offPromulgatorId = offPromulgatorId;
    }

    public String getOffReleaseState() {
        return offReleaseState;
    }

    public void setOffReleaseState(String offReleaseState) {
        this.offReleaseState = offReleaseState == null ? null : offReleaseState.trim();
    }

    public Date getBookinTime() {
        return bookinTime;
    }

    public void setBookinTime(Date bookinTime) {
        this.bookinTime = bookinTime;
    }
}