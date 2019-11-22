package com.crm.service;

import java.util.List;

import com.crm.bean.SysStaffInfo;

public interface StaffInfoService {
	
	public List<SysStaffInfo> getStaffList();
	
	public SysStaffInfo getStaffInfoByStaffId(int sysStaffId);
	
	public int updateStaff(SysStaffInfo staff);
}
