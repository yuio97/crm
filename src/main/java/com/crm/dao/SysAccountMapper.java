package com.crm.dao;

import com.crm.bean.SysAccount;

public interface SysAccountMapper {
    int deleteByPrimaryKey(Integer sysAccountId);

    int insert(SysAccount record);

    int insertSelective(SysAccount record);

    SysAccount selectByPrimaryKey(Integer sysAccountId);

    int updateByPrimaryKeySelective(SysAccount record);

    int updateByPrimaryKey(SysAccount record);
    
    SysAccount getAccountByUserName(String name);
}