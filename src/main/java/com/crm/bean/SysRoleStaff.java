package com.crm.bean;

import java.util.Date;
import java.util.List;

public class SysRoleStaff {
    private Integer srlId;

    private Integer sysStaffId;

    private Integer sysRoleId;

    private Integer operId;

    private Date ltime;
    
    private List<SysRole> sysRoleList;

    public Integer getSrlId() {
        return srlId;
    }

    public void setSrlId(Integer srlId) {
        this.srlId = srlId;
    }

    public Integer getSysStaffId() {
        return sysStaffId;
    }

    public void setSysStaffId(Integer sysStaffId) {
        this.sysStaffId = sysStaffId;
    }

    public Integer getSysRoleId() {
        return sysRoleId;
    }

    public void setSysRoleId(Integer sysRoleId) {
        this.sysRoleId = sysRoleId;
    }

    public Integer getOperId() {
        return operId;
    }

    public void setOperId(Integer operId) {
        this.operId = operId;
    }

    public Date getLtime() {
        return ltime;
    }

    public void setLtime(Date ltime) {
        this.ltime = ltime;
    }

	public List<SysRole> getSysRoleList() {
		return sysRoleList;
	}

	public void setSysRoleList(List<SysRole> sysRoleList) {
		this.sysRoleList = sysRoleList;
	}


    
}