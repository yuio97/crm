package com.crm.service;

import java.util.List;

import com.crm.bean.Customer;
import com.crm.bean.Kcgoods;
import com.crm.bean.Preorder;
import com.crm.bean.PreorderDetails;

public interface PreOrderService {

	public List<Preorder> selectPre();
	
	public List<Kcgoods> selectGoodsNum();
	
	public List<Customer> selectCus();
	
	public void insertPre( Preorder order);
	
	public List<Preorder> selectPreById(Integer id);
	
	public void updateOrder(Preorder order);
	
	public void insertpro(Preorder order);
	
	public void updatekc(Integer kcid, Integer num);
	
	public void del(Integer kcid);
}
