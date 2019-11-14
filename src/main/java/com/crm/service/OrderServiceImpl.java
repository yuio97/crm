package com.crm.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.ProcurementMapper;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Resource
	private ProcurementMapper procurementMapper;

	@Override
	public void selectData(Integer clientId) {
		
		procurementMapper.getProcurements(clientId);
				
	}

	

}
