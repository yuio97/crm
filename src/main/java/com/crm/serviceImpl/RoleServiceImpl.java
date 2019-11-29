package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Service;

import com.crm.bean.SysRole;
import com.crm.dao.SysRoleMapper;
import com.crm.service.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	
	@Resource
	public SysRoleMapper sysRoleMapper;

	
	public SysRole getPermissionByStaffId(int id) {
		SysRole perByStaffId = sysRoleMapper.getPerByStaffId(id);

		return perByStaffId;
	}
	@Override
	public PageInfo<SysRole> getRoleDept(int pn) {
		
		PageHelper.startPage(pn, 10);
		List<SysRole> roleDept = sysRoleMapper.getRoleDept();
		PageInfo<SysRole> pageInfo = new PageInfo<SysRole>(roleDept);
		return pageInfo;
	}
	@Override
	public int delByRoleId(int id) {
		// TODO Auto-generated method stub
		return sysRoleMapper.deleteByPrimaryKey(id);
	}
	@Override
	public int addRole(SysRole record) {

		return sysRoleMapper.insertSelective(record);
	}
	@Override
	public SysRole getRolePerByRoleId(int roleId) {
		// TODO Auto-generated method stub
		return sysRoleMapper.getRolePerByRoleId(roleId);
	}
	
	@Override
	public List<SysRole> getRoleList() {
		// TODO Auto-generated method stub
		return sysRoleMapper.getRoleDept();
	}
	
	
	
}	
