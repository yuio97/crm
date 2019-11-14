package com.crm.dao;

import com.crm.bean.OffDepartmentStaff;

public interface OffDepartmentStaffMapper {
    int deleteByPrimaryKey(Integer offStaffId);

    int insert(OffDepartmentStaff record);

    int insertSelective(OffDepartmentStaff record);

    OffDepartmentStaff selectByPrimaryKey(Integer offStaffId);

    int updateByPrimaryKeySelective(OffDepartmentStaff record);

    int updateByPrimaryKey(OffDepartmentStaff record);
}