package com.cbuddy.beans;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "Pdau")
@Inheritance(strategy = InheritanceType.JOINED)
public class Pdau {
	
	private int postId;
	private String subCategory;
	private String city;
	private String location;
	private String make;
	private String automobileModel;
	private String color;
	private int year;
	private int noOfOwners;
	private String fuelType;
	private int kms;
	private int mileage;
	private double price;
	private String priceNegotiable;
	private String insuranceAvailable;
	private String regNo;
	private String regCity;
	private String regState;
	
	private Timestamp createdOn;
	private String createdBy;
	private Timestamp modifiedOn;
	private String modifiedBy;
	
	private String areaStr;
	private String amt;
	private String yearOfMake;
	
	private String limit;
	private String offset;
	private String page="1";

	private int postIdStr;
	
	@Id
	@Column(name="POST_ID")
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	
	@Column(name="SUB_CATEGORY")
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	
	@Column(name="LOCATION")
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	@Column(name="CITY")
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name="CREATED_ON")
	public Timestamp getCreatedOn(){
		return this.createdOn ;
	}
	public void setCreatedOn(Timestamp CreatedOn){
		this.createdOn = CreatedOn;
	}

	@Column(name="CREATED_BY")
	public String getCreatedBy(){
		return this.createdBy;
	}
	public void setCreatedBy(String CreatedBy){
		this.createdBy = CreatedBy;
	}

	@Column(name="MODIFIED_ON")
	public Timestamp getModifiedOn(){
		return this.modifiedOn ;
	}
	public void setModifiedOn(Timestamp ModifiedOn){
		this.modifiedOn = ModifiedOn;
	}

	@Column(name="MODIFIED_BY")
	public String getModifiedBy(){
		return this.modifiedBy;
	}
	public void setModifiedBy(String ModifiedBy){
		this.modifiedBy = ModifiedBy;
	}
	
	@Column(name="MAKE")
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	
	@Column(name="MODEL")
	public String getAutomobileModel() {
		return automobileModel;
	}
	public void setAutomobileModel(String model) {
		this.automobileModel = model;
	}
	
	@Column(name="COLOR")
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	@Column(name="YEAR")
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	@Column(name="NO_OF_OWNERS")
	public int getNoOfOwners() {
		return noOfOwners;
	}
	public void setNoOfOwners(int noOfOwners) {
		this.noOfOwners = noOfOwners;
	}
	
	@Column(name="FUEL_TYPE")
	public String getFuelType() {
		return fuelType;
	}
	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}
	
	@Column(name="KMS_DONE")
	public int getKms() {
		return kms;
	}
	public void setKms(int kms) {
		this.kms = kms;
	}
	
	@Column(name="MILEAGE")
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	@Column(name="PRICE")
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Column(name="PRICE_NEGOTIABLE")
	public String getPriceNegotiable() {
		return priceNegotiable;
	}
	public void setPriceNegotiable(String priceNegotiable) {
		this.priceNegotiable = priceNegotiable;
	}
	
	@Column(name="INSURANCE_AVAILABLE")
	public String getInsuranceAvailable() {
		return insuranceAvailable;
	}
	public void setInsuranceAvailable(String insuranceAvailable) {
		this.insuranceAvailable = insuranceAvailable;
	}
	
	@Column(name="REG_NO")
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	
	@Column(name="REG_CITY")
	public String getRegCity() {
		return regCity;
	}
	public void setRegCity(String regCity) {
		this.regCity = regCity;
	}
	
	@Column(name="REG_STATE")
	public String getRegState() {
		return regState;
	}
	public void setRegState(String regState) {
		this.regState = regState;
	}
	
	@Transient
	public String getAreaStr() {
		return areaStr;
	}
	public void setAreaStr(String areaStr) {
		this.areaStr = areaStr;
	}
	
	@Transient
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}
	
	@Transient
	public String getYearOfMake() {
		return yearOfMake;
	}
	public void setYearOfMake(String yearOfMake) {
		this.yearOfMake = yearOfMake;
	}
	
	@Transient
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	
	@Transient
	public String getOffset() {
		return offset;
	}
	public void setOffset(String offset) {
		this.offset = offset;
	}
	
	@Transient
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}

	@Transient
	public int getPostIdStr() {
		return postIdStr;
	}

	public void setPostIdStr(int postIdStr) {
		this.postIdStr = postIdStr;
	}
	
}
