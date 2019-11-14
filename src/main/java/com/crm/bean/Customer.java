package com.crm.bean;

public class Customer {
    private Integer customerId;

    private String copanyName;

    private String copanyAdress;

    private String copanyCode;

    private String customerName;

    private String customerEmal;

    private String customerIphone;

    private String customerState;

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCopanyName() {
        return copanyName;
    }

    public void setCopanyName(String copanyName) {
        this.copanyName = copanyName == null ? null : copanyName.trim();
    }

    public String getCopanyAdress() {
        return copanyAdress;
    }

    public void setCopanyAdress(String copanyAdress) {
        this.copanyAdress = copanyAdress == null ? null : copanyAdress.trim();
    }

    public String getCopanyCode() {
        return copanyCode;
    }

    public void setCopanyCode(String copanyCode) {
        this.copanyCode = copanyCode == null ? null : copanyCode.trim();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getCustomerEmal() {
        return customerEmal;
    }

    public void setCustomerEmal(String customerEmal) {
        this.customerEmal = customerEmal == null ? null : customerEmal.trim();
    }

    public String getCustomerIphone() {
        return customerIphone;
    }

    public void setCustomerIphone(String customerIphone) {
        this.customerIphone = customerIphone == null ? null : customerIphone.trim();
    }

    public String getCustomerState() {
        return customerState;
    }

    public void setCustomerState(String customerState) {
        this.customerState = customerState == null ? null : customerState.trim();
    }
}