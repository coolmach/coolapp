package com.cbuddy.posts.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cbuddy.beans.Pdau;

@Entity
@Table(name = "AUTOMOBILE_POSTS")


public class AutomobilePostDetails extends Pdau implements Serializable, CommonDetailsForPost{

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
	private String fuelTypeStr;
	private String makeStr;
	private String modelStr;
//	private String selectedLocationStr;
//	private String userEnteredLocationStr;
//	private String selectedLocationCode;

	private int corpId;

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

	@Transient
	public String getFuelTypeStr() {
		return fuelTypeStr;
	}

	public void setFuelTypeStr(String fuelTypeStr) {
		this.fuelTypeStr = fuelTypeStr;
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

	@Transient
	public String getMakeStr() {
		return makeStr;
	}

	public void setMakeStr(String makeStr) {
		this.makeStr = makeStr;
	}

	@Transient
	public String getModelStr() {
		return modelStr;
	}

	public void setModelStr(String modelStr) {
		this.modelStr = modelStr;
	}

	@Column(name="CORP_ID")
	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
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
