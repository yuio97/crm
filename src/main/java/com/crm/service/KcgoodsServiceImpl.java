package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.crm.bean.Kcgoods;
import com.crm.dao.KcgoodsMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("kcgoodsService")
public class KcgoodsServiceImpl implements KcgoodsService{

	@Resource
	private SqlSessionTemplate st;
	
	@Override
	public List<Kcgoods> getKcgoodsList() {
		KcgoodsMapper mapper = st.getMapper(KcgoodsMapper.class);
		List<Kcgoods> kcgoodsList = mapper.getKcgoodsList();
		return kcgoodsList;
	}

	@Override
	public PageInfo<Kcgoods> getKcgoodsList(int pn, int size) {
		KcgoodsMapper mapper = st.getMapper(KcgoodsMapper.class);
		PageHelper.startPage(pn, size);
		List<Kcgoods> kcgoodsList = mapper.getKcgoodsList();
		PageInfo<Kcgoods> pageInfo = new PageInfo<>(kcgoodsList);
		return pageInfo;
	}

}
