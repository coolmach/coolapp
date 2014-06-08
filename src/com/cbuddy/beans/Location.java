package com.cbuddy.beans; 


import java.sql.Timestamp;

import javax.persistence.*;

@Entity
@Table(name = "Location")

public class Location {
	private String stateCode;
	private String cityCode;
	private String locCode;
	private String locName;
	private Timestamp CreatedOn;
	private String CreatedBy;
	private Timestamp ModifiedOn;
	private String ModifiedBy;
	
	@Column(name="STATE_CODE")
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	
	@Column(name="CITY_CODE")
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	@Id
	@Column(name="LOC_CODE")

	public String getLocCode() {
		return locCode;
	}
	public void setLocCode(String locCode) {
		this.locCode = locCode;
	}
	
	@Column(name="LOC_NAME")
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	
	@Column(name="CREATED_ON")
	public Timestamp getCreatedOn() {
		return CreatedOn;
	}
	public void setCreatedOn(Timestamp createdOn) {
		CreatedOn = createdOn;
	}
	
	@Column(name="CREATED_BY")
	public String getCreatedBy() {
		return CreatedBy;
	}
	public void setCreatedBy(String createdBy) {
		CreatedBy = createdBy;
	}
	
	@Column(name="MODIFIED_ON")
	public Timestamp getModifiedOn() {
		return ModifiedOn;
	}
	public void setModifiedOn(Timestamp modifiedOn) {
		ModifiedOn = modifiedOn;
	}
	
	@Column(name="MODIFIED_BY")
	public String getModifiedBy() {
		return ModifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		ModifiedBy = modifiedBy;
	}
}
