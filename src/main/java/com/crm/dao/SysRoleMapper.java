package com.crm.dao;

import java.util.List;
import com.crm.bean.SysRole;
import com.github.pagehelper.PageInfo;

public interface SysRoleMapper {
    int deleteByPrimaryKey(Integer sysRoleId);
    
    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Integer sysRoleId);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
       
    SysRole getPerByStaffId(int id);
    
	public List<SysRole> getRoleDept();
	
	public SysRole getRolePerByRoleId(int id);
}