package com.crm.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.SysAccount;

public interface SysAccountMapper {
    int deleteByPrimaryKey(Integer sysAccountId);

    int insert(SysAccount record);

    int insertSelective(SysAccount record);

    SysAccount selectByPrimaryKey(Integer sysAccountId);

    int updateByPrimaryKeySelective(SysAccount record);

    int updateByPrimaryKey(SysAccount record);
    
    SysAccount getAccountByUserName(String name);
    
    List<SysAccount> getAccountList(); 
    
    List<SysAccount> getListConditions(@Param("name")String name,@Param("start")String start,@Param("end")String end);
}