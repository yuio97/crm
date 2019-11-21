package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.AddGood;
import com.crm.dao.AddGoodMapper;
import com.crm.service.AddGoodsService;
@Service("addGood")
public class AddGoodsServiceImpl implements AddGoodsService{
	@Resource
	private AddGoodMapper addgoodMapper;
	@Override
	public List<AddGood> getGoodsList() {
		List<AddGood> addGoodList = addgoodMapper.getAddGoodList();
		return addGoodList;
	}

}
