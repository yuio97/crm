package com.crm.dao;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.Procurement;

public interface ProcurementMapper {
    int deleteByPrimaryKey(Integer procurementId);

    int insert(Procurement record);

    int insertSelective(Procurement record);

    Procurement selectByPrimaryKey(Integer procurementId);

    int updateByPrimaryKeySelective(Procurement record);

    int updateByPrimaryKey(Procurement record);
    
    int getProcurements(@Param("clientId") Integer clientId);
}