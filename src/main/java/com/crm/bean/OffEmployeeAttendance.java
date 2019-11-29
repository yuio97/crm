package com.crm.bean;

import java.util.Date;

public class OffEmployeeAttendance {
    private Integer bookId;

    private Integer offStaffId;

    private Integer offYear;

    private Integer offMon;

    private Integer offDay;

    private Date bookTime;

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getOffStaffId() {
        return offStaffId;
    }

    public void setOffStaffId(Integer offStaffId) {
        this.offStaffId = offStaffId;
    }

    public Integer getOffYear() {
        return offYear;
    }

    public void setOffYear(Integer offYear) {
        this.offYear = offYear;
    }

    public Integer getOffMon() {
        return offMon;
    }

    public void setOffMon(Integer offMon) {
        this.offMon = offMon;
    }

    public Integer getOffDay() {
        return offDay;
    }

    public void setOffDay(Integer offDay) {
        this.offDay = offDay;
    }

    public Date getBookTime() {
        return bookTime;
    }

    public void setBookTime(Date bookTime) {
        this.bookTime = bookTime;
    }
}