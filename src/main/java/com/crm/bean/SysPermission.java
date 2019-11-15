package com.crm.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SysPermission {
    private Integer sysPermissionId;

    private String sysPermissionName;

    private String sysPermissionType;

    private String sysPermissionUrl;

    private String sysPermissionPercode;

    private Integer sysPerParentid;

    private String sysPerParentids;

    private String sysPermissionRemark;

    private Date sysPermissionTime;
    
    private List<SysPermission> sonPer = new ArrayList<SysPermission>();

    public Integer getSysPermissionId() {
        return sysPermissionId;
    }

    public void setSysPermissionId(Integer sysPermissionId) {
        this.sysPermissionId = sysPermissionId;
    }

    public String getSysPermissionName() {
        return sysPermissionName;
    }

    public void setSysPermissionName(String sysPermissionName) {
        this.sysPermissionName = sysPermissionName == null ? null : sysPermissionName.trim();
    }

    public String getSysPermissionType() {
        return sysPermissionType;
    }

    public void setSysPermissionType(String sysPermissionType) {
        this.sysPermissionType = sysPermissionType == null ? null : sysPermissionType.trim();
    }

    public String getSysPermissionUrl() {
        return sysPermissionUrl;
    }

    public void setSysPermissionUrl(String sysPermissionUrl) {
        this.sysPermissionUrl = sysPermissionUrl == null ? null : sysPermissionUrl.trim();
    }

    public String getSysPermissionPercode() {
        return sysPermissionPercode;
    }

    public void setSysPermissionPercode(String sysPermissionPercode) {
        this.sysPermissionPercode = sysPermissionPercode == null ? null : sysPermissionPercode.trim();
    }

    public Integer getSysPerParentid() {
        return sysPerParentid;
    }

    public void setSysPerParentid(Integer sysPerParentid) {
        this.sysPerParentid = sysPerParentid;
    }

    public String getSysPerParentids() {
        return sysPerParentids;
    }

    public void setSysPerParentids(String sysPerParentids) {
        this.sysPerParentids = sysPerParentids == null ? null : sysPerParentids.trim();
    }

    public String getSysPermissionRemark() {
        return sysPermissionRemark;
    }

    public void setSysPermissionRemark(String sysPermissionRemark) {
        this.sysPermissionRemark = sysPermissionRemark == null ? null : sysPermissionRemark.trim();
    }

    public Date getSysPermissionTime() {
        return sysPermissionTime;
    }

    public void setSysPermissionTime(Date sysPermissionTime) {
        this.sysPermissionTime = sysPermissionTime;
    }

	public List<SysPermission> getSonPer() {
		return sonPer;
	}

	public void setSonPer(List<SysPermission> sonPer) {
		this.sonPer = sonPer;
	}
    
}