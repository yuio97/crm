package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.crm.bean.WareHouse;
import com.crm.dao.WareHouseMapper;
import com.crm.service.WareHouseService;



@Service("wareHouseService")
public class WareHouseServiceImpl implements WareHouseService{
	
	@Resource
	private WareHouseMapper  wareHouseMapper; 
	@Override
	public void addWareHouse(WareHouse wareHouse) {
		wareHouseMapper.insertSelective(wareHouse);
		
	}

	@Override
	public void updateWareHouse(WareHouse wareHouse) {
		wareHouseMapper.updateByPrimaryKeySelective(wareHouse);
	}

	
	@Override
	public List<WareHouse> getWareHouseList() {
		List<WareHouse> wareHouseList = wareHouseMapper.getWareHouseList();
		return wareHouseList;
	}

	@Override
	public WareHouse selectById(Integer warehouseId) {
		WareHouse wareHouseselectByid = wareHouseMapper.selectByPrimaryKey(warehouseId);
		return wareHouseselectByid;
	}

	@Override
	public WareHouse selectById(WareHouse warehouseId) {
		// TODO Auto-generated method stub
		return null;
	}

	

	

	
}
