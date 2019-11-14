package com.crm.dao;

import com.crm.bean.Rk;

public interface RkMapper {
    int deleteByPrimaryKey(Integer rkId);

    int insert(Rk record);

    int insertSelective(Rk record);

    Rk selectByPrimaryKey(Integer rkId);

    int updateByPrimaryKeySelective(Rk record);

    int updateByPrimaryKey(Rk record);
}