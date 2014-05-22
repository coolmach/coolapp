package com.cbuddy.beans; 


import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name = "Poit")

public class Poit {

	private int PostId;
	private String Category;
	private String SubCategory;
	private double Price;
	private String Negotiable;
	private String Title;
	private String ContactNo;
	private String ContactPersonName;
	private String Description;
	private String Location;
	private String City;
	private String ImageFileName;
	private String ImageType;
	private String ThumbnailName;
	private String ThumbnailType;
	private String UserFirstName;
	private int CorpId;
	private int Rating;
	private Timestamp CreatedOn;
	private String CreatedBy;
	private Timestamp ModifiedOn;
	private String ModifiedBy;


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name="POST_ID")
	public int getPostId(){
		return this.PostId;
	}
	public void setPostId(int PostId){
		this.PostId = PostId;
	}

	@Column(name="CATEGORY")
	public String getCategory(){
		return this.Category;
	}
	public void setCategory(String Category){
		this.Category = Category;
	}

	@Column(name="SUB_CATEGORY")
	public String getSubCategory(){
		return this.SubCategory;
	}
	public void setSubCategory(String SubCategory){
		this.SubCategory = SubCategory;
	}

	@Column(name="PRICE")
	public double getPrice(){
		return this.Price;
	}
	public void setPrice(double Price){
		this.Price = Price;
	}

	@Column(name="NEGOTIABLE")
	public String getNegotiable(){
		return this.Negotiable;
	}
	public void setNegotiable(String Negotiable){
		this.Negotiable = Negotiable;
	}

	@Column(name="TITLE")
	public String getTitle(){
		return this.Title;
	}
	public void setTitle(String Title){
		this.Title = Title;
	}

	@Column(name="CONTACT_NO")
	public String getContactNo(){
		return this.ContactNo;
	}
	public void setContactNo(String ContactNo){
		this.ContactNo = ContactNo;
	}

	@Column(name="CONTACT_PERSON_NAME")
	public String getContactPersonName(){
		return this.ContactPersonName;
	}
	public void setContactPersonName(String ContactPersonName){
		this.ContactPersonName = ContactPersonName;
	}

	@Column(name="DESCRIPTION")
	public String getDescription(){
		return this.Description;
	}
	public void setDescription(String Description){
		this.Description = Description;
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

	@Column(name="IMAGE_FILE_NAME")
	public String getImageFileName(){
		return this.ImageFileName;
	}
	public void setImageFileName(String ImageFileName){
		this.ImageFileName = ImageFileName;
	}

	@Column(name="IMAGE_TYPE")
	public String getImageType(){
		return this.ImageType;
	}
	public void setImageType(String ImageType){
		this.ImageType = ImageType;
	}

	@Column(name="THUMBNAIL_NAME")
	public String getThumbnailName(){
		return this.ThumbnailName;
	}
	public void setThumbnailName(String ThumbnailName){
		this.ThumbnailName = ThumbnailName;
	}

	@Column(name="THUMBNAIL_TYPE")
	public String getThumbnailType(){
		return this.ThumbnailType;
	}
	public void setThumbnailType(String ThumbnailType){
		this.ThumbnailType = ThumbnailType;
	}

	@Column(name="USER_FIRST_NAME")
	public String getUserFirstName(){
		return this.UserFirstName;
	}
	public void setUserFirstName(String UserFirstName){
		this.UserFirstName = UserFirstName;
	}

	@Column(name="CORP_ID")
	public int getCorpId(){
		return this.CorpId;
	}
	public void setCorpId(int CorpId){
		this.CorpId = CorpId;
	}

	@Column(name="RATING")
	public int getRating(){
		return this.Rating;
	}
	public void setRating(int Rating){
		this.Rating = Rating;
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
