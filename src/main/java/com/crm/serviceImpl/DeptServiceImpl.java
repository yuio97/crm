package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.SysDept;
import com.crm.bean.SysRole;
import com.crm.dao.SysDeptMapper;
import com.crm.service.DeptSerivce;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DeptServiceImpl implements DeptSerivce{
 
	@Resource
	public SysDeptMapper sysDeptMapper;
	
	@Override
	public int addDept(SysDept dept) {
		
		return sysDeptMapper.insertSelective(dept);
	}

	@Override
	public PageInfo<SysDept> getDeptList(int pn) {
		PageHelper.startPage(pn, 10);
		
		List<SysDept> depts = sysDeptMapper.getDeptList();
		PageInfo<SysDept> pageInfo = new PageInfo<SysDept>(depts);
		return pageInfo;
	}

	@Override
	public int delDeptByDeptId(int id) {
		// TODO Auto-generated method stub
		return sysDeptMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateDept(SysDept dept) {
		
		return sysDeptMapper.updateByPrimaryKeySelective(dept);
	}

	@Override
	public SysDept getDeptByDeptId(int id) {
		// TODO Auto-generated method stub
		return sysDeptMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<SysDept> getAllDept() {
		// TODO Auto-generated method stub
		return sysDeptMapper.getDeptList();
	}



}
