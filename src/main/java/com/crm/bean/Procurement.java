package com.crm.bean;

public class Procurement {
    private Integer procurementId;

    private Integer customerId;

    private String procurementCase;

    private Integer preorderId;

    private Integer sysAccountId;

    public Integer getProcurementId() {
        return procurementId;
    }

    public void setProcurementId(Integer procurementId) {
        this.procurementId = procurementId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getProcurementCase() {
        return procurementCase;
    }

    public void setProcurementCase(String procurementCase) {
        this.procurementCase = procurementCase == null ? null : procurementCase.trim();
    }

    public Integer getPreorderId() {
        return preorderId;
    }

    public void setPreorderId(Integer preorderId) {
        this.preorderId = preorderId;
    }

    public Integer getSysAccountId() {
        return sysAccountId;
    }

    public void setSysAccountId(Integer sysAccountId) {
        this.sysAccountId = sysAccountId;
    }
}