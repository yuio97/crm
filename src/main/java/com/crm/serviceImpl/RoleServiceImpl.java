package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Service;

import com.crm.bean.SysRole;
import com.crm.dao.SysRoleMapper;
import com.crm.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	
	@Resource
	public SysRoleMapper sysRoleMapper;

	@Override
	public SysRole getPermissionByStaffId(int id) {
		SysRole perByStaffId = sysRoleMapper.getPerByStaffId(id);

		return perByStaffId;
	}

	
}	
