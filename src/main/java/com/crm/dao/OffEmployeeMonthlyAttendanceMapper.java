package com.crm.dao;

import com.crm.bean.OffEmployeeMonthlyAttendance;

public interface OffEmployeeMonthlyAttendanceMapper {
    int deleteByPrimaryKey(Integer yueTaskStatustId);

    int insert(OffEmployeeMonthlyAttendance record);

    int insertSelective(OffEmployeeMonthlyAttendance record);

    OffEmployeeMonthlyAttendance selectByPrimaryKey(Integer yueTaskStatustId);

    int updateByPrimaryKeySelective(OffEmployeeMonthlyAttendance record);

    int updateByPrimaryKey(OffEmployeeMonthlyAttendance record);
}