package com.crm.bean;

import java.util.Date;

public class OffTaskDetails {
    private Integer offId;

    private String detTaskStatus;

    private Integer offPromulgatorId;

    private Date detTime;

    public Integer getOffId() {
        return offId;
    }

    public void setOffId(Integer offId) {
        this.offId = offId;
    }

    public String getDetTaskStatus() {
        return detTaskStatus;
    }

    public void setDetTaskStatus(String detTaskStatus) {
        this.detTaskStatus = detTaskStatus == null ? null : detTaskStatus.trim();
    }

    public Integer getOffPromulgatorId() {
        return offPromulgatorId;
    }

    public void setOffPromulgatorId(Integer offPromulgatorId) {
        this.offPromulgatorId = offPromulgatorId;
    }

    public Date getDetTime() {
        return detTime;
    }

    public void setDetTime(Date detTime) {
        this.detTime = detTime;
    }
}