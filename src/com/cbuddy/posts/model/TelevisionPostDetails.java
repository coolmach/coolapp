package com.cbuddy.posts.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cbuddy.beans.PTelevision;

@Entity
@Table(name = "TELEVISION_POSTS")


public class TelevisionPostDetails extends PTelevision implements Serializable{

	private static final long serialVersionUID = 1L;

	//Details common across categories
	private String Title;
	private String Description;
	private String ContactNo;
	private String ContactPersonName;
	private String ImageFileName;
	private String category;
	private String subCategory;
	private String yearStr;
	private String priceStr;
	private String selectedLocationStr;
	private String userEnteredLocationStr;
	private String selectedLocationCode;

	private int corpId;

	@Transient
	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	
	@Transient
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
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

	@Column(name="CORP_ID")
	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}

	@Transient
	public String getYearStr() {
		return yearStr;
	}

	public void setYearStr(String yearStr) {
		this.yearStr = yearStr;
	}
}
