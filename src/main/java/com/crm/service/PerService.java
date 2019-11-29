package com.crm.service;

import java.util.List;

import com.crm.bean.SysPermission;

public interface PerService {
	
	public List<SysPermission> getMenuList(int StaffId);
	
	public List<SysPermission> getPerList();
}
