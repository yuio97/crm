package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.PurchasingOrder;

import com.crm.dao.PurchasingOrderMapper;
import com.crm.service.PurchasingOrderService;

@Service("purchasingOrderService")
public class PurchasingOrderServiceImpl implements PurchasingOrderService{
	
	@Resource
	private PurchasingOrderMapper   purchasingOrderMapper; 
	@Override
	public List<PurchasingOrder> getPurchasingOrderList() {
		List<PurchasingOrder> purchasingOrderList = purchasingOrderMapper.getPurchasingOrderList();
		return purchasingOrderList;
	}

}
