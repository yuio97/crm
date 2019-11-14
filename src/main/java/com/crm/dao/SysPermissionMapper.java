package com.crm.dao;

import com.crm.bean.SysPermission;

public interface SysPermissionMapper {
    int deleteByPrimaryKey(Integer sysPermissionId);

    int insert(SysPermission record);

    int insertSelective(SysPermission record);

    SysPermission selectByPrimaryKey(Integer sysPermissionId);

    int updateByPrimaryKeySelective(SysPermission record);

    int updateByPrimaryKey(SysPermission record);
}