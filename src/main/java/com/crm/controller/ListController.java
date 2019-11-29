package com.crm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.SysAccount;
import com.crm.bean.SysDept;
import com.crm.bean.SysPermission;
import com.crm.bean.SysRole;
import com.crm.bean.SysStaffInfo;
import com.crm.service.DeptSerivce;
import com.crm.service.PerService;
import com.crm.service.RoleService;
import com.crm.service.StaffInfoService;
import com.crm.serviceImpl.PerServiceImpl;

@Controller
public class ListController {
	
	@Resource
	public RoleService roleService;
	
	@Resource
	public PerService perServiceImpl;
	
	@Resource
	public DeptSerivce deptServiceImpl;
	
	@Resource
	public StaffInfoService staffInfoService;
	
	@RequestMapping("/getList")
	@ResponseBody
	public HashMap<String, Object> getList(HttpServletRequest req) {
		//获得登录用户bean
		Subject subject = SecurityUtils.getSubject();
		SysAccount user = (SysAccount) subject.getPrincipal();

		
		List<SysPermission> sysPer = new ArrayList<>();
		//查询登录用户相关角色及权限
		SysRole perByStaffId = roleService.getPermissionByStaffId(user.getSysStaffId());
		
//		System.out.println(perByStaffId.getSysRoleName());
//		for (SysPermission list : perByStaffId.getSysPerList()) {
//			if(list.getSysPerParentid() == 1) {
//				sysPer.add(list);
//			}
//			for(SysPermission per:sysPer) {
//				if(per.getSysPerParentid() == list.getSysPermissionId()) {
//					per.getSonPer().add(list);
//				}
//			}
//										
//		};
		
		SysStaffInfo info = staffInfoService.getStaffInfoByStaffId(user.getSysStaffId());
		List<SysPermission> menuList = perServiceImpl.getMenuList(user.getSysStaffId());
		SysRole role = roleService.getRolePerByRoleId(Integer.valueOf(user.getSysStaffId()));
		SysDept dept = deptServiceImpl.getDeptByDeptId(Integer.valueOf(info.getSysCompanyId()));
		//传递登录用户bean给页面
		HashMap<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("perList",menuList);
		map.put("role", role);
		map.put("dept", dept);
		return map;
	}
}
