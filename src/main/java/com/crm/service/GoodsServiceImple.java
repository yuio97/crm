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
		return goodsMapper.updateByPrimaryKeySelective(goods);
		 
	}

	

	@Override
	public int deleteByPrimaryKey(Integer goodsId) {
		
		return goodsMapper.deleteByPrimaryKey(goodsId);
	}

	@Override
	public Goods selectByPrimaryKey(Integer goodsId) {
		Goods selectBygoodsId = goodsMapper.selectByPrimaryKey(goodsId);
		
		return selectBygoodsId;
	}

	@Override
	public Goods select(Goods goodsId) {
		 Goods select = goodsMapper.select(goodsId);
		return select;
	}

	@Override
	public List<Goods> selectlike(String name) {
		return goodsMapper.selectlike(name);
		
	}

	@Override
	public List<Goods> getGoodsList() {
		return goodsMapper.getGoodsList();
		
	}



}
