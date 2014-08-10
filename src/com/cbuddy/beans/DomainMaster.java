package com.cbuddy.beans; 


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "DOMAIN_MASTER")

public class DomainMaster {

	private int recordId;
	private int corpId;
	private String domainId;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name="RECORD_ID")
	public int getRecordId(){
		return this.recordId;
	}
	public void setRecordId(int recordId){
		this.recordId = recordId;
	}
	
	@Column(name="CORP_ID")
	public int getCorpId() {
		return corpId;
	}
	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}
	
	@Column(name="DOMAIN_ID")
	public String getDomainId() {
		return domainId;
	}
	public void setDomainId(String domainId) {
		this.domainId = domainId;
	}

}
