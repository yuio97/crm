package com.crm.dao;

import com.crm.bean.OffDepartment;

public interface OffDepartmentMapper {
    int deleteByPrimaryKey(Integer sysDeptId);

    int insert(OffDepartment record);

    int insertSelective(OffDepartment record);

    OffDepartment selectByPrimaryKey(Integer sysDeptId);

    int updateByPrimaryKeySelective(OffDepartment record);

    int updateByPrimaryKey(OffDepartment record);
}