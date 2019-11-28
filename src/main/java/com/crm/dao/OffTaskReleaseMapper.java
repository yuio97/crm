package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.OffTaskRelease;

public interface OffTaskReleaseMapper {
    int deleteByPrimaryKey(Integer missionId);

    int insert(OffTaskRelease record);

    int insertSelective(OffTaskRelease record);

    OffTaskRelease selectByPrimaryKey(Integer missionId);

    int updateByPrimaryKeySelective(OffTaskRelease record);

    int updateByPrimaryKey(OffTaskRelease record);
    
    //查任务发布详情
    List<OffTaskRelease> publicTaskByOffId(Integer offId);
    
    //任务接收
    List<OffTaskRelease> taskReception(Integer sysDeptId);
}