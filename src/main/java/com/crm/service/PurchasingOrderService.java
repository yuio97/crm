package com.crm.service;

import java.util.List;

import com.crm.bean.PurchasingOrder;
import com.github.pagehelper.PageInfo;

public interface PurchasingOrderService {
	
	PageInfo<PurchasingOrder> getPurchasingOrderList(String state,int pn);
	 
	int insertSelective(PurchasingOrder record);
	
	int updateByPrimaryKeySelective(PurchasingOrder record);
	
	PurchasingOrder selectByPrimaryKey(Integer porderId);
	
	 PageInfo<PurchasingOrder> purchasingOrderList(int id,String state,String start,String end);

}
