package com.crm.dao;

import java.util.List;

import com.crm.bean.SysDept;
import com.crm.bean.SysRole;

public interface SysDeptMapper {
    int deleteByPrimaryKey(Integer sysDeptId);

    int insert(SysDept record);

    int insertSelective(SysDept record);

    SysDept selectByPrimaryKey(Integer sysDeptId);

    int updateByPrimaryKeySelective(SysDept record);

    int updateByPrimaryKey(SysDept record);
    
    List<SysDept> getDeptList();
    
   
    
}