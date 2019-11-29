package com.crm.dao;

import com.crm.bean.SysPerRole;

public interface SysPerRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysPerRole record);

    int insertSelective(SysPerRole record);

    SysPerRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysPerRole record);

    int updateByPrimaryKey(SysPerRole record);
    
    int deleteByRoleId(Integer id);
}