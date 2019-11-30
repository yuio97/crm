package com.crm.service;

import java.util.List;

import com.crm.bean.Customer;

public interface CustomSelectService {

	public List<Customer> selecctCusList();
	
	public void insertcus(Customer cus);
	
	public void del(Integer id);
	

}
