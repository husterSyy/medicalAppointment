package com.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Chatlog {
    private Integer mid;

    private String message;

    private String sender;

    private String receiver;

    private String file;

    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date time;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}