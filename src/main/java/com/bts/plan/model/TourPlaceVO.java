package com.bts.plan.model;

public class TourplaceVO {

	private int placeNo;
	private String placeName;
	private String placetitle;
	private String placeAddress;
	private String placeTel;
	private String homepage;
	private String placeInfo;
	private String latitude;
	private String longitude;
	private int catNo;
	private String imageURL;
	private String imagemain;
	
	public TourplaceVO() {
		super();
	}

	public TourplaceVO(int placeNo, String placeName, String placetitle, String placeAddress, String placeTel,
			String homepage, String placeInfo, String latitude, String longitude, int catNo, String imageURL,
			String imagemain) {
		super();
		this.placeNo = placeNo;
		this.placeName = placeName;
		this.placetitle = placetitle;
		this.placeAddress = placeAddress;
		this.placeTel = placeTel;
		this.homepage = homepage;
		this.placeInfo = placeInfo;
		this.latitude = latitude;
		this.longitude = longitude;
		this.catNo = catNo;
		this.imageURL = imageURL;
		this.imagemain = imagemain;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlacetitle() {
		return placetitle;
	}

	public void setPlacetitle(String placetitle) {
		this.placetitle = placetitle;
	}

	public String getPlaceAddress() {
		return placeAddress;
	}

	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}

	public String getPlaceTel() {
		return placeTel;
	}

	public void setPlaceTel(String placeTel) {
		this.placeTel = placeTel;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getPlaceInfo() {
		return placeInfo;
	}

	public void setPlaceInfo(String placeInfo) {
		this.placeInfo = placeInfo;
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

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getImagemain() {
		return imagemain;
	}

	public void setImagemain(String imagemain) {
		this.imagemain = imagemain;
	}

	@Override
	public String toString() {
		return "TourplaceDTO [placeNo=" + placeNo + ", placeName=" + placeName + ", placetitle=" + placetitle
				+ ", placeAddress=" + placeAddress + ", placeTel=" + placeTel + ", homepage=" + homepage
				+ ", placeInfo=" + placeInfo + ", latitude=" + latitude + ", longitude=" + longitude + ", catNo="
				+ catNo + ", imageURL=" + imageURL + ", imagemain=" + imagemain + "]";
	}

	
	
	
}
