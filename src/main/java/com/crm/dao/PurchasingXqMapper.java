package com.crm.dao;

import com.crm.bean.PurchasingXq;

public interface PurchasingXqMapper {
    int deleteByPrimaryKey(Integer pxId);

    int insert(PurchasingXq record);

    int insertSelective(PurchasingXq record);

    PurchasingXq selectByPrimaryKey(Integer pxId);

    int updateByPrimaryKeySelective(PurchasingXq record);

    int updateByPrimaryKey(PurchasingXq record);
}