package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.Customer;
import com.crm.dao.CustomerMapper;

@Service
public class CustomSelectImpl implements CustomSelectService{
	
	@Resource
	CustomerMapper customerMapper;

	@Override
	public List<Customer> selecctCusList() {
		return customerMapper.selectCusList();
	}

}
