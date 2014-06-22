package com.cbuddy.beans; 


import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name = "Uprof")

public class Uprof {
	private int UserId;
	private int CorpId;
	private String FirstName;
	private String LastName;
	private String Gender;
	private String Dob;
	private String Address;
	private String Pincode;
	private String Location;
	private String City;
	private String PersonalEmailId;
	private String MobileNo;
	private String AlternateNo;
	private String UserCategory;
	private String UserStatus;
	private String UserRating;
	private String EmailVerificationStatus;
	private String MobileVerificationStatus;
	private Timestamp CreatedOn;
	private String CreatedBy;
	private Timestamp ModifiedOn;
	private String ModifiedBy;

	@Id
	@Column(name="USER_ID")
	public int getUserId(){
		return this.UserId;
	}
	public void setUserId(int UserId){
		this.UserId = UserId;
	}

	@Column(name="CORP_ID")
	public int getCorpId(){
		return this.CorpId;
	}
	public void setCorpId(int CorpId){
		this.CorpId = CorpId;
	}

	@Column(name="FIRST_NAME")
	public String getFirstName(){
		return this.FirstName;
	}
	public void setFirstName(String FirstName){
		this.FirstName = FirstName;
	}

	@Column(name="LAST_NAME")
	public String getLastName(){
		return this.LastName;
	}
	public void setLastName(String LastName){
		this.LastName = LastName;
	}

	@Column(name="GENDER")
	public String getGender(){
		return this.Gender;
	}
	public void setGender(String Gender){
		this.Gender = Gender;
	}

	@Column(name="DOB")
	public String getDob(){
		return this.Dob;
	}
	public void setDob(String Dob){
		this.Dob = Dob;
	}

	@Column(name="ADDRESS")
	public String getAddress(){
		return this.Address;
	}
	public void setAddress(String Address){
		this.Address = Address;
	}

	@Column(name="PINCODE")
	public String getPincode(){
		return this.Pincode;
	}
	public void setPincode(String Pincode){
		this.Pincode = Pincode;
	}

	@Column(name="LOCATION")
	public String getLocation(){
		return this.Location;
	}
	public void setLocation(String Location){
		this.Location = Location;
	}

	@Column(name="CITY")
	public String getCity(){
		return this.City;
	}
	public void setCity(String City){
		this.City = City;
	}

	@Column(name="PERSONAL_EMAIL_ID")
	public String getPersonalEmailId(){
		return this.PersonalEmailId;
	}
	public void setPersonalEmailId(String PersonalEmailId){
		this.PersonalEmailId = PersonalEmailId;
	}

	@Column(name="MOBILE_NO")
	public String getMobileNo(){
		return this.MobileNo;
	}
	public void setMobileNo(String MobileNo){
		this.MobileNo = MobileNo;
	}

	@Column(name="ALTERNATE_NO")
	public String getAlternateNo(){
		return this.AlternateNo;
	}
	public void setAlternateNo(String AlternateNo){
		this.AlternateNo = AlternateNo;
	}

	@Column(name="USER_CATEGORY")
	public String getUserCategory(){
		return this.UserCategory;
	}
	public void setUserCategory(String UserCategory){
		this.UserCategory = UserCategory;
	}

	@Column(name="USER_STATUS")
	public String getUserStatus(){
		return this.UserStatus;
	}
	public void setUserStatus(String UserStatus){
		this.UserStatus = UserStatus;
	}

	@Column(name="USER_RATING")
	public String getUserRating(){
		return this.UserRating;
	}
	public void setUserRating(String UserRating){
		this.UserRating = UserRating;
	}

	@Column(name="EMAIL_VERIFICATION_STATUS")
	public String getEmailVerificationStatus(){
		return this.EmailVerificationStatus;
	}
	public void setEmailVerificationStatus(String EmailVerificationStatus){
		this.EmailVerificationStatus = EmailVerificationStatus;
	}

	@Column(name="MOBILE_VERIFICATION_STATUS")
	public String getMobileVerificationStatus(){
		return this.MobileVerificationStatus;
	}
	public void setMobileVerificationStatus(String MobileVerificationStatus){
		this.MobileVerificationStatus = MobileVerificationStatus;
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
