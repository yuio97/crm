package com.crm.service;

import java.util.List;

import com.crm.bean.AddGood;
public interface AddGoodsService {
	
	int deleteByPrimaryKey(Integer addgId);
	 int insertSelective(AddGood record);

	 int updateByPrimaryKey(AddGood record);
	 
	 AddGood selectByPrimaryKey(Integer addgId);

	 int updateByPrimaryKeySelective(AddGood record);
	List<AddGood> getGoodsList();
	
	

}
