package com.crm.service;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.crm.bean.Kcgoods;
import com.crm.dao.KcgoodsMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("kcgoodsService")
public class KcgoodsServiceImpl implements KcgoodsService{

	@Resource
	private KcgoodsMapper kcgoodsMapper;
	
	@Override
	public List<Kcgoods> getKcgoodsList() {
		List<Kcgoods> kcgoodsList = kcgoodsMapper.getKcgoodsList();
		return kcgoodsList;
	}

	@Override
	public PageInfo<Kcgoods> getKcgoodsList(int pn, int size) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteByPrimaryKey(Integer kcgoodsId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Kcgoods kcgoods) {
		int insertSelective = kcgoodsMapper.insertSelective(kcgoods);
		return insertSelective;
	}

	@Override
	public Kcgoods selectByPrimaryKey(Integer kcgoodsId) {
		Kcgoods selectById = kcgoodsMapper.selectByPrimaryKey(kcgoodsId);
		return selectById;
	}

	@Override
	public int updateByPrimaryKeySelective(Kcgoods kcgoods) {
		return kcgoodsMapper.updateByPrimaryKeySelective(kcgoods);
		 
	}

	


}
