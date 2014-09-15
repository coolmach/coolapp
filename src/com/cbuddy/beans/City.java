package com.cbuddy.beans; 


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "City")

public class City {
	private String stateCode;
	private String cityCode;
	private String cityName;
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
	
	@Id
	@Column(name="CITY_CODE")
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	@Column(name="CITY_NAME")
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
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
