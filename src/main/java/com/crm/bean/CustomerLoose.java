package com.crm.bean;

public class CustomerLoose {
    private Integer customerLooseId;

    private Integer customerId;

    private String state;

    private String customerState;

    private Integer sysAccountId;

    public Integer getCustomerLooseId() {
        return customerLooseId;
    }

    public void setCustomerLooseId(Integer customerLooseId) {
        this.customerLooseId = customerLooseId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getCustomerState() {
        return customerState;
    }

    public void setCustomerState(String customerState) {
        this.customerState = customerState == null ? null : customerState.trim();
    }

    public Integer getSysAccountId() {
        return sysAccountId;
    }

    public void setSysAccountId(Integer sysAccountId) {
        this.sysAccountId = sysAccountId;
    }
}