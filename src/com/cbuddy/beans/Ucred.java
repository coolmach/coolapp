package com.cbuddy.beans;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Ucred")
public class Ucred {
	private String userId;
	private String corpEmailId;
	private String pwd;
	private String mobileNo;
	private int noOfAtmpts;
	private Date lastLoginTime;
	private Date pwdExpiryDate;
	private Date createdOn;
	private String createdBy;
	private Date modifiedOn;
	private String modifiedBy;
	
	@Id
	@GeneratedValue
	@Column(name="USER_ID")
	public String getUserId() {
		return userId;
	}
	
	@Column(name="CORP_EMAIL_ID")
	public String getCorpEmailId() {
		return corpEmailId;
	}
	
	@Column(name="PWD")
	public String getPwd() {
		return pwd;
	}
	
	@Column(name="MOBILE_NO")
	public String getMobileNo() {
		return mobileNo;
	}
	
	@Column(name="NO_OF_ATMPTS")
	public int getNoOfAtmpts() {
		return noOfAtmpts;
	}
	
	@Column(name="LAST_LOGIN_TIME")
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	
	@Column(name="PWD_EXPIRY_DATE")
	public Date getPwdExpiryDate() {
		return pwdExpiryDate;
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
	
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setCorpEmailId(String corpEmailId) {
		this.corpEmailId = corpEmailId;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public void setNoOfAtmpts(int noOfAtmpts) {
		this.noOfAtmpts = noOfAtmpts;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public void setPwdExpiryDate(Date pwdExpiryDate) {
		this.pwdExpiryDate = pwdExpiryDate;
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
