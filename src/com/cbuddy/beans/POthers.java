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
@Table(name = "POTHERS")
@Inheritance(strategy = InheritanceType.JOINED)
public class POthers {
	
	private int postId;
	private String city;
	private String location;
	private String brand;
	private String model;
	private int year;
	private double price;
	private String billAvailable;
	private Timestamp createdOn;
	private String createdBy;
	private Timestamp modifiedOn;
	private String modifiedBy;
	private String amt;

	private String category;
	private String subCategory;
	private String productType;
	
	private int postIdStr;
	
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
	
	@Column(name="BRAND")
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	@Column(name="MODEL")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
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
	
	@Column(name="BILL_AVAILABLE")
	public String getBillAvailable() {
		return billAvailable;
	}
	public void setBillAvailable(String billAvailable) {
		this.billAvailable = billAvailable;
	}
	
	@Transient
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amtStr) {
		this.amt = amtStr;
	}
	
	@Column(name="CATEGORY")
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Column(name="SUB_CATEGORY")
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	
	@Column(name="PRODUCT_TYPE")
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	
	@Transient
	public int getPostIdStr() {
		return postIdStr;
	}
	public void setPostIdStr(int postIdStr) {
		this.postIdStr = postIdStr;
	}

}
