package com.crm.dao;

import com.crm.bean.CustomerFeedback;

public interface CustomerFeedbackMapper {
    int deleteByPrimaryKey(Integer customerFeedbackId);

    int insert(CustomerFeedback record);

    int insertSelective(CustomerFeedback record);

    CustomerFeedback selectByPrimaryKey(Integer customerFeedbackId);

    int updateByPrimaryKeySelective(CustomerFeedback record);

    int updateByPrimaryKey(CustomerFeedback record);
}