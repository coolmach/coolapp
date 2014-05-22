package com.model.user;

import java.io.Serializable;

import com.cbuddy.beans.Pdre;

public class RealEstatePostDetails extends Pdre implements Serializable{

	private static final long serialVersionUID = 1L;

	//Details common across categories
	private String Title;
	private String Description;
	private String ContactNo;
	private String ContactPersonName;
	private String ImageFileName;
	private String category;
	private String subcategory;
	private double priceValue;

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
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getContactNo() {
		return ContactNo;
	}
	public void setContactNo(String contactNo) {
		ContactNo = contactNo;
	}
	public String getContactPersonName() {
		return ContactPersonName;
	}
	public void setContactPersonName(String contactPersonName) {
		ContactPersonName = contactPersonName;
	}
	public String getImageFileName() {
		return ImageFileName;
	}
	public void setImageFileName(String imageFileName) {
		ImageFileName = imageFileName;
	}
	public double getPriceValue() {
		return priceValue;
	}
	public void setPriceValue(double priceValue) {
		this.priceValue = priceValue;
	}
}
