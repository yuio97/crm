package com.crm.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Kcgoods {
    private Integer kcgoodsId;

    private Integer warehouseId;

    private String kgoodsName;

    private String kgoodsSm;

    private Integer kcNum;

    private String danwei;

    private Float cbj;

    private Float lsj;

    private Float jxj;

    private String kcMassage;

    private Integer gsId;

    @JsonFormat(pattern="yyyy-MM-dd")
    private Date kgoodsLastDate;

    private Integer kgoodsId;

    public Integer getKcgoodsId() {
        return kcgoodsId;
    }

    public void setKcgoodsId(Integer kcgoodsId) {
        this.kcgoodsId = kcgoodsId;
    }

    public Integer getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getKgoodsName() {
        return kgoodsName;
    }

    public void setKgoodsName(String kgoodsName) {
        this.kgoodsName = kgoodsName == null ? null : kgoodsName.trim();
    }

    public String getKgoodsSm() {
        return kgoodsSm;
    }

    public void setKgoodsSm(String kgoodsSm) {
        this.kgoodsSm = kgoodsSm == null ? null : kgoodsSm.trim();
    }

    public Integer getKcNum() {
        return kcNum;
    }

    public void setKcNum(Integer kcNum) {
        this.kcNum = kcNum;
    }

    public String getDanwei() {
        return danwei;
    }

    public void setDanwei(String danwei) {
        this.danwei = danwei == null ? null : danwei.trim();
    }

    public Float getCbj() {
        return cbj;
    }

    public void setCbj(Float cbj) {
        this.cbj = cbj;
    }

    public Float getLsj() {
        return lsj;
    }

    public void setLsj(Float lsj) {
        this.lsj = lsj;
    }

    public Float getJxj() {
        return jxj;
    }

    public void setJxj(Float jxj) {
        this.jxj = jxj;
    }

    public String getKcMassage() {
        return kcMassage;
    }

    public void setKcMassage(String kcMassage) {
        this.kcMassage = kcMassage == null ? null : kcMassage.trim();
    }

    public Integer getGsId() {
        return gsId;
    }

    public void setGsId(Integer gsId) {
        this.gsId = gsId;
    }

    public Date getKgoodsLastDate() {
        return kgoodsLastDate;
    }

    public void setKgoodsLastDate(Date kgoodsLastDate) {
        this.kgoodsLastDate = kgoodsLastDate;
    }

    public Integer getKgoodsId() {
        return kgoodsId;
    }

    public void setKgoodsId(Integer kgoodsId) {
        this.kgoodsId = kgoodsId;
    }
}