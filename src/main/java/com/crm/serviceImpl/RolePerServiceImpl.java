package com.crm.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.SysPerRole;
import com.crm.bean.SysRole;
import com.crm.dao.SysPerRoleMapper;
import com.crm.service.RolePerService;

@Service
public class RolePerServiceImpl implements RolePerService{
	
	@Resource
	private SysPerRoleMapper sysPerRoleMapper;	
	
	@Override
	public int addRolePer(SysPerRole yui) {
		// TODO Auto-generated method stub
		return sysPerRoleMapper.insertSelective(yui);
	}

	@Override
	public int updatePerRole(SysPerRole yui) {
		// TODO Auto-generated method stub
		return sysPerRoleMapper.updateByPrimaryKeySelective(yui);
	}

	@Override
	public int del(int roleId) {
		// TODO Auto-generated method stub
		return sysPerRoleMapper.deleteByRoleId(roleId);
	}

	@Override
	public int updateRolePer(SysRole data) {
		int i = 0;
		//删除该角色所有权限
		i = sysPerRoleMapper.deleteByRoleId(data.getSysRoleId());
				
				//重新添加
				for (SysPerRole a : data.getPerRoleList()) {
					SysPerRole perRole = new SysPerRole();
					perRole.setRoleId(data.getSysRoleId());
					perRole.setPerId(a.getPerId());
					i = sysPerRoleMapper.insertSelective(perRole);
				}
		return i;
	}

}
