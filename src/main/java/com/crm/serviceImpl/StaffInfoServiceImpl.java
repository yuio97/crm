package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.SysStaffInfo;
import com.crm.dao.SysStaffInfoMapper;
import com.crm.service.StaffInfoService;

@Service("staffInfoService")
public class StaffInfoServiceImpl implements StaffInfoService{
	
	@Resource
	public SysStaffInfoMapper sysStaffInfoMapper;
	
	@Override
	public List<SysStaffInfo> getStaffList() {
		
		return sysStaffInfoMapper.getAllStaff();
	}

}
