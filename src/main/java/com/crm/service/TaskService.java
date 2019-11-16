package com.crm.service;

import java.util.List;

import com.crm.bean.OffTaskDetails;

public interface TaskService {
	
	//根据id修改发布状态
	void updateDetTaskStatus(int id);
	
	//查所有
	List<OffTaskDetails> getAllTaskDetails();
	
	//add内容
	int insert(OffTaskDetails record);//add所有，所以是bean类型，名字自取

}
