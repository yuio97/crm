package com.crm.dao;

import com.crm.bean.Preorder;

public interface PreorderMapper {
    int deleteByPrimaryKey(Integer preorderId);

    int insert(Preorder record);

    int insertSelective(Preorder record);

    Preorder selectByPrimaryKey(Integer preorderId);

    int updateByPrimaryKeySelective(Preorder record);

    int updateByPrimaryKey(Preorder record);
}