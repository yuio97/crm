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
	
	
	
//目标管理
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
		return "redirect:/task/getAllTaskDetails";
	}
	
	//查新建目标任务
	@RequestMapping("/selectPublishedTask")
	public String selectPublishedTask(Map<String, Object> data,String staskId) {
		System.out.println(staskId);
		List<OffTaskRelease> list = taskService.selectPublishedTask(Integer.valueOf(staskId));
		data.put("staffList", list);
		System.out.println();
		return "forward:/publishedTask.jsp";
	}
	
	//目标列表
	//分页：int一个页码pn，如果不传值默认为1也就是首页，
	@RequestMapping("/getAllOldTaskDetails")
	public String getAllOldTaskDetl(@RequestParam(defaultValue="1")int pn,Integer year,Integer month,Map<String, Object > Old) {
		//PageInfo<OffTaskDetails>拥有查询方法返回的list
		PageInfo<OffTaskDetails> allOldTaskDetails = taskService.getAllOldTaskDetails(pn,year,month);
		Old.put("allOldTaskDetails", allOldTaskDetails);
		Old.put("month", month);
		Old.put("year", year);
		return "forward:/OldTarget.jsp";
	}
	
	//查目标列表任务
	@RequestMapping("/selectOldPublishedTask")
	public String selectOldPublishedTask(Integer offId,Map<String, Object > oldPub) {
		List<OffTaskRelease> oldPublishedTask = taskService.selectPublishedTask(offId);
		oldPub.put("oldPublishedTask", oldPublishedTask);
		return "forward:/oldPublishedTask.jsp";
	}
	
	
	
//任务管理
	@RequestMapping("/selectAllTask")
	public String selectAllTask(Integer sysDeptId,Map<String, Object > task) {
		List<OffTaskRelease> selectAllTask = taskService.selectAllTask();
		//循环selectAllTask这个list，类型是OffTaskRelease，offTaskRelease是自己取的名字
		for (OffTaskRelease offTaskRelease : selectAllTask) {
			SysStaffInfo staffInfoByStaffId = staffInfoService.getStaffInfoByStaffId(offTaskRelease.getSysDeptId());
			offTaskRelease.setStaffName(staffInfoByStaffId.getSysStaffName());
		}
		task.put("selectAllTask", selectAllTask);
		return "forward:/newTask.jsp";
	}
	
	@RequestMapping("/selectAllOldTask")
	public String selectAllOldTask(@RequestParam(defaultValue="1")int pn,Integer year,Integer month,Map<String, Object > oldTask) {
		PageInfo<OffTaskRelease> allOldTask = taskService.getAllOldTask(pn, year, month);
		oldTask.put("allOldTask", allOldTask);
		oldTask.put("year", year);
		oldTask.put("month", month);
		return "forward:/oldTask.jsp";
	}
	
}
