package com.crm.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PurchasingOrder {
    private Integer porderId;

    private Integer supplierId;

    private Float pay;

    private String payQk;

    private String porderJz;
    

    @JsonFormat(pattern="yyyy-MM-dd")
    private Date porderTime;
    

    @JsonFormat(pattern="yyyy-MM-dd")
    private Date jhTime;

    private String jhAddress;

    private Integer sysStaffId;

    private String pMassage;

    private Integer gsId;
    
    @DateTimeFormat(pattern="yy-mm-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date pLastTime;

    public Integer getPorderId() {
        return porderId;
    }

    public void setPorderId(Integer porderId) {
        this.porderId = porderId;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Float getPay() {
        return pay;
    }

    public void setPay(Float pay) {
        this.pay = pay;
    }

    public String getPayQk() {
        return payQk;
    }

    public void setPayQk(String payQk) {
        this.payQk = payQk == null ? null : payQk.trim();
    }

    public String getPorderJz() {
        return porderJz;
    }

    public void setPorderJz(String porderJz) {
        this.porderJz = porderJz == null ? null : porderJz.trim();
    }

    public Date getPorderTime() {
        return porderTime;
    }

    public void setPorderTime(Date porderTime) {
        this.porderTime = porderTime;
    }

    public Date getJhTime() {
        return jhTime;
    }

    public void setJhTime(Date jhTime) {
        this.jhTime = jhTime;
    }

    public String getJhAddress() {
        return jhAddress;
    }

    public void setJhAddress(String jhAddress) {
        this.jhAddress = jhAddress == null ? null : jhAddress.trim();
    }

    public Integer getSysStaffId() {
        return sysStaffId;
    }

    public void setSysStaffId(Integer sysStaffId) {
        this.sysStaffId = sysStaffId;
    }

    public String getpMassage() {
        return pMassage;
    }

    public void setpMassage(String pMassage) {
        this.pMassage = pMassage == null ? null : pMassage.trim();
    }

    public Integer getGsId() {
        return gsId;
    }

    public void setGsId(Integer gsId) {
        this.gsId = gsId;
    }

    public Date getpLastTime() {
        return pLastTime;
    }

    public void setpLastTime(Date pLastTime) {
        this.pLastTime = pLastTime;
    }
}