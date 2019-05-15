package com.domain;

import java.util.List;

public class Department {
	private List<Sdepartment> sDepartmentList;
	private List<Disease>   diseaseList;
	  public List<Disease> getDiseaseList() {
		return diseaseList;
	}

	public void setDiseaseList(List<Disease> diseaseList) {
		this.diseaseList = diseaseList;
	}

	public List<Sdepartment> getsDepartmentList() {
		return sDepartmentList;
	}

	public void setsDepartmentList(List<Sdepartment> sDepartmentList) {
		this.sDepartmentList = sDepartmentList;
	}

	private Integer dId;

	    private String dName;
	    
	    public Integer getdId() {
	        return dId;
	    }

	    public void setdId(Integer dId) {
	        this.dId = dId;
	    }

	    public String getdName() {
	        return dName;
	    }

	    public void setdName(String dName) {
	        this.dName = dName == null ? null : dName.trim();
	    }

}
