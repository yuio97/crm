package com.crm.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.bean.OffTaskDetails;
import com.crm.bean.SysAccount;
import com.crm.dao.OffTaskDetailsMapper;

@Service("taskService")
public class TaskServiceImpl implements TaskService{
	

	@Autowired//跟@Resource一样
	private OffTaskDetailsMapper offTaskDetailsMapper;

	@Override
	public void updateDetTaskStatus(int id) {
		//逻辑
		OffTaskDetails offTaskDetails = new OffTaskDetails();
		offTaskDetails.setOffId(id);
		offTaskDetails.setDetTaskStatus("1");//根据set到的当前id设置发布状态默认值为1
		offTaskDetailsMapper.updateByPrimaryKeySelective(offTaskDetails);
	}

	@Override
	public List<OffTaskDetails> getAllTaskDetails() {
		
//		Subject subject = SecurityUtils.getSubject();
//		SysAccount sysAccount = (SysAccount)subject.getPrincipal();
		List<OffTaskDetails> allTaskDetails = offTaskDetailsMapper.getAllTaskDetails(1);//设置默认发布者编号为1
		return allTaskDetails;
	}

	@Override
	public int insert(OffTaskDetails record) {
		record.setDetTime(new Date());
		record.setOffPromulgatorId(1);
		record.setDetTaskStatus("0");//设置3个默认值
		int insert = offTaskDetailsMapper.insert(record);
		return insert;
	}

}
