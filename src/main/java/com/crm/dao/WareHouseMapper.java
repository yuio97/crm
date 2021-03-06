package com.crm.dao;

import java.util.List;

import com.crm.bean.WareHouse;

public interface WareHouseMapper {
    int deleteByPrimaryKey(Integer warehouseId);

    int insert(WareHouse record);

    int insertSelective(WareHouse record);

    WareHouse selectByPrimaryKey(Integer warehouseId);

    int updateByPrimaryKeySelective(WareHouse record);

    int updateByPrimaryKey(WareHouse record);
    
    List<WareHouse> getWareHouseList();
}