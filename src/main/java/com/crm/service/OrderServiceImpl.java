package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.Procurement;
import com.crm.dao.ProcurementMapper;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Resource
	private ProcurementMapper procurementMapper;

	@Override
	public List<Procurement> selectData(Integer clientId) {
		
		List<Procurement> procurements = procurementMapper.getProcurements(clientId);
		
		return procurements;
	}

	@Override
	public Procurement getProcurementById(Integer id) {

		Procurement procurementById = procurementMapper.getProcurementById(id);
		
		return procurementById;
	}

	@Override
	public void update(Integer cId) {

		procurementMapper.updateByPrimary(cId);
	}

	

}
