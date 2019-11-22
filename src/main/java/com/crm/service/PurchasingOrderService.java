package com.crm.service;

import java.util.List;

import com.crm.bean.PurchasingOrder;

public interface PurchasingOrderService {
	
	List<PurchasingOrder> getPurchasingOrderList();
	 
	int insertSelective(PurchasingOrder record);
	
	int updateByPrimaryKeySelective(PurchasingOrder record);
	PurchasingOrder selectByPrimaryKey(Integer porderId);

}
