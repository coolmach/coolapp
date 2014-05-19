package com.cbuddy.beans;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Uprof")
public class Uprof {
	private int userId;
	private String corpId;
	private String firstName;
	private String lastName;
	private String gender;
	private String dob;
	private String address;
	private String pincode;
	private String city;
	private String personalEmailId;
	private String mobileNo;
	private String alternateNo;
	private String userCategory;
	private String userStatus;
	private String userRating;
	private String emailVerificationStatus;
	private String mobileVerificationStatus;
	private Date createdOn;
	private String createdBy;
	private Date modifiedOn;
	private String modifiedBy;
	
	@Id
	@GeneratedValue
	@Column(name="USER_ID")
	public int getUserId() {
		return userId;
	}
	
	@Column(name="CORP_ID")
	public String getCorpId() {
		return corpId;
	}
	
	@Column(name="FIRST_NAME")
	public String getFirstName() {
		return firstName;
	}
	
	@Column(name="LAST_NAME")
	public String getLastName() {
		return lastName;
	}
	
	@Column(name="GENDER")
	public String getGender() {
		return gender;
	}
	
	@Column(name="DOB")
	public String getDob() {
		return dob;
	}
	
	@Column(name="ADDRESS")
	public String getAddress() {
		return address;
	}
	
	@Column(name="PINCODE")
	public String getPincode() {
		return pincode;
	}
	
	@Column(name="CITY")
	public String getCity() {
		return city;
	}
	
	@Column(name="PERSONAL_EMAIL_ID")
	public String getPersonalEmailId() {
		return personalEmailId;
	}
	
	@Column(name="MOBILE_NO")
	public String getMobileNo() {
		return mobileNo;
	}
	
	@Column(name="ALTERNATE_NO")
	public String getAlternateNo() {
		return alternateNo;
	}
	
	@Column(name="USER_CATEGORY")
	public String getUserCategory() {
		return userCategory;
	}
	
	@Column(name="USER_STATUS")
	public String getUserStatus() {
		return userStatus;
	}
	
	@Column(name="USER_RATING")
	public String getUserRating() {
		return userRating;
	}
	
	@Column(name="EMAIL_VERIFICATION_STATUS")
	public String getEmailVerificationStatus() {
		return emailVerificationStatus;
	}
	
	@Column(name="MOBILE_VERIFICATION_STATUS")
	public String getMobileVerificationStatus() {
		return mobileVerificationStatus;
	}
	
	@Column(name="CREATED_ON")
	public Date getCreatedOn() {
		return createdOn;
	}
	
	@Column(name="CREATED_BY")
	public String getCreatedBy() {
		return createdBy;
	}
	
	@Column(name="MODIFIED_ON")
	public Date getModifiedOn() {
		return modifiedOn;
	}
	
	@Column(name="MODIFIED_BY")
	public String getModifiedBy() {
		return modifiedBy;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setCorpId(String corpId) {
		this.corpId = corpId;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public void setPersonalEmailId(String personalEmailId) {
		this.personalEmailId = personalEmailId;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public void setAlternateNo(String alternateNo) {
		this.alternateNo = alternateNo;
	}
	public void setUserCategory(String userCategory) {
		this.userCategory = userCategory;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public void setUserRating(String userRating) {
		this.userRating = userRating;
	}
	public void setEmailVerificationStatus(String emailVerificationStatus) {
		this.emailVerificationStatus = emailVerificationStatus;
	}
	public void setMobileVerificationStatus(String mobileVerificationStatus) {
		this.mobileVerificationStatus = mobileVerificationStatus;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	
	
}
