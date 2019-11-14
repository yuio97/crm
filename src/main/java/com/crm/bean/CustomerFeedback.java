package com.crm.bean;

import java.util.Date;

public class CustomerFeedback {
    private Integer customerFeedbackId;

    private Integer customerId;

    private Integer kgoodsId;

    private String customerFeedbackDetails;

    private Date customerFeedbackTime;

    public Integer getCustomerFeedbackId() {
        return customerFeedbackId;
    }

    public void setCustomerFeedbackId(Integer customerFeedbackId) {
        this.customerFeedbackId = customerFeedbackId;
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

    public String getCustomerFeedbackDetails() {
        return customerFeedbackDetails;
    }

    public void setCustomerFeedbackDetails(String customerFeedbackDetails) {
        this.customerFeedbackDetails = customerFeedbackDetails == null ? null : customerFeedbackDetails.trim();
    }

    public Date getCustomerFeedbackTime() {
        return customerFeedbackTime;
    }

    public void setCustomerFeedbackTime(Date customerFeedbackTime) {
        this.customerFeedbackTime = customerFeedbackTime;
    }
}