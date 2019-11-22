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
	@Override
	public PurchasingOrder selectByPrimaryKey(Integer porderId) {
		PurchasingOrder selectByPrimaryKey = purchasingOrderMapper.selectByPrimaryKey(porderId);
		return selectByPrimaryKey;
	}
	@Override
	public int insertSelective(PurchasingOrder record) {
		int insertSelective = purchasingOrderMapper.insertSelective(record);
		return insertSelective;
	}
	@Override
	public int updateByPrimaryKeySelective(PurchasingOrder record) {
		int updateByPrimaryKeySelective = purchasingOrderMapper.updateByPrimaryKeySelective(record);
		return updateByPrimaryKeySelective;
	}

}
