package com.crm.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AddGood {
    private Integer addgId;

    private Integer goodsId;

    @DateTimeFormat(pattern="yyyy-mm-dd")
    private Date addgTime;

    private String addgState;

    private Integer sysStaffId;

    private String addgMassage;

    private Integer gsId;

    private Date addgLastTime;

    public Integer getAddgId() {
        return addgId;
    }

    public void setAddgId(Integer addgId) {
        this.addgId = addgId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Date getAddgTime() {
        return addgTime;
    }

    public void setAddgTime(Date addgTime) {
        this.addgTime = addgTime;
    }

    public String getAddgState() {
        return addgState;
    }

    public void setAddgState(String addgState) {
        this.addgState = addgState == null ? null : addgState.trim();
    }

    public Integer getSysStaffId() {
        return sysStaffId;
    }

    public void setSysStaffId(Integer sysStaffId) {
        this.sysStaffId = sysStaffId;
    }

    public String getAddgMassage() {
        return addgMassage;
    }

    public void setAddgMassage(String addgMassage) {
        this.addgMassage = addgMassage == null ? null : addgMassage.trim();
    }

    public Integer getGsId() {
        return gsId;
    }

    public void setGsId(Integer gsId) {
        this.gsId = gsId;
    }

    public Date getAddgLastTime() {
        return addgLastTime;
    }

    public void setAddgLastTime(Date addgLastTime) {
        this.addgLastTime = addgLastTime;
    }
}