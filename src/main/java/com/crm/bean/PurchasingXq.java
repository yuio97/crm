package com.crm.bean;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PurchasingXq {
    private Integer pxId;

    private Integer porderId;

    private Integer goodsId;

    private Integer goodsNum;

    private Float goodsPrice;

    private Integer sysStaffId;

    private String pxMassage;
    
    private List<Goods> goodsList;

    public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

	private Integer gsId;

    @JsonFormat(pattern="yyyy-MM-dd")
    private Date pxLastTime;

    public Integer getPxId() {
        return pxId;
    }

    public void setPxId(Integer pxId) {
        this.pxId = pxId;
    }

    public Integer getPorderId() {
        return porderId;
    }

    public void setPorderId(Integer porderId) {
        this.porderId = porderId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public Float getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Float goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Integer getSysStaffId() {
        return sysStaffId;
    }

    public void setSysStaffId(Integer sysStaffId) {
        this.sysStaffId = sysStaffId;
    }

    public String getPxMassage() {
        return pxMassage;
    }

    public void setPxMassage(String pxMassage) {
        this.pxMassage = pxMassage == null ? null : pxMassage.trim();
    }

    public Integer getGsId() {
        return gsId;
    }

    public void setGsId(Integer gsId) {
        this.gsId = gsId;
    }

    public Date getPxLastTime() {
        return pxLastTime;
    }

    public void setPxLastTime(Date pxLastTime) {
        this.pxLastTime = pxLastTime;
    }
}