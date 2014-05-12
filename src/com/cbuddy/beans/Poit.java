package com.cbuddy.beans;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "Poit")
public class Poit {
	
	private int postId;    
	private String category;  
	private String subCategory;
	private int price;                      
	private String title;                         
	private String description;                 
	private int contactNo;                      
	private String contactPerson;           
	private String cityCode;                        
	private String locCode;                 
	private String imageFileName;          
	private String imageType;       
	private String thumbnailName;          
	private String thumbnailType;   
	private String firstName;                     
	private String corpName;     
	private String delFlg;                        
	private String rCreId;                    
	private Date rCreTime = new Date();                     
	private String rModId;               
	private Date rModTime;
	private float rating;
	
	@Id
	@GeneratedValue
	@Column(name="POST_ID")
	public int getPostId() {
		return postId;
	}
	
	@Column(name = "CATEGORY")
	public String getCategory() {
		return category;
	}
	
	@Column(name = "SUB_CATEGORY")
	public String getSubCategory() {
		return subCategory;
	}
	
	@Column(name = "PRICE")
	public int getPrice() {
		return price;
	}
	
	@Column(name = "TITLE")
	public String getTitle() {
		return title;
	}
	
	@Column(name = "DESCRIPTION")
	public String getDescription() {
		return description;
	}
	
	@Column(name = "CONTACT_NO")
	public int getContactNo() {
		return contactNo;
	}
	
	@Column(name = "CONTACT_PERSON")
	public String getContactPerson() {
		return contactPerson;
	}
	
	@Column(name = "CITY_CODE")
	public String getCityCode() {
		return cityCode;
	}
	
	@Column(name = "LOC_CODE")
	public String getLocCode() {
		return locCode;
	}
	
	@Column(name = "PRIMARY_IMAGE_FILE_NAME")
	public String getImageFileName() {
		return imageFileName;
	}
	
	@Column(name = "PRIMARY_IMAGE_TYPE")
	public String getImageType() {
		return imageType;
	}
	
	@Column(name = "PRIMARY_THUMBNAIL_NAME")
	public String getThumbnailName() {
		return thumbnailName;
	}
	
	@Column(name = "PRIMARY_THUMBNAIL_TYPE")
	public String getThumbnailType() {
		return thumbnailType;
	}
	
	@Column(name = "USER_F_NAME")
	public String getFirstName() {
		return firstName;
	}
	
	@Column(name = "USER_CORP_SHORT_NAME")
	public String getCorpName() {
		return corpName;
	}
	
	@Column(name = "DEL_FLG")
	public String getDelFlg() {
		return delFlg;
	}
	
	@Column(name = "R_CRE_ID")
	public String getrCreId() {
		return rCreId;
	}
	
	@Column(name = "R_CRE_TIME")
	public Date getrCreTime() {
		return rCreTime;
	}
	
	@Column(name = "R_MOD_ID")
	public String getrModId() {
		return rModId;
	}
	
	@Column(name = "R_MOD_TIME")
	public Date getrModTime() {
		return rModTime;
	}

	@Column(name = "RATING")
	public float getRating() {
		return rating;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setContactNo(int contactNo) {
		this.contactNo = contactNo;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public void setLocCode(String locCode) {
		this.locCode = locCode;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	public void setThumbnailName(String thumbnailName) {
		this.thumbnailName = thumbnailName;
	}

	public void setThumbnailType(String thumbnailType) {
		this.thumbnailType = thumbnailType;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	public void setDelFlg(String delFlg) {
		this.delFlg = delFlg;
	}

	public void setrCreId(String rCreId) {
		this.rCreId = rCreId;
	}

	public void setrCreTime(Date rCreTime) {
		this.rCreTime = rCreTime;
	}

	public void setrModId(String rModId) {
		this.rModId = rModId;
	}

	public void setrModTime(Date rModTime) {
		this.rModTime = rModTime;
	}
	
	public void setRating(float rating) {
		this.rating = rating;
	}
	
}
