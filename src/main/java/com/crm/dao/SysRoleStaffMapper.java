package com.crm.dao;

import java.util.List;

import com.crm.bean.SysRoleStaff;

public interface SysRoleStaffMapper {
    int deleteByPrimaryKey(Integer srlId);

    int insert(SysRoleStaff record);

    int insertSelective(SysRoleStaff record);

    SysRoleStaff selectByPrimaryKey(Integer srlId);

    int updateByPrimaryKeySelective(SysRoleStaff record);

    int updateByPrimaryKey(SysRoleStaff record);
    
    List<SysRoleStaff> getPermissionByStaffId(int staffId);
}