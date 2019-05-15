package com.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Rating {
    private Integer rid;

    private String dname;

    private Integer uid;

    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date rtime;

    private String rdetail;

    private Float rskill;

    private Float rservice;

    private Float reffect;

    private String rmore;

    private Integer oid;

    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date rmoretime;

    private String uname;

    private Integer weight;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getDname() {
        return dname;
    }

    public void setdName(String dname) {
        this.dname = dname;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getRtime() {
        return rtime;
    }

    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public String getRdetail() {
        return rdetail;
    }

    public void setRdetail(String rdetail) {
        this.rdetail = rdetail;
    }

    public Float getRskill() {
        return rskill;
    }

    public void setRskill(Float rskill) {
        this.rskill = rskill;
    }

    public Float getRservice() {
        return rservice;
    }

    public void setRservice(Float rservice) {
        this.rservice = rservice;
    }

    public Float getReffect() {
        return reffect;
    }

    public void setReffect(Float reffect) {
        this.reffect = reffect;
    }

    public String getRmore() {
        return rmore;
    }

    public void setRmore(String rmore) {
        this.rmore = rmore;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Date getRmoretime() {
        return rmoretime;
    }

    public void setRmoretime(Date rmoretime) {
        this.rmoretime = rmoretime;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }
}