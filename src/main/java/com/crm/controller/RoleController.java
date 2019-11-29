package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.SysDept;
import com.crm.bean.SysPerRole;
import com.crm.bean.SysPermission;
import com.crm.bean.SysRole;
import com.crm.dao.SysPerRoleMapper;
import com.crm.service.DeptSerivce;
import com.crm.service.PerService;
import com.crm.service.RolePerService;
import com.crm.service.RoleService;
import com.crm.serviceImpl.DeptServiceImpl;
import com.crm.serviceImpl.PerServiceImpl;
import com.crm.serviceImpl.RolePerServiceImpl;
import com.github.pagehelper.PageInfo;

@Controller()
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	public RoleService roleServiceImpl;
	
	@Resource
	public DeptSerivce deptServiceImpl;
	
	@Resource
	public PerService perServiceImpl;
	
	@Resource
	public RolePerService rolePerServiceImpl;
	
	@RequestMapping("/getRoleList")
	@ResponseBody
	public PageInfo<SysRole> getRoleList(@RequestParam(defaultValue="1")int pn) {
		
		PageInfo<SysRole> roleDept = roleServiceImpl.getRoleDept(pn);
		
		return roleDept;
		
	}
	
//	@RequestMapping("/getRoleList1")
//	public String getRoleList1(@RequestParam(defaultValue="1")int pn,Map<String, Object> data) {
//		
//		PageInfo<SysRole> roleDept = roleServiceImpl.getRoleDept(pn);
//		data.put("rolelist", roleDept);
//		return "redirect:roleList.jsp";
//		
//	}
	
	@RequestMapping("/goAddRole")
	public String goAddRole(Map<String, Object> data) {
		List<SysPermission> perList = perServiceImpl.getPerList();
		List<SysDept> allDept = deptServiceImpl.getAllDept();
//		System.out.println(perList);
		data.put("dept", allDept);
		data.put("per", perList);
		return "forward:/addRole.jsp";				
	}
	

	
	@RequestMapping("/add")
	public String addRole(@RequestBody SysRole  data) {
		
//		System.out.println(data.getSysRoleName());
		
		
	
		roleServiceImpl.addRole(data);
		int roleId = data.getSysRoleId(); 
		for (SysPerRole a : data.getPerRoleList()) {
			SysPerRole perRole = new SysPerRole();
			perRole.setRoleId(roleId);
			perRole.setPerId(a.getPerId());
			rolePerServiceImpl.addRolePer(perRole);
		}
		
		
		System.out.println("---------");
		return "forward:/addRole.jsp";
				
	}
	
	@RequestMapping("/del")
	public String del(int[] id) {
		for (int i : id) {
			roleServiceImpl.delByRoleId(i);
		}
		return "redirect:/roleList.jsp";
		
	}
	
	@RequestMapping("goUpdate")
	public String goUpdata(int roleId,Map<String, Object> data) {
		List<SysPermission> perList = perServiceImpl.getPerList(); //获得所有权限
		
		SysRole role = roleServiceImpl.getRolePerByRoleId(roleId);  //获得该角色所有权限
		SysDept sysDept = deptServiceImpl.getDeptByDeptId(Integer.valueOf(role.getSysRoleOper())); 
		if(role.getPerRoleList() != null) {
			for (SysPermission per : perList) {
				for (SysPermission s : per.getSonPer()) {
					for (SysPerRole rolePer : role.getPerRoleList()) {
						if(per.getSysPermissionId() == rolePer.getPerId())
						{
							per.setSysPerParentids("checked");
						}
						if(s.getSysPermissionId() == rolePer.getPerId())
						{
							s.setSysPerParentids("checked");
						}	
					}
				}
			}
		}	
		data.put("per", perList);
		data.put("role", role);
		data.put("deptName",sysDept.getSysDeptName());
		return "forward:/updateRole.jsp";	
	}
	

	
	@RequestMapping("/update")
	@ResponseBody
	public String updata(@RequestBody SysRole  data) {
		System.out.println("1111");
		int updateRolePer = rolePerServiceImpl.updateRolePer(data);
//		System.out.println(updateRolePer);
		return "true";
	}
	
	
}
