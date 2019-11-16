package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.Goods;
import com.crm.dao.GoodsMapper;

@Service("goods")
public class GoodsServiceImple implements GoodsService{
	
	@Resource
	private GoodsMapper goodsMapper;
	
	@Override
	public int insertSelective(Goods goods) {
		int  insertgoods= goodsMapper.insertSelective(goods);
		return insertgoods;
	}

	@Override
	public int updateByPrimaryKey(Goods goods) {
		return goodsMapper.updateByPrimaryKey(goods);
		 
	}

	@Override
	public List<Goods> getGoodsList() {
		return  goodsMapper.getGoodsList();
		
	}



}
