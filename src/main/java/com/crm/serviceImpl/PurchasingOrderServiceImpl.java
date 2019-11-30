package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.PurchasingOrder;
import com.crm.bean.PurchasingXq;
import com.crm.dao.PurchasingOrderMapper;
import com.crm.dao.PurchasingXqMapper;
import com.crm.service.PurchasingOrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Service("purchasingOrderService")
public class PurchasingOrderServiceImpl implements PurchasingOrderService{
	
	@Resource
	private PurchasingOrderMapper   purchasingOrderMapper; 
	
	@Resource
	private PurchasingXqMapper   PurchasingXqMapper; 
	
	
	
	@Override
	public PageInfo<PurchasingOrder> getPurchasingOrderList(String state,int pn) {
		PageHelper.startPage(pn, 10);
		
		List<PurchasingOrder> purchasingOrderList = purchasingOrderMapper.getPurchasingOrderList(state);
		PageInfo<PurchasingOrder> pageInfo = new PageInfo<PurchasingOrder>(purchasingOrderList);
		return pageInfo;
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
		/*List<PurchasingXq> xq = record.getPurchasingXq();
		for (PurchasingXq purchasingXq : xq) {
			purchasingXq.setPorderId(record.getPorderId());
			PurchasingXqMapper.updateByPrimaryKeySelective(purchasingXq);
		}
		*/
		return updateByPrimaryKeySelective;
	}
	@Override
	public PageInfo<PurchasingOrder> purchasingOrderList(int id, String state, String start, String end) {
		PageHelper.startPage(id, 10);
		List<PurchasingOrder> pList = purchasingOrderMapper.purchasingOrderList(state, start, end);
		PageInfo<PurchasingOrder> pageInfo = new PageInfo(pList);
		return pageInfo;
	}
	
	

}
