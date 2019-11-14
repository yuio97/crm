package com.crm.dao;

import java.util.List;
import com.crm.bean.SysRole;

public interface SysRoleMapper {
    int deleteByPrimaryKey(Integer sysRoleId);
    
    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Integer sysRoleId);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
       
    List<SysRole> getPerByStaffId(int id);
}