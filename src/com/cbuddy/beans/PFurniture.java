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
@Table(name = "PFurniture")
@Inheritance(strategy = InheritanceType.JOINED)
public class PFurniture {
	
	private int postId;
	private String subCategory;
	private String city;
	private String location;
	private String type;
	private double price;
	private int year;
	
	private Timestamp createdOn;
	private String createdBy;
	private Timestamp modifiedOn;
	private String modifiedBy;
	private String amt;
	
	private String limit;
	private String offset;
	private String page="1";

	@Id
	@Column(name="POST_ID")
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
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
	
	@Column(name="YEAR")
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	@Column(name="PRICE")
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
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
	
	@Transient
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}

	@Column(name="SUB_CATEGORY")
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	
	@Column(name="TYPE")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
}