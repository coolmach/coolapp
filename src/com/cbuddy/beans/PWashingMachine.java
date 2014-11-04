package com.cbuddy.beans;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.Session;

import com.cbuddy.util.LocationUtil;


@Entity
@Table(name = "PWASHINGMACHINE")
@Inheritance(strategy = InheritanceType.JOINED)
public class PWashingMachine {
	
	private int postId;
	private String city;
	private String location;
	private String brand;
	private String model;
	private String year;
	private double price;
	private String loadingType;
	private String automaticType;
	private String capacity;
	private String billAvailable;
	private Timestamp createdOn;
	private String createdBy;
	private Timestamp modifiedOn;
	private String modifiedBy;
	private String amt;
	
	private int postIdStr;

	public String generateIndexableString(Session session){
		StringBuffer index = new StringBuffer("");
		
		index.append(" ").append(LocationUtil.getCityName(session, city)); //City
		index.append(" ").append(LocationUtil.getLocationName(session, city, location));
		index.append(" ").append(brand);
		index.append(" ").append(model);
		index.append(" ").append("Washing Machine");
		if(loadingType != null ){
			index.append(" ").append(loadingType + " Loading");
		}
		
		return index.toString();
	}
	
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
	
	@Transient
	public int getPostIdStr() {
		return postIdStr;
	}
	public void setPostIdStr(int postIdStr) {
		this.postIdStr = postIdStr;
	}
	
	@Column(name="LOADING_TYPE")
	public String getLoadingType() {
		return loadingType;
	}
	public void setLoadingType(String loadingType) {
		this.loadingType = loadingType;
	}
	
	@Column(name="AUTOMATIC_TYPE")
	public String getAutomaticType() {
		return automaticType;
	}
	public void setAutomaticType(String automaticType) {
		this.automaticType = automaticType;
	}
	
	@Column(name="CAPACITY")
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

}
