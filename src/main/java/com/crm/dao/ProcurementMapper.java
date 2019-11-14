package com.crm.dao;

import com.crm.bean.Procurement;

public interface ProcurementMapper {
    int deleteByPrimaryKey(Integer procurementId);

    int insert(Procurement record);

    int insertSelective(Procurement record);

    Procurement selectByPrimaryKey(Integer procurementId);

    int updateByPrimaryKeySelective(Procurement record);

    int updateByPrimaryKey(Procurement record);
}