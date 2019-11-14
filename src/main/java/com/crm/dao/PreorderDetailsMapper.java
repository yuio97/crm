package com.crm.dao;

import com.crm.bean.PreorderDetails;

public interface PreorderDetailsMapper {
    int deleteByPrimaryKey(Integer preorderDetailsId);

    int insert(PreorderDetails record);

    int insertSelective(PreorderDetails record);

    PreorderDetails selectByPrimaryKey(Integer preorderDetailsId);

    int updateByPrimaryKeySelective(PreorderDetails record);

    int updateByPrimaryKey(PreorderDetails record);
}