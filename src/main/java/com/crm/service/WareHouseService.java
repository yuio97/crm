package com.crm.service;

import java.util.List;

import com.crm.bean.WareHouse;


public interface WareHouseService {
	
	 public void addWareHouse(WareHouse wareHouse);
	 
	 public void updateWareHouse(WareHouse wareHouse);
	 
	 WareHouse selectById(WareHouse warehouseId);
	 
	 public List<WareHouse> getWareHouseList();

	WareHouse selectById(Integer warehouseId);

}
