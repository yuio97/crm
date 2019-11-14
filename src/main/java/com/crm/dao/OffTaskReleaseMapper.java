package com.crm.dao;

import com.crm.bean.OffTaskRelease;

public interface OffTaskReleaseMapper {
    int deleteByPrimaryKey(Integer missionId);

    int insert(OffTaskRelease record);

    int insertSelective(OffTaskRelease record);

    OffTaskRelease selectByPrimaryKey(Integer missionId);

    int updateByPrimaryKeySelective(OffTaskRelease record);

    int updateByPrimaryKey(OffTaskRelease record);
}