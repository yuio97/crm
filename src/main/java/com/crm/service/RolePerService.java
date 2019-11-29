package com.crm.service;

import com.crm.bean.SysPerRole;
import com.crm.bean.SysRole;

public interface RolePerService {
	
	public int addRolePer(SysPerRole yui);
	
	public int updatePerRole(SysPerRole yui);
	
	public int del(int roleId);
	
	public int updateRolePer(SysRole data);

}
