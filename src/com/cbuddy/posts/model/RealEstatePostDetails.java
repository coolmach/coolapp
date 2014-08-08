package com.cbuddy.posts.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cbuddy.beans.Pdre;

@Entity
@Table(name = "REAL_ESTATE_POSTS")


public class RealEstatePostDetails extends Pdre implements Serializable, CommonDetailsForPost{

	private static final long serialVersionUID = 1L;

	//Details common across categories
	private String Title;
	private String Description;
	private String ContactNo;
	private String ContactPersonName;
	private String ImageFileName;
	private String category;
	private int corpId;
	//private String subcategory;
	private String priceValueStr;
	private String newOrResaleStr;
	private String facingDirectionStr;
	private String floorNumberStr;
	private String furnishedStr;
	private String selectedLocationStr;
	private String userEnteredLocationStr;
	private String selectedLocationCode;
	private String selectedCityCode;
	private String areaSq;
	
	private double price; //Added to make it adhere to CommonDetailsForPost (as Pdre has only 'priceValue' and not 'price');
	
	private String postStatus;
	
	@Column(name="POST_STATUS")
	public String getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}

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

	@Transient
	public String getFacingDirectionStr() {
		return facingDirectionStr;
	}

	public void setFacingDirectionStr(String facingDirectionStr) {
		this.facingDirectionStr = facingDirectionStr;
	}

	@Transient
	public String getFloorNumberStr() {
		return floorNumberStr;
	}

	public void setFloorNumberStr(String floorNumberStr) {
		this.floorNumberStr = floorNumberStr;
	}
	
	@Transient
	public String getFurnishedStr() {
		return furnishedStr;
	}

	public void setFurnishedStr(String furnishedStr) {
		this.furnishedStr = furnishedStr;
	}

	@Transient
	public String getSelectedLocationStr() {
		return selectedLocationStr;
	}

	public void setSelectedLocationStr(String selectedLocationStr) {
		this.selectedLocationStr = selectedLocationStr;
	}

	@Transient
	public String getUserEnteredLocationStr() {
		return userEnteredLocationStr;
	}

	public void setUserEnteredLocationStr(String userEnteredLocationStr) {
		this.userEnteredLocationStr = userEnteredLocationStr;
	}

	@Transient
	public String getSelectedLocationCode() {
		return selectedLocationCode;
	}

	public void setSelectedLocationCode(String selectedLocationCode) {
		this.selectedLocationCode = selectedLocationCode;
	}

	@Transient
	public String getSelectedCityCode() {
		return selectedCityCode;
	}

	public void setSelectedCityCode(String selectedCityCode) {
		this.selectedCityCode = selectedCityCode;
	}
	
	@Column(name="CORP_ID")
	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}
	
	@Transient
	public double getPrice() {
		return getPriceValue();
	}
	public void setPrice(double price) {
		setPriceValue(price);
	}
}
