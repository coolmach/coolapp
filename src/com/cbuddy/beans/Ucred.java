package com.cbuddy.beans; 


import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name = "Ucred")

public class Ucred {




	private int UserId;
	private String CorpEmailId;
	private String Pwd;
	private String MobileNo;
	private int NoOfAtmpts;
	private Timestamp LastLoginTime;
	private Timestamp PwdExpiryDate;
	private Timestamp CreatedOn;
	private String CreatedBy;
	private Timestamp ModifiedOn;
	private String ModifiedBy;


	@Id
	@GeneratedValue	
	@Column(name="USER_ID")
	public int getUserId(){
		return this.UserId;
	}
	public void setUserId(int UserId){
		this.UserId = UserId;
	}

	@Column(name="CORP_EMAIL_ID")
	public String getCorpEmailId(){
		return this.CorpEmailId;
	}
	public void setCorpEmailId(String CorpEmailId){
		this.CorpEmailId = CorpEmailId;
	}

	@Column(name="PWD")
	public String getPwd(){
		return this.Pwd;
	}
	public void setPwd(String Pwd){
		this.Pwd = Pwd;
	}

	@Column(name="MOBILE_NO")
	public String getMobileNo(){
		return this.MobileNo;
	}
	public void setMobileNo(String MobileNo){
		this.MobileNo = MobileNo;
	}

	@Column(name="NO_OF_ATMPTS")
	public int getNoOfAtmpts(){
		return this.NoOfAtmpts;
	}
	public void setNoOfAtmpts(int NoOfAtmpts){
		this.NoOfAtmpts = NoOfAtmpts;
	}

	@Column(name="LAST_LOGIN_TIME")
	public Timestamp getLastLoginTime(){
		return this.LastLoginTime ;
	}
	public void setLastLoginTime(Timestamp LastLoginTime){
		this.LastLoginTime = LastLoginTime;
	}

	@Column(name="PWD_EXPIRY_DATE")
	public Timestamp getPwdExpiryDate(){
		return this.PwdExpiryDate ;
	}
	public void setPwdExpiryDate(Timestamp PwdExpiryDate){
		this.PwdExpiryDate = PwdExpiryDate;
	}

	@Column(name="CREATED_ON")
	public Timestamp getCreatedOn(){
		return this.CreatedOn ;
	}
	public void setCreatedOn(Timestamp CreatedOn){
		this.CreatedOn = CreatedOn;
	}

	@Column(name="CREATED_BY")
	public String getCreatedBy(){
		return this.CreatedBy;
	}
	public void setCreatedBy(String CreatedBy){
		this.CreatedBy = CreatedBy;
	}

	@Column(name="MODIFIED_ON")
	public Timestamp getModifiedOn(){
		return this.ModifiedOn ;
	}
	public void setModifiedOn(Timestamp ModifiedOn){
		this.ModifiedOn = ModifiedOn;
	}

	@Column(name="MODIFIED_BY")
	public String getModifiedBy(){
		return this.ModifiedBy;
	}
	public void setModifiedBy(String ModifiedBy){
		this.ModifiedBy = ModifiedBy;
	}


}
