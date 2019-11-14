package com.crm.dao;

import com.crm.bean.SysDept;

public interface SysDeptMapper {
    int deleteByPrimaryKey(Integer sysDeptId);

    int insert(SysDept record);

    int insertSelective(SysDept record);

    SysDept selectByPrimaryKey(Integer sysDeptId);

    int updateByPrimaryKeySelective(SysDept record);

    int updateByPrimaryKey(SysDept record);
}