package com.crm.service;

import java.util.List;

import com.crm.bean.Customer;
import com.crm.bean.Kcgoods;
import com.crm.bean.Preorder;

public interface PreOrderService {

	public List<Preorder> selectPre();
	
	public List<Kcgoods> selectGoodsNum();
	
	public List<Customer> selectCus();
	
	public void insertPre( Preorder order);
}
