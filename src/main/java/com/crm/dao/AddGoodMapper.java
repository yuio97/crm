package com.crm.dao;

import java.util.List;

import com.crm.bean.AddGood;

public interface AddGoodMapper {
    int deleteByPrimaryKey(Integer addgId);

    int insert(AddGood record);

    int insertSelective(AddGood record);

    AddGood selectByPrimaryKey(Integer addgId);

    int updateByPrimaryKeySelective(AddGood record);

    int updateByPrimaryKey(AddGood record);
    
    List<AddGood> getAddGoodList();
    
}