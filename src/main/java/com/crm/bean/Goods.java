package com.crm.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Goods {
    private Integer goodsId;

    private String goodsName;

    @DateTimeFormat(pattern="yyyy-mm-dd")
    private Date goodsDate;

    private String goodsSm;

    private String goodsImg;

    private Float goodsPrice;

    private String goodsState;

    private Integer goodsNum;

    private Integer goodsMin;

    private Integer supplierId;
    
    private Supplier supplier;

    public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
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

    public Date getGoodsDate() {
        return goodsDate;
    }

    public void setGoodsDate(Date goodsDate) {
        this.goodsDate = goodsDate;
    }

    public String getGoodsSm() {
        return goodsSm;
    }

    public void setGoodsSm(String goodsSm) {
        this.goodsSm = goodsSm == null ? null : goodsSm.trim();
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg == null ? null : goodsImg.trim();
    }

    public Float getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Float goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsState() {
        return goodsState;
    }

    public void setGoodsState(String goodsState) {
        this.goodsState = goodsState == null ? null : goodsState.trim();
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public Integer getGoodsMin() {
        return goodsMin;
    }

    public void setGoodsMin(Integer goodsMin) {
        this.goodsMin = goodsMin;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", goodsName=" + goodsName + ", goodsDate=" + goodsDate + ", goodsSm="
				+ goodsSm + ", goodsImg=" + goodsImg + ", goodsPrice=" + goodsPrice + ", goodsState=" + goodsState
				+ ", goodsNum=" + goodsNum + ", goodsMin=" + goodsMin + ", supplierId=" + supplierId + "]";
	}
    
}