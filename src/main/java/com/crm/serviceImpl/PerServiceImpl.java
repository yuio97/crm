package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.SysPermission;
import com.crm.dao.SysPermissionMapper;
import com.crm.service.PerService;

@Service
public class PerServiceImpl implements PerService{

	@Resource
	public SysPermissionMapper sysPermissionMapper;
	
	@Override
	public List<SysPermission> getMenuList(int StaffId) {
		
		return sysPermissionMapper.getMenuList(StaffId);
	}
	
	
}
