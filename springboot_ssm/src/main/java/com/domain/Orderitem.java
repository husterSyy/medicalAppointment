package com.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Orderitem {
    private Integer oid;

    private Byte state;

    private Float money;

    private Integer uid;

    private String dname;

    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date ordertime;

    private Integer appointedtime;

    private String address;

    private String detail;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Integer getAppointedtime() {
        return appointedtime;
    }

    public void setAppointedtime(Integer appointedtime) {
        this.appointedtime = appointedtime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}