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

import com.crm.bean.OffTaskDetails;
import com.crm.bean.OffTaskRelease;
import com.crm.bean.SysAccount;
import com.crm.bean.SysStaffInfo;
import com.crm.bean.s;
import com.crm.dao.OffTaskDetailsMapper;
import com.crm.service.StaffInfoService;
import com.crm.service.TaskService;

@Controller
@RequestMapping("/task")
public class TaskDetilController {
	
	
	@Resource
	private TaskService taskService;//service中的id
	
	@Resource
	private StaffInfoService staffInfoService;
	
	@RequestMapping("/getAllTaskDetails")
	public String getAllTaskDetl(Map<String, Object > data) {
		List<OffTaskDetails> allTaskDetails = taskService.getAllTaskDetails();
		data.put("allTaskDetails", allTaskDetails);
		return "forward:/NewTarget.jsp";
	}
	
	/*@RequestMapping("/updateDetTaskStatus")
	public String updateDetTaskStatus(int staskId,Integer sysStaffId[]) {
		//查taskService的offId和offContent和offPromulgatorId + StaffInfoService的被勾选的员工编号 + 最新修改时间，添加到OffTaskRelease表
		List<OffTaskDetails> allTaskDetails = taskService.getAllTaskDetails();
		allTaskDetails.
		
//		taskService.updateDetTaskStatus(staskId);
		return "redirect:/task/getAllTaskDetails";
	}*/
	
	@RequestMapping("/selectByPrimaryKey")
	public String selectByPrimaryKey(String staskId,String sysStaffId[]) {
		OffTaskDetails selectByPrimaryKey = taskService.selectByPrimaryKey(Integer.valueOf(staskId));
		Integer offId = selectByPrimaryKey.getOffId();
		Integer offPromulgatorId = selectByPrimaryKey.getOffPromulgatorId();
		String offContent = selectByPrimaryKey.getOffContent();
		OffTaskRelease offTaskRelease = new OffTaskRelease();
		List<OffTaskRelease> list =new ArrayList<OffTaskRelease>();//用来存sysStaffId[]中的多行数据
//		System.out.println(sysStaffId);
		for(int i = 0;i < sysStaffId.length;i++) {
			offTaskRelease.setOffId(offId);
			offTaskRelease.setSysDeptId(offPromulgatorId);
			offTaskRelease.setOffContent(offContent);
			offTaskRelease.setOffTime(new Date());
			offTaskRelease.setSysDeptId(Integer.valueOf(sysStaffId[i]));
			offTaskRelease.setOffReceiveStatus("0");
			taskService.insert(offTaskRelease);
		}
		
		return "redirect:/task/getAllTaskDetails";
	}
	
	
	
	@RequestMapping("/selectStaff")
	public String selectStaff(Map<String, Object> data) {
		List<SysStaffInfo> staffList = staffInfoService.getStaffList();
		data.put("staffList", staffList);
		return "forward:/UpdateNewTarget.jsp";
	}

	
	@RequestMapping("/addTarget")
	public String addTarget(String detTaskStatus) {//这里写添加的Bean内的字段,有几个传几个(逗号分隔),
		System.out.println(detTaskStatus);
		OffTaskDetails offTaskDetails = new OffTaskDetails();
		offTaskDetails.setOffContent(detTaskStatus);//jsp页面name名也是这个
		int insert = taskService.insert(offTaskDetails);
		if (insert == 1) {
			return "redirect:/task/getAllTaskDetails";
		}else {
			return "失败";
		}
	}
}
