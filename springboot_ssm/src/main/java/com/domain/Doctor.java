package com.domain;

import java.math.BigDecimal;
import java.util.List;

public class Doctor {
	
	private List<Rating> ratingList;
	
    public List<Rating> getRatingList() {
		return ratingList;
	}

	public void setRatingList(List<Rating> ratingList) {
		this.ratingList = ratingList;
	}

	 
	public BigDecimal getdRating() {
		return dRating;
	}

	public void setdRating(BigDecimal dRating) {
		this.dRating = dRating;
	}

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
		this.dName = dName;
	}

	public String getdSex() {
		return dSex;
	}

	public void setdSex(String dSex) {
		this.dSex = dSex;
	}

	public String getdType() {
		return dType;
	}

	public void setdType(String dType) {
		this.dType = dType;
	}

	public String gethName() {
		return hName;
	}

	public void sethName(String hName) {
		this.hName = hName;
	}

	public String getdInfo() {
		return dInfo;
	}

	public void setdInfo(String dInfo) {
		this.dInfo = dInfo;
	}

	public String getdGoodat() {
		return dGoodat;
	}

	public void setdGoodat(String dGoodat) {
		this.dGoodat = dGoodat;
	}

	public Integer getdPriceImg() {
		return dPriceImg;
	}

	public void setdPriceImg(Integer dPriceImg) {
		this.dPriceImg = dPriceImg;
	}

	public Integer getdPriceVideo() {
		return dPriceVideo;
	}

	public void setdPriceVideo(Integer dPriceVideo) {
		this.dPriceVideo = dPriceVideo;
	}

	public String getdPassword() {
		return dPassword;
	}

	public void setdPassword(String dPassword) {
		this.dPassword = dPassword;
	}

	public String getdPhoto() {
		return dPhoto;
	}

	public void setdPhoto(String dPhoto) {
		this.dPhoto = dPhoto;
	}
	public Integer gethId() {
		return hId;
	}

	public void sethId(Integer hId) {
		this.hId = hId;
	}
	
	
		public Integer getdInquisition() {
		return dInquisition;
	}

	public void setdInquisition(Integer dInquisition) {
		this.dInquisition = dInquisition;
	}

	private Integer dInquisition;	
	private Integer hId;
	private BigDecimal dRating;	
	private Integer dId;
    private String dName;
    private String dSex;
    private String dType;
    private String hName;
    private String dInfo;
    private String dGoodat;
    private Integer dPriceImg; 
    private Integer dPriceVideo;
    private String dPassword; 
    private String dPhoto;
  
}