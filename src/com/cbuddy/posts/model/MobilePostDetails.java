package com.cbuddy.posts.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cbuddy.beans.Pdmo;

@Entity
@Table(name = "MOBILE_POSTS")


public class MobilePostDetails extends Pdmo implements Serializable, CommonDetailsForPost{

	private static final long serialVersionUID = 1L;

	//Details common across categories
	private String Title;
	private String Description;
	private String ContactNo;
	private String ContactPersonName;
	private String ImageFileName;
	private String category;
	private String negotiable;
	private String noOfImages;

	private String priceStr;
	private String brandStr;
	private String selectedBrand;
	private String modelStr;
	private String selectedModelStr;
	private String userEnteredModelStr;
//	private String selectedLocationStr;
//	private String userEnteredLocationStr;
//	private String selectedLocationCode;
	private String selectedCityCode;
	private String yearStr;
	
	private int corpId;
	private String amt;
	
	private String postStatus;
	
	private String postedDateStr;

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
	public String getPriceStr() {
		return priceStr;
	}

	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
	}

//	@Transient
//	public String getSelectedLocationStr() {
//		return selectedLocationStr;
//	}
//
//	public void setSelectedLocationStr(String selectedLocationStr) {
//		this.selectedLocationStr = selectedLocationStr;
//	}
//
//	@Transient
//	public String getUserEnteredLocationStr() {
//		return userEnteredLocationStr;
//	}
//
//	public void setUserEnteredLocationStr(String userEnteredLocationStr) {
//		this.userEnteredLocationStr = userEnteredLocationStr;
//	}
//
//	@Transient
//	public String getSelectedLocationCode() {
//		return selectedLocationCode;
//	}
//
//	public void setSelectedLocationCode(String selectedLocationCode) {
//		this.selectedLocationCode = selectedLocationCode;
//	}

	@Column(name="CORP_ID")
	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}

	@Transient
	public String getBrandStr() {
		return brandStr;
	}

	public void setBrandStr(String brandStr) {
		this.brandStr = brandStr;
	}

	@Transient
	public String getModelStr() {
		return modelStr;
	}

	public void setModelStr(String modelStr) {
		this.modelStr = modelStr;
	}

	@Transient
	public String getAmt() {
		return amt;
	}

	public void setAmt(String amt) {
		this.amt = amt;
	}

	@Transient
	public String getSelectedModelStr() {
		return selectedModelStr;
	}

	public void setSelectedModelStr(String selectedModelStr) {
		this.selectedModelStr = selectedModelStr;
	}

	@Transient
	public String getUserEnteredModelStr() {
		return userEnteredModelStr;
	}

	public void setUserEnteredModelStr(String userEnteredModelStr) {
		this.userEnteredModelStr = userEnteredModelStr;
	}

	@Transient
	public String getSelectedCityCode() {
		return selectedCityCode;
	}

	public void setSelectedCityCode(String selectedCityCode) {
		this.selectedCityCode = selectedCityCode;
	}

	@Transient
	public String getSelectedBrand() {
		return selectedBrand;
	}

	public void setSelectedBrand(String selectedBrand) {
		this.selectedBrand = selectedBrand;
	}
	
	@Transient
	public String getYearStr() {
		return yearStr;
	}

	public void setYearStr(String yearStr) {
		this.yearStr = yearStr;
	}
	
	@Column(name="NEGOTIABLE")
	public String getNegotiable() {
		return negotiable;
	}

	public void setNegotiable(String negotiable) {
		this.negotiable = negotiable;
	}
	
	@Transient
	public String getPostedDateStr() {
		return postedDateStr;
	}

	public void setPostedDateStr(String postedDateStr) {
		this.postedDateStr = postedDateStr;
	}
	
	@Column(name="NO_OF_IMAGES")
	public String getNoOfImages() {
		return noOfImages;
	}

	public void setNoOfImages(String noOfImages) {
		this.noOfImages = noOfImages;
	}
}
