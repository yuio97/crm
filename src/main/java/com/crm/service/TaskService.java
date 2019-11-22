package com.crm.service;

import java.util.List;

import com.crm.bean.OffTaskDetails;
import com.crm.bean.OffTaskRelease;
import com.github.pagehelper.PageInfo;

public interface TaskService {
	
	//查所有
	List<OffTaskDetails> getAllTaskDetails();
	
	//add内容
	int insert(OffTaskDetails record);//add所有，所以是bean类型，名字自取
	
	//根据id修改发布状态
	void updateDetTaskStatus(int id);
	
	//根据id查offId和offContent和offPromulgatorId
	OffTaskDetails selectByPrimaryKey(Integer offId);
	
	//添加OffTaskRelease
	int insert(OffTaskRelease record);
	
	//修改内容
	int updateByPrimaryKeySelective(OffTaskDetails record);
	
	//查已发布任务
	public List<OffTaskRelease> selectPublishedTask(Integer offId);
	
	//目标列表
	//参数：页码。PageInfo<OffTaskDetails>与Controller中返回的类型对应
	PageInfo<OffTaskDetails> getAllOldTaskDetails(int pn,Integer year, Integer month);
	
	
}
