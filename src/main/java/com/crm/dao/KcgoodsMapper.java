package com.crm.dao;

import com.crm.bean.Kcgoods;

public interface KcgoodsMapper {
    int deleteByPrimaryKey(Integer kcgoodsId);

    int insert(Kcgoods record);

    int insertSelective(Kcgoods record);

    Kcgoods selectByPrimaryKey(Integer kcgoodsId);

    int updateByPrimaryKeySelective(Kcgoods record);

    int updateByPrimaryKey(Kcgoods record);
}