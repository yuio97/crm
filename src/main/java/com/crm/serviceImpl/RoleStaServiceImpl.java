package com.crm.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.SysPerRole;
import com.crm.bean.SysRole;
import com.crm.bean.SysRoleStaff;
import com.crm.dao.SysRoleMapper;
import com.crm.dao.SysRoleStaffMapper;
import com.crm.service.RolePerService;
import com.crm.service.RoleStaffService;

@Service
public class RoleStaServiceImpl implements RoleStaffService{

	@Resource
	private SysRoleStaffMapper 	sysRoleStaffMapper;
	
	@Override
	public int addRoleStaff(SysRoleStaff record) {
		// TODO Auto-generated method stub
		return sysRoleStaffMapper.insertSelective(record);
	}


	
}
