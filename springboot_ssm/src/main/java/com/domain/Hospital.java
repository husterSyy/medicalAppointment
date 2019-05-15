package com.domain;

public class Hospital {
    private Integer hId; 
	private Double hDistance;
   private String hName;
    private String hType;
	private String hAddress;
	private String hLocation;   
  	private String hWeb;
    private Integer pId;
    private Integer cId;
    private String hMobile;
    private String hPicture;
    private String hDetail;
    private Integer hRatingNum;
    private Integer hInquisitionNum;   
    private String hCategory;  
    private Integer hRating;  
    private String pName;
    
    public String gethAddress() {
		return hAddress;
	}

	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}

    public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public Integer gethRating() {
		return hRating;
	}

	public void sethRating(Integer hRating) {
		this.hRating = hRating;
	}

	public Double gethDistance() {
  		return hDistance;
  	}

  	public void sethDistance(Double hDistance) {
  		this.hDistance = hDistance;
  	}

    public Integer gethRatingNum() {
		return hRatingNum;
	}

	public void sethRatingNum(Integer hRatingNum) {
		this.hRatingNum = hRatingNum;
	}

	public Integer gethInquisitionNum() {
		return hInquisitionNum;
	}

	public void sethInquisitionNum(Integer hInquisitionNum) {
		this.hInquisitionNum = hInquisitionNum;
	}

	public String gethCategory() {
		return hCategory;
	}

	public void sethCategory(String hCategory) {
		this.hCategory = hCategory;
	}

	
    
    public String gethWeb() {
  		return hWeb;
  	}

  	public void sethWeb(String hWeb) {
  		this.hWeb = hWeb;
  	}


	

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public String gethName() {
        return hName;
    }

    public void sethName(String hName) {
        this.hName = hName == null ? null : hName.trim();
    }

    public String gethType() {
        return hType;
    }

    public void sethType(String hType) {
        this.hType = hType == null ? null : hType.trim();
    }

    public String gethLocation() {
        return hLocation;
    }

    public void sethLocation(String hLocation) {
        this.hLocation = hLocation == null ? null : hLocation.trim();
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String gethMobile() {
        return hMobile;
    }

    public void sethMobile(String hMobile) {
        this.hMobile = hMobile == null ? null : hMobile.trim();
    }

    public String gethPicture() {
        return hPicture;
    }

    public void sethPicture(String hPicture) {
        this.hPicture = hPicture == null ? null : hPicture.trim();
    }

    public String gethDetail() {
        return hDetail;
    }

    public void sethDetail(String hDetail) {
        this.hDetail = hDetail == null ? null : hDetail.trim();
    }

   
}