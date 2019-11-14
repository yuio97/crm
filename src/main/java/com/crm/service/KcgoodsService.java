package com.crm.service;

import java.util.List;

import com.crm.bean.Kcgoods;
import com.github.pagehelper.PageInfo;

public interface KcgoodsService {
	public List<Kcgoods> getKcgoodsList();
	public PageInfo<Kcgoods> getKcgoodsList(int pn ,int size);
}
