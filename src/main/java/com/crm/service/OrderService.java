package com.crm.service;

import java.util.List;

import com.crm.bean.Procurement;

public interface OrderService {

	public List<Procurement> selectData(Integer clientId);
}
