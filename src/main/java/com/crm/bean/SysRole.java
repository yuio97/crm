package com.crm.bean;

import java.util.Date;
import java.util.List;
public class SysRole {
    private Integer sysRoleId;

    private String sysRoleName;

    private String sysRoleDel;

    private String sysRoleLast;

    private String sysRoleOper;

    private Date sysRoleTime;
    
    List<SysPermission> sysPerList;

    public Integer getSysRoleId() {
        return sysRoleId;
    }

    public void setSysRoleId(Integer sysRoleId) {
        this.sysRoleId = sysRoleId;
    }

    public String getSysRoleName() {
        return sysRoleName;
    }

    public void setSysRoleName(String sysRoleName) {
        this.sysRoleName = sysRoleName == null ? null : sysRoleName.trim();
    }

    public String getSysRoleDel() {
        return sysRoleDel;
    }

    public void setSysRoleDel(String sysRoleDel) {
        this.sysRoleDel = sysRoleDel == null ? null : sysRoleDel.trim();
    }

    public String getSysRoleLast() {
        return sysRoleLast;
    }

    public void setSysRoleLast(String sysRoleLast) {
        this.sysRoleLast = sysRoleLast == null ? null : sysRoleLast.trim();
    }

    public String getSysRoleOper() {
        return sysRoleOper;
    }

    public void setSysRoleOper(String sysRoleOper) {
        this.sysRoleOper = sysRoleOper == null ? null : sysRoleOper.trim();
    }

    public Date getSysRoleTime() {
        return sysRoleTime;
    }

    public void setSysRoleTime(Date sysRoleTime) {
        this.sysRoleTime = sysRoleTime;
    }

	public List<SysPermission> getSysPerList() {
		return sysPerList;
	}

	public void setSysPerList(List<SysPermission> sysPerList) {
		this.sysPerList = sysPerList;
	}


    
    
}