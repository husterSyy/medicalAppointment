package com.domain;

import java.sql.Date;
import java.util.List;

public class Artical {
	List<ARating> aRatingList;
		public List<ARating> getaRatingList() {
		return aRatingList;
	}
	public void setaRatingList(List<ARating> aRatingList) {
		this.aRatingList = aRatingList;
	}
		Integer aId;
		Integer dId;
		String aType;
		String aTitle;
		String aContent;
		private Date aTime;
		Integer aScan;
		
	 public Integer getaScan() {
			return aScan;
		}
		public void setaScan(Integer aScan) {
			this.aScan = aScan;
		}
	public Date getaTime() {
			return aTime;
		}
		public void setaTime(Date aTime) {
			this.aTime = aTime;
		}
	
		public Integer getaId() {
			return aId;
		}
		public void setaId(Integer aId) {
			this.aId = aId;
		}
		public Integer getdId() {
			return dId;
		}
		public void setdId(Integer dId) {
			this.dId = dId;
		}
		public  String getaType() {
			return aType;
		}
		public void setaType(String aType) {
			this.aType = aType;
		}
		public String getaTitle() {
			return aTitle;
		}
		public void setaTitle(String aTitle) {
			this.aTitle = aTitle;
		}
		public String getaContent() {
			return aContent;
		}
		public void setaContent(String aContent) {
			this.aContent = aContent;
		}
		
}
