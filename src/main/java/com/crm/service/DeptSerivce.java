package com.crm.service;

import java.util.List;

import com.crm.bean.SysDept;
import com.crm.bean.SysRole;
import com.github.pagehelper.PageInfo;

public interface DeptSerivce {
	
	public int addDept(SysDept dept);
	
	public PageInfo<SysDept> getDeptList(int pn);
	
	public int delDeptByDeptId(int id);
	
	public int updateDept(SysDept dept);
	
	public SysDept getDeptByDeptId(int id);
	
	public List<SysDept> getAllDept();

}
