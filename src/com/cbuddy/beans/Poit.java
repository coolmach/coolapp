package com.cbuddy.beans; 


import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name = "Poit")

public class Poit {

	private int postId;
	private String category;
	private String subCategory;
	private double price;
	private String negotiable;
	private String title;
	private String contactNo;
	private String contactPersonName;
	private String description;
	private String location;
	private String city;
	private String imageFileName;
	private String imageType;
	private String thumbnailName;
	private String thumbnailType;
	private String userFirstName;
	private String postStatus;
	private int corpId;
	private int rating;
	private Timestamp createdOn;
	private String createdBy;
	private Timestamp modifiedOn;
	private String modifiedBy;
	private String limit;
	private String offset;
	private String page="1";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name="POST_ID")
	public int getPostId(){
		return this.postId;
	}
	public void setPostId(int PostId){
		this.postId = PostId;
	}

	@Column(name="CATEGORY")
	public String getCategory(){
		return this.category;
	}
	public void setCategory(String Category){
		this.category = Category;
	}

	@Column(name="SUB_CATEGORY")
	public String getSubCategory(){
		return this.subCategory;
	}
	public void setSubCategory(String SubCategory){
		this.subCategory = SubCategory;
	}

	@Column(name="PRICE")
	public double getPrice(){
		return this.price;
	}
	public void setPrice(double Price){
		this.price = Price;
	}

	@Column(name="NEGOTIABLE")
	public String getNegotiable(){
		return this.negotiable;
	}
	public void setNegotiable(String Negotiable){
		this.negotiable = Negotiable;
	}

	@Column(name="TITLE")
	public String getTitle(){
		return this.title;
	}
	public void setTitle(String Title){
		this.title = Title;
	}

	@Column(name="CONTACT_NO")
	public String getContactNo(){
		return this.contactNo;
	}
	public void setContactNo(String ContactNo){
		this.contactNo = ContactNo;
	}

	@Column(name="CONTACT_PERSON_NAME")
	public String getContactPersonName(){
		return this.contactPersonName;
	}
	public void setContactPersonName(String ContactPersonName){
		this.contactPersonName = ContactPersonName;
	}

	@Column(name="DESCRIPTION")
	public String getDescription(){
		return this.description;
	}
	public void setDescription(String Description){
		this.description = Description;
	}

	@Column(name="LOCATION")
	public String getLocation(){
		return this.location;
	}
	public void setLocation(String Location){
		this.location = Location;
	}

	@Column(name="CITY")
	public String getCity(){
		return this.city;
	}
	public void setCity(String City){
		this.city = City;
	}

	@Column(name="IMAGE_FILE_NAME")
	public String getImageFileName(){
		return this.imageFileName;
	}
	public void setImageFileName(String ImageFileName){
		this.imageFileName = ImageFileName;
	}

	@Column(name="IMAGE_TYPE")
	public String getImageType(){
		return this.imageType;
	}
	public void setImageType(String ImageType){
		this.imageType = ImageType;
	}

	@Column(name="THUMBNAIL_NAME")
	public String getThumbnailName(){
		return this.thumbnailName;
	}
	public void setThumbnailName(String ThumbnailName){
		this.thumbnailName = ThumbnailName;
	}

	@Column(name="THUMBNAIL_TYPE")
	public String getThumbnailType(){
		return this.thumbnailType;
	}
	public void setThumbnailType(String ThumbnailType){
		this.thumbnailType = ThumbnailType;
	}

	@Column(name="USER_FIRST_NAME")
	public String getUserFirstName(){
		return this.userFirstName;
	}
	public void setUserFirstName(String UserFirstName){
		this.userFirstName = UserFirstName;
	}

	@Column(name="CORP_ID")
	public int getCorpId(){
		return this.corpId;
	}
	public void setCorpId(int CorpId){
		this.corpId = CorpId;
	}

	@Column(name="RATING")
	public int getRating(){
		return this.rating;
	}
	public void setRating(int Rating){
		this.rating = Rating;
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
	
	@Column(name="POST_STATUS")
	public String getPostStatus() {
		return postStatus;
	}
	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}
}
