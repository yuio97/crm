package com.crm.service;

import java.util.List;

import com.crm.bean.SysRole;
import com.github.pagehelper.PageInfo;

public interface RoleService {
	
	public SysRole getPermissionByStaffId(int id);
	
	public PageInfo<SysRole> getRoleDept(int pn);
	
	public int del(int id);
	
}
