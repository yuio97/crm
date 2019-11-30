package com.crm.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.type.InstantTypeHandler;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.bean.OffEmployeeAttendance;
import com.crm.bean.OffTaskDetails;
import com.crm.bean.OffTaskRelease;
import com.crm.bean.SysAccount;
import com.crm.bean.s;
import com.crm.dao.OffEmployeeAttendanceMapper;
import com.crm.dao.OffTaskDetailsMapper;
import com.crm.dao.OffTaskReleaseMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("taskService")
public class TaskServiceImpl implements TaskService{

	@Autowired//跟@Resource一样
	private OffTaskDetailsMapper offTaskDetailsMapper;
	
	@Resource
	private OffTaskReleaseMapper offTaskReleaseMapper;
	
	@Resource
	private OffEmployeeAttendanceMapper offEmployeeAttendanceMapper;
	
	
	//目标管理
	@Override
	public void updateDetTaskStatus(int id) {
		//逻辑
		OffTaskDetails offTaskDetails = new OffTaskDetails();
		offTaskDetails.setOffId(id);
		offTaskDetails.setDetTime(new Date());
		offTaskDetails.setDetTaskStatus("1");//根据set到的当前id设置发布状态默认值为1
		offTaskDetailsMapper.updateByPrimaryKeySelective(offTaskDetails);
	}

	@Override
	public int insert(OffTaskDetails record) {
		record.setDetTime(new Date());
		record.setOffPromulgatorId(1);
		record.setDetTaskStatus("0");//设置3个默认值
		int insert = offTaskDetailsMapper.insert(record);
		return insert;
	}

	@Override
	public OffTaskDetails selectByPrimaryKey(Integer offId) {
		OffTaskDetails selectByPrimaryKey = offTaskDetailsMapper.selectByPrimaryKey(offId);
		return selectByPrimaryKey;
	}

	@Override
	public int insert(OffTaskRelease record) {
		int insert = offTaskReleaseMapper.insert(record);
		return insert;
	}
	
	@Override
	public int updateByPrimaryKeySelective(OffTaskDetails record) {
		return offTaskDetailsMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public List<OffTaskRelease> selectPublishedTask(Integer offId) {
		List<OffTaskRelease> publicTaskByOffId = offTaskReleaseMapper.publicTaskByOffId(offId);
		return publicTaskByOffId;
	}

	@Override
	public PageInfo<OffTaskDetails> getAllOldTaskDetails(int pn,Integer year, Integer month,boolean isSend,boolean isNowMonth) {
		//PageInfo<OffTaskDetails>类中的PageHelper有个startPage方法，俩参数分别为(页码/每页多少条)
		PageHelper.startPage(pn, 10);
		if(isNowMonth)
		{
			Date date = new Date();
			month = date.getMonth()+1;//月份从0开始
			year = date.getYear()+1900;//默认从1900年开始计年
		}
		List<OffTaskDetails> allOldTaskDetails = offTaskDetailsMapper.getAllTaskDetails(1,month,year,isSend);
		//new一个PageInfo<>的方法、类型为list的类型OffTaskDetails、参数为查询的list
		PageInfo<OffTaskDetails> pageInfo = new PageInfo<OffTaskDetails>(allOldTaskDetails);
		return pageInfo;
	}

	//接收任务
	@Override
	public List<OffTaskRelease> selectAllTaskReception(Integer sysDeptId) {
		return offTaskReleaseMapper.taskReception(sysDeptId);
	}

	@Override
	public int updateReceiveStatus(Integer missionId) {
		OffTaskRelease offTaskRelease = new OffTaskRelease();
		offTaskRelease.setMissionId(missionId);
		offTaskRelease.setReleaseState("2");
		offTaskRelease.setOperateTime(new Date());
		return offTaskReleaseMapper.updateByPrimaryKeySelective(offTaskRelease);
	}

	@Override
	public int updateCompletionStatus(Integer missionId) {
		OffTaskRelease offTaskRelease = new OffTaskRelease();
		offTaskRelease.setMissionId(missionId);
		offTaskRelease.setReleaseState("3");
		offTaskRelease.setOperateTime(new Date());
		return offTaskReleaseMapper.updateByPrimaryKeySelective(offTaskRelease);
	}

	//考勤
	@SuppressWarnings("deprecation")
	@Override
	public int insertSelective() {
		OffEmployeeAttendance offEmployeeAttendance = new OffEmployeeAttendance();
		Date date = new Date();
		
		Subject subject = SecurityUtils.getSubject();
		SysAccount sysAccount = (SysAccount)subject.getPrincipal();
		
		offEmployeeAttendance.setOffStaffId(sysAccount.getSysStaffId());
		
		
		offEmployeeAttendance.setOffYear(date.getYear()+1900);
		offEmployeeAttendance.setOffMon(date.getMonth()+1);
		offEmployeeAttendance.setOffDay(date.getDate());
		offEmployeeAttendance.setBookTime(date);
		
		//判断今天签没签到
		OffEmployeeAttendance selectDayBookMission = offEmployeeAttendanceMapper.selectDayBookMission(2, date.getYear()+1900, date.getMonth()+1, date.getDate());
		
		if (selectDayBookMission == null) {
			offEmployeeAttendanceMapper.insert(offEmployeeAttendance);
		}
		return 0;
		
	}

	@Override
	public List<OffEmployeeAttendance> selectBookMission(Integer month,Integer year) {
		//Calendar：日历
		Calendar instance = Calendar.getInstance();
		if(month == null)
		{
			month = instance.get(Calendar.MONTH);
		}
		if(year == null)
		{
			year = instance.get(Calendar.YEAR);
		}
		List<OffEmployeeAttendance> bookMission = offEmployeeAttendanceMapper.selectBookMission(2, year, month+1);
		return bookMission;
	}

	@Override
	public Boolean selectDayBookMission() {
		Calendar instance = Calendar.getInstance();
		int years = instance.get(Calendar.YEAR);
		int mon = instance.get(Calendar.MONTH);
		int date = instance.get(Calendar.DATE);
		OffEmployeeAttendance selectDayBookMission = offEmployeeAttendanceMapper.selectDayBookMission(2, years, mon+1, date);
		if(selectDayBookMission == null)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	
}
