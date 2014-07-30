package com.model.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cbuddy.beans.Poit;

@Entity
@Table(name = "Poit")


public class CommonPostDetails extends Poit implements Serializable{

	private static final long serialVersionUID = 1L;

	
	private int corpId;
	private String make;
	private String model;
	private String amt;
	private String yearStr;

	@Transient
	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	@Transient
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Transient
	public String getAmt() {
		return amt;
	}

	public void setAmt(String amt) {
		this.amt = amt;
	}

	@Transient
	public String getYearStr() {
		return yearStr;
	}

	public void setYearStr(String yearStr) {
		this.yearStr = yearStr;
	}

	@Column(name="CORP_ID")
	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}
}
