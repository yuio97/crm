package com.crm.service;

import java.util.List;

import com.crm.bean.PurchasingXq;



public interface PurchasingXqService {
	
	 int insertSelective(PurchasingXq record);
	 
	 int updateByPrimaryKeySelective(PurchasingXq record);
	 
	 int deleteByPrimaryKey(Integer pxId);
	 
	 PurchasingXq selectByPrimaryKey(Integer pxId);
	
	 List<PurchasingXq> getPurchasingXqList();
	 
	 List<PurchasingXq> getPurchasingXqList(Integer porderId);
	 
}