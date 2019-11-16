package com.crm.bean;

public class OffEmployeeMonthlyAttendance {
    private Integer yueTaskStatustId;

    private Integer offStaffId;

    private Integer sysDeptId;

    private Integer offPromulgatorId;

    private String offReleaseState;

    private String offYearMoon;

    public Integer getYueTaskStatustId() {
        return yueTaskStatustId;
    }

    public void setYueTaskStatustId(Integer yueTaskStatustId) {
        this.yueTaskStatustId = yueTaskStatustId;
    }

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

    public String getOffYearMoon() {
        return offYearMoon;
    }

    public void setOffYearMoon(String offYearMoon) {
        this.offYearMoon = offYearMoon == null ? null : offYearMoon.trim();
    }
}