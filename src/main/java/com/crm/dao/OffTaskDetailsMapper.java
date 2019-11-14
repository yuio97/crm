package com.crm.dao;

import com.crm.bean.OffTaskDetails;

public interface OffTaskDetailsMapper {
    int deleteByPrimaryKey(Integer offId);

    int insert(OffTaskDetails record);

    int insertSelective(OffTaskDetails record);

    OffTaskDetails selectByPrimaryKey(Integer offId);

    int updateByPrimaryKeySelective(OffTaskDetails record);

    int updateByPrimaryKey(OffTaskDetails record);
}