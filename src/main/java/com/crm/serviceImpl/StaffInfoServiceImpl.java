package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.SysStaffInfo;
import com.crm.dao.SysStaffInfoMapper;
import com.crm.service.StaffInfoService;

@Service("staffInfoService")
public class StaffInfoServiceImpl implements StaffInfoService{
	
	@Resource
	public SysStaffInfoMapper sysStaffInfoMapper;
	
	@Override
	public List<SysStaffInfo> getStaffList() {
		
		return sysStaffInfoMapper.getAllStaff();
	}

	@Override
	public SysStaffInfo getStaffInfoByStaffId(int sysStaffId) {
		
		return sysStaffInfoMapper.selectByPrimaryKey(sysStaffId);
	}

	@Override
	public int updateStaff(SysStaffInfo staff) {
		
		return sysStaffInfoMapper.updateByPrimaryKeySelective(staff);
	}

	@Override
	public int insertStaff(SysStaffInfo info) {
		// TODO Auto-generated method stub
		return sysStaffInfoMapper.insertAndGetId(info);
	}

	@Override
	public int delStaff(int staffId) {
		
		return sysStaffInfoMapper.deleteByPrimaryKey(staffId);
	}



}
