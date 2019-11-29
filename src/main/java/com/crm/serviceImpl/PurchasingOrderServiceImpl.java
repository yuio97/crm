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
	public List<PurchasingOrder> getPurchasingOrderList(String state) {
		
		List<PurchasingOrder> purchasingOrderList = purchasingOrderMapper.getPurchasingOrderList(state);
		return purchasingOrderList;
	}
	@Override
	public PurchasingOrder selectByPrimaryKey(Integer porderId) {
		PurchasingOrder selectByPrimaryKey = purchasingOrderMapper.selectByPrimaryKey(porderId);
		List<PurchasingXq> purchasingXqList1 = PurchasingXqMapper.getPurchasingXqList1(porderId);
		
		selectByPrimaryKey.setPurchasingXq(purchasingXqList1);
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
		List<PurchasingXq> xq = record.getPurchasingXq();
		for (PurchasingXq purchasingXq : xq) {
			purchasingXq.setPorderId(record.getPorderId());
			PurchasingXqMapper.updateByPrimaryKeySelective(purchasingXq);
		}
		return updateByPrimaryKeySelective;
	}

}
