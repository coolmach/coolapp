package com.cbuddy.beans;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "MOBILE_MASTER")
public class MobileMaster {
	
	private int recordId;
	private String brand;
	private String model;
	private String modelName;
	private String smartPhone;
	private String touchScreen;
	private double screenSize;
	private String operatingSystem;
	private double cameraResolution;
	private String wiFi;
	private String fontCamera;
	private String fmRadio;
	private String processorSpeed;
	private String memorySize;
	
	private Timestamp createdOn;
	private String createdBy;
	private Timestamp modifiedOn;
	private String modifiedBy;


	@Id
	@Column(name="RECORD_ID")
	public int getRecordId() {
		return recordId;
	}

	public void setRecordId(int recordId) {
		this.recordId = recordId;
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

	@Column(name="SMART_PHONE")
	public String getSmartPhone() {
		return smartPhone;
	}

	public void setSmartPhone(String smartPhone) {
		this.smartPhone = smartPhone;
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

	@Column(name="CREATED_ON")
	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	@Column(name="CREATED_BY")
	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	@Column(name="MODIFIED_ON")
	public Timestamp getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Timestamp modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	@Column(name="MODIFIED_BY")
	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	@Column(name="OPERATING_SYSTEM")
	public String getOperatingSystem() {
		return operatingSystem;
	}
	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}

	@Column(name="MODEL_NAME")
	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

}
