package com.model.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cbuddy.beans.Pdre;

@Entity
@Table(name = "REAL_ESTATE_POSTS")


public class RealEstatePostDetails extends Pdre implements Serializable{

	private static final long serialVersionUID = 1L;

	//Details common across categories
	private String Title;
	private String Description;
	private String ContactNo;
	private String ContactPersonName;
	private String ImageFileName;
	private String category;
	//private String subcategory;
	private String priceValueStr;
	private String newOrResaleStr;
	private String areaSq;

	@Transient
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
//	@Column(name="SUB_CATEGORY")
//	public String getSubcategory() {
//		return subcategory;
//	}
//	
//	public void setSubcategory(String subcategory) {
//		this.subcategory = subcategory;
//	}
	
	@Column(name="TITLE")
	public String getTitle() {
		return Title;
	}
	
	public void setTitle(String title) {
		Title = title;
	}
	
	@Column(name="DESCRIPTION")
	public String getDescription() {
		return Description;
	}
	
	public void setDescription(String description) {
		Description = description;
	}
	
	@Column(name="CONTACT_NO")
	public String getContactNo() {
		return ContactNo;
	}
	
	public void setContactNo(String contactNo) {
		ContactNo = contactNo;
	}
	
	@Column(name="CONTACT_PERSON_NAME")
	public String getContactPersonName() {
		return ContactPersonName;
	}
	
	public void setContactPersonName(String contactPersonName) {
		ContactPersonName = contactPersonName;
	}
	
	@Column(name="IMAGE_FILE_NAME")
	public String getImageFileName() {
		return ImageFileName;
	}
	
	public void setImageFileName(String imageFileName) {
		ImageFileName = imageFileName;
	}
	
	@Transient
	public String getPriceValueStr() {
		return priceValueStr;
	}
	public void setPriceValueStr(String priceValue) {
		this.priceValueStr = priceValue;
	}
	
	@Transient
	public String getNewOrResaleStr() {
		return newOrResaleStr;
	}
	public void setNewOrResaleStr(String newOrResaleStr) {
		this.newOrResaleStr = newOrResaleStr;
	}
}
