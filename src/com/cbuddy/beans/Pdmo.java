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
@Table(name = "Pdmo")
@Inheritance(strategy = InheritanceType.JOINED)
public class Pdmo {
	
	private int postId;
	private String subCategory;
	private String accessoryType;
	private String city;
	private String location;
	private String brand;
	private String model;
	private String color;
	private int year;
	private String smartPhone;
	private String touchScreen;
	private double screenSize;
	private double cameraResolution;
	private String operatingSystem;
	private String wiFi;
	private String fontCamera;
	private String fmRadio;
	private String processorSpeed;
	private String memorySize;
	private String dualSim;
	
	private double price;
	
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
	
	@Column(name="MODEL")
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
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
	
	@Column(name="PRICE")
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Transient
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}
	
	@Column(name="BRAND")
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	@Column(name="TOUCH_SCREEN")
	public String getTouchScreen() {
		return touchScreen;
	}
	public void setTouchScreen(String touchScreen) {
		this.touchScreen = touchScreen;
	}
	
	@Column(name="SCREEN_SIZE")
	public double getScreenSize() {
		return screenSize;
	}
	public void setScreenSize(double screenSize) {
		this.screenSize = screenSize;
	}
	
	@Column(name="CAMERA_RESOLUTION")
	public double getCameraResolution() {
		return cameraResolution;
	}
	public void setCameraResolution(double cameraResolution) {
		this.cameraResolution = cameraResolution;
	}
	
	@Column(name="WI_FI")
	public String getWiFi() {
		return wiFi;
	}
	public void setWiFi(String wiFi) {
		this.wiFi = wiFi;
	}
	
	@Column(name="FRONT_CAMERA")
	public String getFontCamera() {
		return fontCamera;
	}
	public void setFontCamera(String fontCamera) {
		this.fontCamera = fontCamera;
	}
	
	@Column(name="FM_RADIO")
	public String getFmRadio() {
		return fmRadio;
	}
	public void setFmRadio(String fmRadio) {
		this.fmRadio = fmRadio;
	}
	
	@Column(name="PROCESSOR_SPEED")
	public String getProcessorSpeed() {
		return processorSpeed;
	}
	public void setProcessorSpeed(String processorSpeed) {
		this.processorSpeed = processorSpeed;
	}
	
	@Column(name="MEMORY_SIZE")
	public String getMemorySize() {
		return memorySize;
	}
	public void setMemorySize(String memorySize) {
		this.memorySize = memorySize;
	}
	
	@Column(name="SMART_PHONE")
	public String getSmartPhone() {
		return smartPhone;
	}
	public void setSmartPhone(String smartPhone) {
		this.smartPhone = smartPhone;
	}
	
	@Column(name="OPERATING_SYSTEM")
	public String getOperatingSystem() {
		return operatingSystem;
	}
	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}
	
	@Column(name="DUAL_SIM")
	public String getDualSim() {
		return dualSim;
	}
	public void setDualSim(String dualSim) {
		this.dualSim = dualSim;
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
