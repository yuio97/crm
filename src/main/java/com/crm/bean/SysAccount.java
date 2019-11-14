package com.crm.bean;

import java.util.Date;

public class SysAccount {
    private Integer sysAccountId;

    private String sysAccountName;

    private String sysAccountPass;

    private String sysAccountSalt;

    private Integer sysStaffId;

    private Integer sysCompanyId;

    private String sysAccountSta;

    private Date sysAccountTime;

    public Integer getSysAccountId() {
        return sysAccountId;
    }

    public void setSysAccountId(Integer sysAccountId) {
        this.sysAccountId = sysAccountId;
    }

    public String getSysAccountName() {
        return sysAccountName;
    }

    public void setSysAccountName(String sysAccountName) {
        this.sysAccountName = sysAccountName == null ? null : sysAccountName.trim();
    }

    public String getSysAccountPass() {
        return sysAccountPass;
    }

    public void setSysAccountPass(String sysAccountPass) {
        this.sysAccountPass = sysAccountPass == null ? null : sysAccountPass.trim();
    }

    public String getSysAccountSalt() {
        return sysAccountSalt;
    }

    public void setSysAccountSalt(String sysAccountSalt) {
        this.sysAccountSalt = sysAccountSalt == null ? null : sysAccountSalt.trim();
    }

    public Integer getSysStaffId() {
        return sysStaffId;
    }

    public void setSysStaffId(Integer sysStaffId) {
        this.sysStaffId = sysStaffId;
    }

    public Integer getSysCompanyId() {
        return sysCompanyId;
    }

    public void setSysCompanyId(Integer sysCompanyId) {
        this.sysCompanyId = sysCompanyId;
    }

    public String getSysAccountSta() {
        return sysAccountSta;
    }

    public void setSysAccountSta(String sysAccountSta) {
        this.sysAccountSta = sysAccountSta == null ? null : sysAccountSta.trim();
    }

    public Date getSysAccountTime() {
        return sysAccountTime;
    }

    public void setSysAccountTime(Date sysAccountTime) {
        this.sysAccountTime = sysAccountTime;
    }
}