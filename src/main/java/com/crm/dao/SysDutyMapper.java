package com.crm.dao;

import com.crm.bean.SysDuty;

public interface SysDutyMapper {
    int deleteByPrimaryKey(Integer sysDutyId);

    int insert(SysDuty record);

    int insertSelective(SysDuty record);

    SysDuty selectByPrimaryKey(Integer sysDutyId);

    int updateByPrimaryKeySelective(SysDuty record);

    int updateByPrimaryKey(SysDuty record);
}