package com.crm.bean;

public class ProcurementDetails {
    private Integer procurementDetailsId;

    private Integer procurementId;

    private Integer customerId;

    private Integer kgoodsId;

    private Integer sysAccountId;

    private  Kcgoods kcgoods;
    
    public Integer getProcurementDetailsId() {
        return procurementDetailsId;
    }

    public void setProcurementDetailsId(Integer procurementDetailsId) {
        this.procurementDetailsId = procurementDetailsId;
    }

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

    public Integer getKgoodsId() {
        return kgoodsId;
    }

    public void setKgoodsId(Integer kgoodsId) {
        this.kgoodsId = kgoodsId;
    }

    public Integer getSysAccountId() {
        return sysAccountId;
    }

    public void setSysAccountId(Integer sysAccountId) {
        this.sysAccountId = sysAccountId;
    }

	public Kcgoods getKcgoods() {
		return kcgoods;
	}

	public void setKcgoods(Kcgoods kcgoods) {
		this.kcgoods = kcgoods;
	}
    
    
}