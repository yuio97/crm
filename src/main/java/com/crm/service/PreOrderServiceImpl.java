package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.Customer;
import com.crm.bean.Kcgoods;
import com.crm.bean.Preorder;
import com.crm.bean.PreorderDetails;
import com.crm.dao.PreorderDetailsMapper;
import com.crm.dao.PreorderMapper;


@Service("preOrderService")
public class PreOrderServiceImpl implements PreOrderService{

	@Resource
	private PreorderMapper preorderMapper;
	
	@Resource
	private PreorderDetailsMapper preorderDetailsMapper;
	
	@Override
	public List<Preorder> selectPre() {

		List<Preorder> selectPre = preorderMapper.selectPre();
		return selectPre;
	}

	@Override
	public List<Kcgoods> selectGoodsNum() {
		
		List<Kcgoods> selectGoodsNum = preorderMapper.selectGoodsNum();
		return selectGoodsNum;
	}

	@Override
	public List<Customer> selectCus() {

		List<Customer> selectCus = preorderMapper.selectCus();
		return selectCus;
	}

	@Override
	public void insertPre(Preorder order) {
		
		

		order.setSysAccountId(1);
		int insertPre = preorderMapper.insert(order);
		
		
		List<PreorderDetails> proDetaList = order.getProDetaList();
		for (PreorderDetails preorderDetails : proDetaList) {
			preorderDetails.setPreorderId(order.getPreorderId());
			
			int insertPreDetail = preorderDetailsMapper.insert(preorderDetails);
		}
	}



}
