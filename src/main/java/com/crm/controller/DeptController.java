package com.crm.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.SysDept;
import com.crm.service.DeptSerivce;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/dept")
public class DeptController {
	
	@Resource
	public DeptSerivce deptServiceImpl;
	
	
	@RequestMapping("/add")
	public String addDept(SysDept dept) {
		
		deptServiceImpl.addDept(dept);
		return "redirect:/addDept.jsp";
	}
	
	@RequestMapping("/getDepList")
	@ResponseBody
	public PageInfo<SysDept> getDeptList(@RequestParam(defaultValue="1")int pn){
		PageInfo<SysDept> deptList = deptServiceImpl.getDeptList(pn);
//		System.out.println(deptList.getList());
		return deptList;
		
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public String del(int[] sysDeptId) {
		
		for (int o : sysDeptId) {
			deptServiceImpl.delDeptByDeptId(o);
		}
				
		return null;
		
	}
	
	@RequestMapping("/goUpdate")
	public String goUpdate(int sysDeptId,Map<String, Object> data) {
		
		SysDept deptByDeptId = deptServiceImpl.getDeptByDeptId(sysDeptId);
		data.put("dept", deptByDeptId);
						
		return "forward:/updateDept.jsp";
		
	}
	
	@RequestMapping("/update")

	public String update(SysDept dept) {
		
		int updateDept = deptServiceImpl.updateDept(dept);
		
				
		return "redirect:/deptList.jsp";
		
	}
	
	
}
