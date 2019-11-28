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
	@Override
	public int deleteByPrimaryKey(Integer addgId) {
		return addgoodMapper.deleteByPrimaryKey(addgId);
		
	}
	@Override
	public int insertSelective(AddGood record) {
		
		return addgoodMapper.insertSelective(record);
	}
	@Override
	public int updateByPrimaryKey(AddGood record) {
		// TODO Auto-generated method stub
		return addgoodMapper.updateByPrimaryKey(record);
	}
	@Override
	public AddGood selectByPrimaryKey(Integer addgId) {
		// TODO Auto-generated method stub
		return addgoodMapper.selectByPrimaryKey(addgId);
	}
	@Override
	public int updateByPrimaryKeySelective(AddGood record) {
		// TODO Auto-generated method stub
		return addgoodMapper.updateByPrimaryKeySelective(record);
	}

}
