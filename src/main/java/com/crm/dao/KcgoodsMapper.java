package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.Kcgoods;

public interface KcgoodsMapper {
    int deleteByPrimaryKey(Integer kcgoodsId);

    int insert(Kcgoods record);

    int insertSelective(Kcgoods record);

    Kcgoods selectByPrimaryKey(Integer kcgoodsId);

    int updateByPrimaryKeySelective(Kcgoods record);

    int updateByPrimaryKey(Kcgoods record);
   

	List<Kcgoods> getKcgoodsList();

	int updatekc(@Param("kcid")Integer kcid, @Param("num")Integer num);
	
}