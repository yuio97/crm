package com.crm.dao;

import com.crm.bean.OffEmployeeAttendance;

public interface OffEmployeeAttendanceMapper {
    int deleteByPrimaryKey(Integer offStaffId);

    int insert(OffEmployeeAttendance record);

    int insertSelective(OffEmployeeAttendance record);

    OffEmployeeAttendance selectByPrimaryKey(Integer offStaffId);

    int updateByPrimaryKeySelective(OffEmployeeAttendance record);

    int updateByPrimaryKey(OffEmployeeAttendance record);
}