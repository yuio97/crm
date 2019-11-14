package com.crm.bean;

import java.util.Date;

public class OffDepartmentStaff {
    private Integer offStaffId;

    private Integer offId;

    private String sTaskSituation;

    private Date sTime;

    public Integer getOffStaffId() {
        return offStaffId;
    }

    public void setOffStaffId(Integer offStaffId) {
        this.offStaffId = offStaffId;
    }

    public Integer getOffId() {
        return offId;
    }

    public void setOffId(Integer offId) {
        this.offId = offId;
    }

    public String getsTaskSituation() {
        return sTaskSituation;
    }

    public void setsTaskSituation(String sTaskSituation) {
        this.sTaskSituation = sTaskSituation == null ? null : sTaskSituation.trim();
    }

    public Date getsTime() {
        return sTime;
    }

    public void setsTime(Date sTime) {
        this.sTime = sTime;
    }
}