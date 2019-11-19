package com.crm.service;

import java.util.List;

import com.crm.bean.OffTaskDetails;
import com.crm.bean.OffTaskRelease;

public interface TaskService {
	
	//查所有
	List<OffTaskDetails> getAllTaskDetails();
	
	//add内容
	int insert(OffTaskDetails record);//add所有，所以是bean类型，名字自取
	
	//根据id修改发布状态
//	void updateDetTaskStatus(int id);
	
	//根据id查offId和offContent和offPromulgatorId
	OffTaskDetails selectByPrimaryKey(Integer offId);
	
	//添加OffTaskRelease
	int insert(OffTaskRelease record);

}
