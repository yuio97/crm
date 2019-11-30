package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.PurchasingOrder;


public interface PurchasingOrderMapper {
    int deleteByPrimaryKey(Integer porderId);

    int insert(PurchasingOrder record);

    int insertSelective(PurchasingOrder record);

    PurchasingOrder selectByPrimaryKey(Integer porderId);

    int updateByPrimaryKeySelective(PurchasingOrder record);

    int updateByPrimaryKey(PurchasingOrder record);
    
    List<PurchasingOrder> getPurchasingOrderList(@Param("state")String state);
    List<PurchasingOrder> purchasingOrderList(@Param("state")String state,@Param("start")String start,@Param("end")String end);
}