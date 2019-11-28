package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.PurchasingOrder;
import com.crm.bean.PurchasingXq;
import com.crm.dao.PurchasingOrderMapper;
import com.crm.dao.PurchasingXqMapper;
import com.crm.service.PurchasingOrderService;

@Service("purchasingOrderService")
public class PurchasingOrderServiceImpl implements PurchasingOrderService{
	
	@Resource
	private PurchasingOrderMapper   purchasingOrderMapper; 
	
	@Resource
	private PurchasingXqMapper   PurchasingXqMapper; 
	
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
		record.setSysStaffId(1);
		int insertSelective = purchasingOrderMapper.insertSelective(record);
		List<PurchasingXq> purchasingXq = record.getPurchasingXq();
		for (PurchasingXq purchasingXq2 : purchasingXq) {
			purchasingXq2.setPorderId(record.getPorderId());
			int insertxq = PurchasingXqMapper.insertSelective(purchasingXq2);
		}
		return insertSelective;
	}
	@Override
	public int updateByPrimaryKeySelective(PurchasingOrder record) {
		int updateByPrimaryKeySelective = purchasingOrderMapper.updateByPrimaryKeySelective(record);
		return updateByPrimaryKeySelective;
	}

}
