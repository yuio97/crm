package com.crm.dao;

import com.crm.bean.ProcurementDetails;

public interface ProcurementDetailsMapper {
    int deleteByPrimaryKey(Integer procurementDetailsId);

    int insert(ProcurementDetails record);

    int insertSelective(ProcurementDetails record);

    ProcurementDetails selectByPrimaryKey(Integer procurementDetailsId);

    int updateByPrimaryKeySelective(ProcurementDetails record);

    int updateByPrimaryKey(ProcurementDetails record);
}