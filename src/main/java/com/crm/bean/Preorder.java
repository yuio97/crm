package com.crm.bean;

import java.util.Date;

public class Preorder {
    private Integer preorderId;

    private Integer customerId;

    private String preorderNote;

    private String payCase;

    private Date deliveryTime;

    private String deliveryPlace;

    private Integer sysAccountId;

    private Date preorderTme;

    public Integer getPreorderId() {
        return preorderId;
    }

    public void setPreorderId(Integer preorderId) {
        this.preorderId = preorderId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getPreorderNote() {
        return preorderNote;
    }

    public void setPreorderNote(String preorderNote) {
        this.preorderNote = preorderNote == null ? null : preorderNote.trim();
    }

    public String getPayCase() {
        return payCase;
    }

    public void setPayCase(String payCase) {
        this.payCase = payCase == null ? null : payCase.trim();
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getDeliveryPlace() {
        return deliveryPlace;
    }

    public void setDeliveryPlace(String deliveryPlace) {
        this.deliveryPlace = deliveryPlace == null ? null : deliveryPlace.trim();
    }

    public Integer getSysAccountId() {
        return sysAccountId;
    }

    public void setSysAccountId(Integer sysAccountId) {
        this.sysAccountId = sysAccountId;
    }

    public Date getPreorderTme() {
        return preorderTme;
    }

    public void setPreorderTme(Date preorderTme) {
        this.preorderTme = preorderTme;
    }
}