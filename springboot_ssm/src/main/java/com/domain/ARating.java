package com.domain;

import com.mysql.fabric.xmlrpc.base.Data;

public class ARating {
	Integer arId;
	
	public Integer getArId() {
		return arId;
	}
	public void setArId(Integer arId) {
		this.arId = arId;
	}
	Integer uId;
	Integer aId;
	Data aTime;
	String arDetail;
	
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public Integer getaId() {
		return aId;
	}
	public void setaId(Integer aId) {
		this.aId = aId;
	}
	public Data getaTime() {
		return aTime;
	}
	public void setaTime(Data aTime) {
		this.aTime = aTime;
	}
	public String getArDetail() {
		return arDetail;
	}
	public void setArDetail(String arDetail) {
		this.arDetail = arDetail;
	}
	
}
