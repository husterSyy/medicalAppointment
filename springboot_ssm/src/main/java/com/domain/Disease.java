package com.domain;

import java.util.List;

public class Disease {
	
	private List<Doctor> doctorList;
	public List<Doctor> getDoctorList() {
		return doctorList;
	}
	public void setDoctorList(List<Doctor> doctorList) {
		this.doctorList = doctorList;
	}
	public List<Hospital> getHospitalList() {
		return hospitalList;
	}
	public void setHospitalList(List<Hospital> hospitalList) {
		this.hospitalList = hospitalList;
	}
	private List<Hospital> hospitalList;
	Integer sId;
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public Integer getdId() {
		return dId;
	}
	public void setdId(Integer dId) {
		this.dId = dId;
	}
	public String getsDetail() {
		return sDetail;
	}
	public void setsDetail(String sDetail) {
		this.sDetail = sDetail;
	}
	private String sName;
	private Integer dId;
	private String sDetail;
	private String dName;
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
}
