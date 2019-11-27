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
import com.crm.bean.SysRole;
import com.crm.service.DeptSerivce;
import com.crm.service.RoleService;
import com.crm.serviceImpl.DeptServiceImpl;
import com.github.pagehelper.PageInfo;

@Controller()
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	public RoleService roleServiceImpl;
	
	@Resource
	public DeptSerivce deptServiceImpl;
	
	@RequestMapping("/getRoleList")
	@ResponseBody
	public PageInfo<SysRole> getRoleList(@RequestParam(defaultValue="1")int pn) {
		
		PageInfo<SysRole> roleDept = roleServiceImpl.getRoleDept(pn);
		
		return roleDept;
		
	}
	
	@RequestMapping("/getRoleList1")
	public String getRoleList1(@RequestParam(defaultValue="1")int pn,Map<String, Object> data) {
		
		PageInfo<SysRole> roleDept = roleServiceImpl.getRoleDept(pn);
		data.put("rolelist", roleDept);
		return "redirect:roleList.jsp";
		
	}
	
	@RequestMapping("/goAddRole")
	public String goAddRole(Map<String, Object> data) {
		
		List<SysDept> allDept = deptServiceImpl.getAllDept();
		data.put("dept", allDept);
		return "forward:/addRole.jsp";
				
	}
	@RequestMapping("/add")
	public String addRole(SysRole role,Map<String, Object> data) {
		
		
		
		List<SysDept> allDept = deptServiceImpl.getAllDept();
		data.put("dept", allDept);
		return "forward:/addRole.jsp";
		
		
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public String del(@RequestBody List<HashMap<String, Integer>> ids  ) {
		for (HashMap<String, Integer> hashMap : ids) {
			roleServiceImpl.del(hashMap.get("id"));
		}
		return null;
		
	}
	
	
}
