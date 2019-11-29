package com.crm.service;

import java.util.List;

import com.crm.bean.SysRole;
import com.github.pagehelper.PageInfo;

public interface RoleService {
	
	public SysRole getPermissionByStaffId(int id);
	
	public PageInfo<SysRole> getRoleDept(int pn);
	
	public int delByRoleId(int id);
	
	public int addRole(SysRole record);
	
	public SysRole getRolePerByRoleId(int roleId);
	
	public List<SysRole> getRoleList();
	
	
}
