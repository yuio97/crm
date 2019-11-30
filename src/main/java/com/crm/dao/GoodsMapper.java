package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer goodsId);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer goodsId);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    
    List<Goods> getGoodsList(Goods goods);
    Goods  select(Goods goodsId);
    List<Goods> selectlike(@Param("name")String name);
    
}