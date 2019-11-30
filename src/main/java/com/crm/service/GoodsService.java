package com.crm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.Goods;

public interface GoodsService {
	

	int insertSelective(Goods goods);

	int updateByPrimaryKey(Goods goods);
	
	int deleteByPrimaryKey(Integer goodsId);
	
	List<Goods> getGoodsList();
	
	Goods selectByPrimaryKey(Integer goodsId);
	
	Goods select(Goods goodsId);
	List<Goods> selectlike(@Param("name")String name);

}
