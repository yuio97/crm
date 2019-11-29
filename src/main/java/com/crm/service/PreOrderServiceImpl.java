package com.crm.service;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.Customer;
import com.crm.bean.Kcgoods;
import com.crm.bean.Preorder;
import com.crm.bean.PreorderDetails;
import com.crm.bean.Procurement;
import com.crm.bean.ProcurementDetails;
import com.crm.dao.KcgoodsMapper;
import com.crm.dao.PreorderDetailsMapper;
import com.crm.dao.PreorderMapper;
import com.crm.dao.ProcurementDetailsMapper;
import com.crm.dao.ProcurementMapper;


@Service("preOrderService")
public class PreOrderServiceImpl implements PreOrderService{

	@Resource
	private PreorderMapper preorderMapper;
	
	@Resource
	private PreorderDetailsMapper preorderDetailsMapper;
	
	@Resource
	private ProcurementMapper procurementMapper;
	
	@Resource
	private ProcurementDetailsMapper procurementDetailsMapper;
	
	@Resource
	private KcgoodsMapper kcgoodsMapper;
	
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

	@Override
	public List<Preorder> selectPreById(Integer id) {
		
		List<Preorder> selectPreById = preorderMapper.selectPreById(id);
		return selectPreById;
	}

	@Override
	public void updateOrder(Preorder order) {
		
		
		
		int updateByPrimaryKeySelective = preorderMapper.updateByPrimaryKeySelective(order);
		
		List<PreorderDetails> proDetaList = order.getProDetaList();
		
		for (PreorderDetails preorderDetails : proDetaList) {
			preorderDetails.setPreorderId(order.getPreorderId());
			preorderDetailsMapper.update(preorderDetails);
		}
		
		
	}

	@Override
	public void insertpro(Preorder order) {
		
		Procurement procurement = new Procurement();
		procurement.setCustomerId(order.getCustomerId());
		procurement.setProcurementCase(order.getPreorderNote());
		procurement.setPreorderId(order.getPreorderId());
		procurement.setSysAccountId(order.getSysAccountId());
		procurementMapper.insert(procurement);
		
		Integer procurementId = procurement.getProcurementId();
		 List<PreorderDetails> proDetaList = order.getProDetaList();
		 for (PreorderDetails preorderDetails : proDetaList) {
			 ProcurementDetails details = new ProcurementDetails();
				details.setProcurementId(procurementId);
				details.setCustomerId(order.getCustomerId());
				details.setKgoodsId(preorderDetails.getKcgoods().getKcgoodsId());
				details.setSysAccountId(preorderDetails.getKcNumSell());
				procurementDetailsMapper.insert(details);
		}
		 
	}

	@Override
	public void updatekc(Integer kcid, Integer num) {

		kcgoodsMapper.updatekc(kcid, num);
	}

	@Override
	public void del(Integer kcid) {

		preorderMapper.deleteByPrimaryKey(kcid);
	}

}
