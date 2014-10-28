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
@Table(name = "Pcomp")
@Inheritance(strategy = InheritanceType.JOINED)
public class Pcomp {
	
	private int postId;
	private String subCategory;
	private String city;
	private String location;
	private String make;
	private String model;
	private String year;
	private int processorSize;
	private int hddSize;
	private double price;

	private String accessoryType;
	
	private Timestamp createdOn;
	private String createdBy;
	private Timestamp modifiedOn;
	private String modifiedBy;
	
	private String amt;
	
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
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	@Column(name="YEAR")
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	@Column(name="PRICE")
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Column(name="PROCESSOR_SIZE")
	public int getProcessorSize() {
		return processorSize;
	}
	public void setProcessorSize(int processorSize) {
		this.processorSize = processorSize;
	}
	
	@Column(name="HDD_SIZE")
	public int getHddSize() {
		return hddSize;
	}
	public void setHddSize(int hddSize) {
		this.hddSize = hddSize;
	}

	@Transient
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
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
	
	@Column(name="ACCESSORY_TYPE")
	public String getAccessoryType() {
		return accessoryType;
	}
	public void setAccessoryType(String accessoryType) {
		this.accessoryType = accessoryType;
	}
}
