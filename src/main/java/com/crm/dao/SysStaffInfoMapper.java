package com.crm.dao;

import java.util.List;

import com.crm.bean.SysRoleStaff;
import com.crm.bean.SysStaffInfo;

public interface SysStaffInfoMapper {
    int deleteByPrimaryKey(Integer sysStaffId);

    int insert(SysStaffInfo record);

    int insertSelective(SysStaffInfo record);

    SysStaffInfo selectByPrimaryKey(Integer sysStaffId);

    int updateByPrimaryKeySelective(SysStaffInfo record);

    int updateByPrimaryKey(SysStaffInfo record);
    
    SysStaffInfo getInfoByStaffName(String name);
    
    List<SysStaffInfo> getAllStaff();
    
    int insertAndGetId(SysStaffInfo info);
}