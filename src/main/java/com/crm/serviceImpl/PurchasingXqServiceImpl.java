package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.PurchasingXq;

import com.crm.dao.PurchasingXqMapper;
import com.crm.service.PurchasingXqService;


@Service("purchasingXqService")
public class PurchasingXqServiceImpl implements PurchasingXqService{
	
	@Resource
	private PurchasingXqMapper   PurchasingXqMapper; 
	@Override
	public List<PurchasingXq> getPurchasingXqList() {
		List<PurchasingXq> PurchasingXqList = PurchasingXqMapper.getPurchasingXqList();
		return PurchasingXqList;
	}
	@Override
	public PurchasingXq selectByPrimaryKey(Integer porderId) {
		PurchasingXq selectByPrimaryKey = PurchasingXqMapper.selectByPrimaryKey(porderId);
		return selectByPrimaryKey;
	}
	@Override
	public int insertSelective(PurchasingXq record) {
		int insertSelective = PurchasingXqMapper.insertSelective(record);
		return insertSelective;
	}
	@Override
	public int updateByPrimaryKeySelective(PurchasingXq record) {
		int updateByPrimaryKeySelective = PurchasingXqMapper.updateByPrimaryKeySelective(record);
		return updateByPrimaryKeySelective;
	}
	@Override
	public int deleteByPrimaryKey(Integer pxId) {
		return  PurchasingXqMapper.deleteByPrimaryKey(pxId);
		
	}
	
	@Override
	public List<PurchasingXq> getPurchasingXqList1(Integer porderId) {
		return PurchasingXqMapper.getPurchasingXqList1(porderId);
	
	}
	@Override
	public List<PurchasingXq> update(Integer porderId) {
		return PurchasingXqMapper.update(porderId);
		
	}
	

}
