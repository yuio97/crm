package com.crm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.OffEmployeeAttendance;
import com.crm.bean.OffTaskDetails;
import com.crm.bean.OffTaskRelease;
import com.crm.bean.SysAccount;
import com.crm.bean.SysStaffInfo;
import com.crm.bean.s;
import com.crm.dao.OffTaskDetailsMapper;
import com.crm.service.StaffInfoService;
import com.crm.service.TaskService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/task")
public class TaskDetilController {
	
	@Resource
	private TaskService taskService;
	
	@Resource
	private StaffInfoService staffInfoService;
	
	
	@RequestMapping("/updateDetTaskStatus")
	public String updateDetTaskStatus(int staskId) {
		taskService.updateDetTaskStatus(staskId);
		return "redirect:/task/getAllOldTaskDetails";
	}
	
	@RequestMapping("/selectByPrimaryKey")
	public String selectByPrimaryKey(String staskId,String sysStaffId[]) {
		for(int i = 0;i < sysStaffId.length;i++) {
			OffTaskRelease offTaskRelease = new OffTaskRelease();
			offTaskRelease.setOffId(Integer.valueOf(staskId));
			offTaskRelease.setOperateTime(new Date());
			offTaskRelease.setReleaseState("1");
			offTaskRelease.setSysDeptId(Integer.valueOf(sysStaffId[i]));
			taskService.insert(offTaskRelease);
		}
		return "forward:/task/updateDetTaskStatus?staskId="+staskId;
	}
	
	@RequestMapping("/selectStaff")
	public String selectStaff(Map<String, Object> data,String staskId) {
		List<SysStaffInfo> staffList = staffInfoService.getStaffList();
		data.put("staffList", staffList);
		data.put("staskId", staskId);
		return "forward:/UpdateNewTarget.jsp";
	}

	@RequestMapping("/addTarget")
	public String addTarget(String detTaskStatus) {//这里写添加的Bean内的字段,有几个传几个(逗号分隔),
		OffTaskDetails offTaskDetails = new OffTaskDetails();
		offTaskDetails.setOffContent(detTaskStatus);//jsp页面name名也是这个
		int insert = taskService.insert(offTaskDetails);
		if (insert == 1) {
			return "redirect:/task/getAllOldTaskDetails";//add完跳查询Controller
		}else {
			return "失败";
		}
	}
	
	@RequestMapping("/selUpdateContent")
	public String selUpdateContent(Map<String, Object> selUp,String offId) {
		OffTaskDetails selectByPrimaryKey = taskService.selectByPrimaryKey(Integer.valueOf(offId));
		selUp.put("selectByPrimaryKey", selectByPrimaryKey);
		return "forward:/updateContent.jsp";
	}
	
	@RequestMapping("/updateContent")
	public String updateContent(String offId,String content) {
		OffTaskDetails offTaskDetails = new OffTaskDetails();
		offTaskDetails.setOffContent(content);
		offTaskDetails.setOffId(Integer.valueOf(offId));
		taskService.updateByPrimaryKeySelective(offTaskDetails);
		return "redirect:/task/getAllOldTaskDetails";
	}
	
	//任务列表
	//分页：int一个页码pn，如果不传值默认为1也就是首页，
	@RequestMapping("/getAllOldTaskDetails")
	public String getAllOldTaskDetl(
			@RequestParam(defaultValue="1")int pn,
			Integer year,Integer month,
			@RequestParam(defaultValue="false")boolean isSend,
			@RequestParam(defaultValue="false")boolean isNowMonth,
			Map<String, Object > Old) {
		//PageInfo<OffTaskDetails>拥有查询方法返回的list
		PageInfo<OffTaskDetails> allOldTaskDetails = taskService.getAllOldTaskDetails(pn,year,month,isSend,isNowMonth);
		Old.put("allOldTaskDetails", allOldTaskDetails);
		Old.put("month", month);
		Old.put("year", year);
		Old.put("isSend", isSend);
		Old.put("isNowMonth", isNowMonth);
		return "forward:/OldTarget.jsp";
	}
	
	//查任务详情
	@RequestMapping("/selectOldPublishedTask")
	public String selectOldPublishedTask(Integer offId,Map<String, Object > oldPub) {
		List<OffTaskRelease> oldPublishedTask = taskService.selectPublishedTask(offId);
		oldPub.put("oldPublishedTask", oldPublishedTask);
		return "forward:/oldPublishedTask.jsp";
	}
	
	//任务接收
	@RequestMapping("/selectTaskReception")
	public String selectTaskReception(Map<String, Object > oldPub) {
		Subject subject = SecurityUtils.getSubject();
		SysAccount user = (SysAccount) subject.getPrincipal();
		List<OffTaskRelease> taskReception = taskService.selectAllTaskReception(user.getSysStaffId());
		oldPub.put("taskReception", taskReception);
		return "forward:/taskReception.jsp";
	}
	
	//修改任务接收状态
	@RequestMapping("/updateReceiveStatus")
	public String updateReceiveStatus(Integer missionId) {
		taskService.updateReceiveStatus(missionId);
		return "redirect:/task/selectTaskReception";
	}
	
	//修改任务完成状态
	@RequestMapping("/updateCompletionStatus")
	public String updateCompletionStatus(Integer missionId) {
		taskService.updateCompletionStatus(missionId);
		return "redirect:/task/selectTaskReception";
	}
	
	
	//考勤
	@RequestMapping("/addBookMission")
	public String addBookMission() {
		taskService.insertSelective();
		return "redirect:selectDayBookMission";
	}
	
	//异步请求，要加@ResponseBody转为json格式字符串，为HashMap类型数据，不需要Map
	@RequestMapping("/selectBookMission")
	@ResponseBody
	public HashMap<Object, Object> selectBookMission(Integer year, Integer month) {
		
		List<OffEmployeeAttendance> selectBookMission = taskService.selectBookMission(month, year);
		int size = selectBookMission.size();
		int date[] = new int[size];
		for (int i = 0; i < size; i++) {
			OffEmployeeAttendance offEmployeeAttendance = selectBookMission.get(i);
			date[i] = offEmployeeAttendance.getOffDay();
		}
		
		HashMap<Object, Object> hashMap = new HashMap<>();
		hashMap.put("date", date);
		return hashMap;
	}
	
	@RequestMapping("/selectDayBookMission")
	public String selectDayBookMission(Map<String, Object> data) {
		Boolean selectDayBookMission = taskService.selectDayBookMission();
		data.put("isCheck", selectDayBookMission);
		return "forward:/book.jsp";
	}
	
	
	
}
