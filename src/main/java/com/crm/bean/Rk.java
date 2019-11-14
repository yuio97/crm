package com.crm.bean;

import java.util.Date;

public class Rk {
    private Integer rkId;

    private Integer goodsId;

    private String goodsName;

    private Integer rkNum;

    private Date rkTime;

    private String rkMassage;

    private Date rkLastTime;

    public Integer getRkId() {
        return rkId;
    }

    public void setRkId(Integer rkId) {
        this.rkId = rkId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Integer getRkNum() {
        return rkNum;
    }

    public void setRkNum(Integer rkNum) {
        this.rkNum = rkNum;
    }

    public Date getRkTime() {
        return rkTime;
    }

    public void setRkTime(Date rkTime) {
        this.rkTime = rkTime;
    }

    public String getRkMassage() {
        return rkMassage;
    }

    public void setRkMassage(String rkMassage) {
        this.rkMassage = rkMassage == null ? null : rkMassage.trim();
    }

    public Date getRkLastTime() {
        return rkLastTime;
    }

    public void setRkLastTime(Date rkLastTime) {
        this.rkLastTime = rkLastTime;
    }
}