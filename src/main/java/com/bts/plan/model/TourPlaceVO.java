package com.bts.plan.model;

public class TourPlaceVO {
	private int TNo;
	private String TName;
	private String TAddress;
    private String homepage;
	private String TInfo;
    private String latitude;
    private String longitude;
	private int catNo;
	private int TPNo;
	
	public TourPlaceVO() {
		super();
	}

	public TourPlaceVO(int tNo, String tName, String tAddress, String homepage, String tInfo, String latitude,
			String longitude, int catNo, int tPNo) {
		super();
		TNo = tNo;
		TName = tName;
		TAddress = tAddress;
		this.homepage = homepage;
		TInfo = tInfo;
		this.latitude = latitude;
		this.longitude = longitude;
		this.catNo = catNo;
		TPNo = tPNo;
	}

	public int getTNo() {
		return TNo;
	}

	public void setTNo(int tNo) {
		TNo = tNo;
	}

	public String getTName() {
		return TName;
	}

	public void setTName(String tName) {
		TName = tName;
	}

	public String getTAddress() {
		return TAddress;
	}

	public void setTAddress(String tAddress) {
		TAddress = tAddress;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getTInfo() {
		return TInfo;
	}

	public void setTInfo(String tInfo) {
		TInfo = tInfo;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getCatNo() {
		return catNo;
	}

	public void setCatNo(int catNo) {
		this.catNo = catNo;
	}

	public int getTPNo() {
		return TPNo;
	}

	public void setTPNo(int tPNo) {
		TPNo = tPNo;
	}
	
}
