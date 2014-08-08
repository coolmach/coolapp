package com.cbuddy.beans; 


import java.sql.Timestamp;

import javax.persistence.*;

@Entity
@Table(name = "Pact")

public class Pact {
	private String recordId;
	private int postId;
	private int userId;
	private String activationCode;
	private Timestamp activationDate;
	private String activationStatus;
	private int noOfAttempts;
	private String lastAttemptIP;
	private Timestamp createdOn;
	
	@Id
	@Column(name="RECORD_ID")
	public String getRecordId() {
		return recordId;
	}
	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}
	@Column(name="POST_ID")
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	
	@Column(name="ACTIVATION_CODE")
	public String getActivationCode() {
		return activationCode;
	}
	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}
	
	@Column(name="ACTIVATION_DATE")
	public Timestamp getActivationDate() {
		return activationDate;
	}
	public void setActivationDate(Timestamp activationDate) {
		this.activationDate = activationDate;
	}
	
	@Column(name="ACTIVATION_STATUS")
	public String getActivationStatus() {
		return activationStatus;
	}
	public void setActivationStatus(String activationStatus) {
		this.activationStatus = activationStatus;
	}
	
	@Column(name="NO_OF_ATTEMPTS")
	public int getNoOfAttempts() {
		return noOfAttempts;
	}
	public void setNoOfAttempts(int noOfAttempts) {
		this.noOfAttempts = noOfAttempts;
	}
	
	@Column(name="LAST_ATTEMPT_IP")
	public String getLastAttemptIP() {
		return lastAttemptIP;
	}
	public void setLastAttemptIP(String lastAttemptIP) {
		this.lastAttemptIP = lastAttemptIP;
	}
	
	@Column(name="CREATED_ON")
	public Timestamp getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}
	
	@Column(name="USER_ID")
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}


}
