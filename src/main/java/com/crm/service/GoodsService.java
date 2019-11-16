package com.crm.service;

import java.util.List;

import com.crm.bean.Goods;

public interface GoodsService {
	

	int insertSelective(Goods goods);

	int updateByPrimaryKey(Goods goods);
	
	List<Goods> getGoodsList();
	

}
