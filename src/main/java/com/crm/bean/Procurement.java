package com.crm.bean;

import java.util.List;

public class Procurement {
    private Integer procurementId;

    private Integer customerId;

    private String procurementCase;

    private Integer preorderId;

    private Integer sysAccountId;
    
    private List<ProcurementDetails> proDetaList;
    
    private Customer customer;
    
    private String sysAccountName;

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

	public List<ProcurementDetails> getProDetaList() {
		return proDetaList;
	}

	public void setProDetaList(List<ProcurementDetails> proDetaList) {
		this.proDetaList = proDetaList;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getSysAccountName() {
		return sysAccountName;
	}

	public void setSysAccountName(String sysAccountName) {
		this.sysAccountName = sysAccountName;
	}
    
	
    
}