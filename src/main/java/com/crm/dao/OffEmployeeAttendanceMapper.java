package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.bean.OffEmployeeAttendance;

public interface OffEmployeeAttendanceMapper {
    int deleteByPrimaryKey(Integer bookId);

    int insert(OffEmployeeAttendance record);

    int insertSelective(OffEmployeeAttendance record);

    OffEmployeeAttendance selectByPrimaryKey(Integer bookId);

    int updateByPrimaryKeySelective(OffEmployeeAttendance record);

    int updateByPrimaryKey(OffEmployeeAttendance record);
    
    //根据员工编号查当月所有
    List<OffEmployeeAttendance> selectBookMission(@Param("offStaffId")Integer offStaffId,@Param("year")Integer year,@Param("month")Integer month);
    
    //查当天签没签到
    OffEmployeeAttendance selectDayBookMission(@Param("offStaffId")Integer offStaffId,@Param("year")Integer year,@Param("month")Integer month,@Param("day")Integer day);
}