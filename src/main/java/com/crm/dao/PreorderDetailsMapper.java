package com.crm.dao;

import com.crm.bean.PreorderDetails;
import com.crm.bean.ProcurementDetails;

public interface PreorderDetailsMapper {
    int deleteByPrimaryKey(Integer preorderDetailsId);

    int insert(PreorderDetails record);

    int insertSelective(PreorderDetails record);

    PreorderDetails selectByPrimaryKey(Integer preorderDetailsId);

    int updateByPrimaryKeySelective(PreorderDetails record);

    int updateByPrimaryKey(PreorderDetails record);
    
    int update(PreorderDetails preorderDetails);
}