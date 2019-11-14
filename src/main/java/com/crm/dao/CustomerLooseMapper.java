package com.crm.dao;

import com.crm.bean.CustomerLoose;

public interface CustomerLooseMapper {
    int deleteByPrimaryKey(Integer customerLooseId);

    int insert(CustomerLoose record);

    int insertSelective(CustomerLoose record);

    CustomerLoose selectByPrimaryKey(Integer customerLooseId);

    int updateByPrimaryKeySelective(CustomerLoose record);

    int updateByPrimaryKey(CustomerLoose record);
}