package com.cbuddy.posts.model;

public class MiniPostDetails {
	private String title;
	private String category;
	private String subcategory;
	private String city;
	private String location;
	private String description_generic;
	private String description_specific;
	private String description_full;
	private double price;
	private int noOfImages;
	
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
	
}
