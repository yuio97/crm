package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.Customer;
import com.crm.bean.Kcgoods;
import com.crm.bean.Preorder;
import com.crm.bean.PreorderDetails;

public interface PreorderMapper {
    int deleteByPrimaryKey(Integer preorderId);

    int insert(Preorder record);

    int insertSelective(Preorder record);

    Preorder selectByPrimaryKey(Integer preorderId);

    int updateByPrimaryKeySelective(Preorder record);

    int updateByPrimaryKey(Preorder record);
    
    List<Preorder> selectPre();
    
    List<Kcgoods> selectGoodsNum();
    
    List<Customer> selectCus();
    
    List<Preorder> selectPreById(@Param("preorderId") Integer id);
    
}