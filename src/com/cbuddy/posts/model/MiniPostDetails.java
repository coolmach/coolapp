package com.cbuddy.posts.model;

public class MiniPostDetails {
	private int postId;
	private String title;
	private String category;
	private String subcategory;
	private String city;
	private String cityName;	
	private String location;
	private String locationName;
	private String corpId;
	private String companyName;
	private String description_generic;
	private String description_specific;
	private String description_full;
	private double price;
	private String imageFileName;
	private int noOfImages;
		
	//Attributes used in List Screen
	private String urlForAdDetails;
	private String subcategoryStr;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription_generic() {
		return description_generic;
	}
	public void setDescription_generic(String description_generic) {
		this.description_generic = description_generic;
	}
	public String getDescription_specific() {
		return description_specific;
	}
	public void setDescription_specific(String description_specific) {
		this.description_specific = description_specific;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNoOfImages() {
		return noOfImages;
	}
	public void setNoOfImages(int noOfImages) {
		this.noOfImages = noOfImages;
	}
	public String getDescription_full() {
		return description_full;
	}
	public void setDescription_full(String description_full) {
		this.description_full = description_full;
	}
	public String getUrlForAdDetails() {
		return urlForAdDetails;
	}
	public void setUrlForAdDetails(String urlForAdDetails) {
		this.urlForAdDetails = urlForAdDetails;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getSubcategoryStr() {
		return subcategoryStr;
	}
	public void setSubcategoryStr(String subcategoryStr) {
		this.subcategoryStr = subcategoryStr;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String toString(){
		return "MiniPost: Post Id: " + postId + ", City: " + city + ", Location: " + location + ", Company: " + companyName + "[" + corpId + "]" + ", Desc: " + description_full;
	}
	public String getCorpId() {
		return corpId;
	}
	public void setCorpId(String corpId) {
		this.corpId = corpId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
}
