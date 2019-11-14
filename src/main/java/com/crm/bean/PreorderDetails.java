package com.crm.bean;

public class PreorderDetails {
    private Integer preorderDetailsId;

    private Integer preorderId;

    private Integer customerId;

    private Integer kgoodsId;

    private String sysAccountId;

    private Integer kcNumSell;

    public Integer getPreorderDetailsId() {
        return preorderDetailsId;
    }

    public void setPreorderDetailsId(Integer preorderDetailsId) {
        this.preorderDetailsId = preorderDetailsId;
    }

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

    public Integer getKgoodsId() {
        return kgoodsId;
    }

    public void setKgoodsId(Integer kgoodsId) {
        this.kgoodsId = kgoodsId;
    }

    public String getSysAccountId() {
        return sysAccountId;
    }

    public void setSysAccountId(String sysAccountId) {
        this.sysAccountId = sysAccountId == null ? null : sysAccountId.trim();
    }

    public Integer getKcNumSell() {
        return kcNumSell;
    }

    public void setKcNumSell(Integer kcNumSell) {
        this.kcNumSell = kcNumSell;
    }
}