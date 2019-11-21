package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.OffTaskDetails;

public interface OffTaskDetailsMapper {
    int deleteByPrimaryKey(Integer offId);

    int insert(OffTaskDetails record);

    int insertSelective(OffTaskDetails record);

    OffTaskDetails selectByPrimaryKey(Integer offId);

    int updateByPrimaryKeySelective(OffTaskDetails record);

    int updateByPrimaryKey(OffTaskDetails record);
    
    //查(当月)所有，参数：发布者id、年、月
    List<OffTaskDetails> getAllTaskDetails(@Param("offPromulgatorId")Integer offPromulgatorId,@Param("month")Integer month,@Param("year")Integer year);
    
    //查除了当月的其它数据
    List<OffTaskDetails> getAllOldTaskDetails(@Param("offPromulgatorId")Integer offPromulgatorId);
}