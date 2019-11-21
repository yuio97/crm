package com.crm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	@RequestMapping("/getAllTaskDetails")
	public String getAllTaskDetl(Map<String, Object > data) {
		List<OffTaskDetails> allTaskDetails = taskService.getAllTaskDetails();
		data.put("allTaskDetails", allTaskDetails);
		return "forward:/NewTarget.jsp";
	}
	
	@RequestMapping("/updateDetTaskStatus")
	public String updateDetTaskStatus(int staskId) {
		taskService.updateDetTaskStatus(staskId);
		return "redirect:/task/getAllTaskDetails";
	}
	
	@RequestMapping("/selectByPrimaryKey")
	public String selectByPrimaryKey(String staskId,String sysStaffId[]) {
		OffTaskDetails selectByPrimaryKey = taskService.selectByPrimaryKey(Integer.valueOf(staskId));
		selectByPrimaryKey.getOffId();
		selectByPrimaryKey.getOffPromulgatorId();
		selectByPrimaryKey.getOffContent();
		OffTaskRelease offTaskRelease = new OffTaskRelease();
		//用来存sysStaffId[]中的多行数据
		for(int i = 0;i < sysStaffId.length;i++) {
			offTaskRelease.setOffId(selectByPrimaryKey.getOffId());
			offTaskRelease.setSysDeptId(selectByPrimaryKey.getOffPromulgatorId());
			offTaskRelease.setOffContent(selectByPrimaryKey.getOffContent());
			offTaskRelease.setOffTime(new Date());
			offTaskRelease.setSysDeptId(Integer.valueOf(sysStaffId[i]));
			offTaskRelease.setOffReceiveStatus("0");
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
			return "redirect:/task/getAllTaskDetails";
		}else {
			return "失败";
		}
	}
	
	//目标列表
	//分页：int一个页码pn，如果不传值默认为1也就是首页，
	@RequestMapping("/getAllOldTaskDetails")
	public String getAllOldTaskDetl(@RequestParam(defaultValue="1")int pn,
			Map<String, Object > Old) {
		//PageInfo<OffTaskDetails>拥有查询方法返回的list
		PageInfo<OffTaskDetails> allOldTaskDetails = taskService.getAllOldTaskDetails(pn);
		Old.put("allOldTaskDetails", allOldTaskDetails);
		return "forward:/OldTarget.jsp";
	}
	
	@RequestMapping("/getMonthToDateTaskDetails")
	public String getMonthToDateTaskDetails(@RequestParam(defaultValue="1")int pn,Map<String, Object > OldTask,Integer year,Integer month) {
		
		PageInfo<OffTaskDetails> pageInfo = taskService.getMonthToDateTaskDetails(pn,year,month);
		OldTask.put("month", month);
		OldTask.put("year", year);
		OldTask.put("allOldTaskDetails", pageInfo);
		return "forward:/OldTarget.jsp";
	}
}
