package com.cbuddy.beans; 


import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.Session;

import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LocationUtil;

@Entity
@Table(name = "Pdre")
@Inheritance(strategy = InheritanceType.JOINED)
public class Pdre implements Serializable{
	private static final long serialVersionUID = 1L;
	private int postIdStr;
	private int postId;
	private String subCategory;
	private String rentOrSale;
	private String newOrResale;
	private String readyToOccupy;
	private String expectedCompletionDate;
	private int area;
	private String areaStr;
	private String location;
	private String city;
	private double priceValue;
	private String PpriceUnit;
	private String facingDirection;
	private String maritalPreference;
	private String foodPreference;
	private String regionalPreference;
	private String bedrooms;
	private int bathrooms;
	private int ageValue;
	private String ageUnit;
	private String furnished;
	private String floorNumber;
	private double deposit;
	private String depositStr;
	private double maintenance;
	private String maintenanceStr;
	private String approvalAuthority;
	private String builderName;
	private String sharing;
	private String gender;
	private int noOfRoommates;
	private String carParking;
	private String food;
	private String wifi;
	private String tv;
	private String gym;
	private String childrenPlayArea;
	private String swimmingPool;
	private String clubHouse;
	private Timestamp createdOn;
	private String createdBy;
	private Timestamp modifiedOn;
	private String modifiedBy;
	//private String imageFileName;
	private String bhk;
	private String rent;
	private String amt;
	private String share;
	private String powerBackup;
	private String limit;
	private String offset;
	private String page="1";

//	@Column(name="IMAGE_FILENAME")
//	public String getImageFileName() {
//		return imageFileName;
//	}
//	public void setImageFileName(String imageFileName) {
//		this.imageFileName = imageFileName;
//	}
	private void generateStringForFacilities(StringBuffer buffer){
		if(gym != null && gym.equals("Y")){
			buffer.append(" ").append("Gym");
		}
		if(clubHouse != null && clubHouse.equals("Y")){
			buffer.append(" ").append("Club House");
		}
		if(swimmingPool != null && swimmingPool.equals("Y")){
			buffer.append(" ").append("Swimming Pool");
		}
		if(carParking != null && carParking.equals("Y")){
			buffer.append(" ").append("Car Parking");
		}
		if(wifi != null && wifi.equals("Y")){
			buffer.append(" ").append("Wifi");
			buffer.append(" ").append("Wi-fi");
			buffer.append(" ").append("Wi fi");
		}
		if(childrenPlayArea != null && childrenPlayArea.equals("Y")){
			buffer.append(" ").append("Children Play Area");
			buffer.append(" ").append("Children Playarea");
		}
		if(powerBackup != null && powerBackup.equals("Y")){
			buffer.append(" ").append("Power Backup");
			buffer.append(" ").append("UPS");
			buffer.append(" ").append("24 hour power supply");
		}
		if(tv != null && tv.equals("Y")){
			buffer.append(" ").append("Television");
			buffer.append(" ").append("TV");
			buffer.append(" ").append("DTH");
		}
		if(food != null && food.equals("Y")){
			buffer.append(" ").append("Food");
		}
	}
	public String generateIndexableString(Session session){
		StringBuffer index = new StringBuffer("");
		
		if(subCategory == CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE){
			index.append(" ").append("Apartment for sale");
			index.append(" ").append("Apartments for sale");
			index.append(" ").append(bedrooms + " BHK");
			index.append(" ").append(approvalAuthority + " Approval");
			index.append(" ").append(facingDirection + " Facing");
		}else if(subCategory == CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT){
			index.append(" ").append("Apartment for rent");
			index.append(" ").append("Apartments for sale");
			index.append(" ").append(bedrooms + " BHK");
			index.append(" ").append(approvalAuthority + " Approval");
			index.append(" ").append(facingDirection + " Facing");
		}else if(subCategory == CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_SALE){
			index.append(" ").append("Independent house for sale");
			index.append(" ").append(bedrooms + " BHK");
			index.append(" ").append(approvalAuthority + " Approval");
			index.append(" ").append(facingDirection + " Facing");
		}else if(subCategory == CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_RENT){
			index.append(" ").append("Independent house for rent");
			index.append(" ").append(bedrooms + " BHK");
			index.append(" ").append(approvalAuthority + " Approval");
			index.append(" ").append(facingDirection + " Facing");
		}else if(subCategory == CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED){
			index.append(" ").append("Roommate");
			index.append(" ").append("Room mate");
			index.append(" ").append("Room-mate");
			index.append(" ").append(regionalPreference);
		}else if(subCategory == CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION){
			index.append(" ").append("PG Accomodation");
			index.append(" ").append("Paying Guest");
			if(gender != null){
				if(gender.equals("M")){
					index.append(" ").append("Gents");
				}else{
					index.append(" ").append("Ladies");
					index.append(" ").append("Girls");
				}
			}
		}
		index.append(" ").append(LocationUtil.getCityName(session, city)); //City
		index.append(" ").append(LocationUtil.getLocationName(session, city, location));
		generateStringForFacilities(index);
		
		
		return index.toString();
	}
	
	@Transient
	public int getPostIdStr() {
		return postIdStr;
	}
	public void setPostIdStr(int postIdStr) {
		this.postIdStr = postIdStr;
	}
	
	@Id
	@Column(name="POST_ID")
	public int getPostId(){
		return this.postId;
	}
	public void setPostId(int PostId){
		this.postId = PostId;
	}

	@Column(name="SUB_CATEGORY")
	public String getSubCategory(){
		return this.subCategory;
	}
	public void setSubCategory(String SubCategory){
		this.subCategory = SubCategory;
	}

	@Column(name="RENT_OR_SALE")
	public String getRentOrSale(){
		return this.rentOrSale;
	}
	public void setRentOrSale(String RentOrSale){
		this.rentOrSale = RentOrSale;
	}

	@Column(name="NEW_OR_RESALE")
	public String getNewOrResale(){
		return this.newOrResale;
	}
	public void setNewOrResale(String NewOrResale){
		this.newOrResale = NewOrResale;
	}

	public int getArea(){
		return this.area;
	}
	public void setArea(int Area){
		this.area = Area;
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

	@Column(name="PRICE_VALUE")
	public double getPriceValue(){
		return this.priceValue;
	}
	public void setPriceValue(double PriceValue){
		this.priceValue = PriceValue;
	}

	@Column(name="PRICE_UNIT")
	public String getPriceUnit(){
		return this.PpriceUnit;
	}
	public void setPriceUnit(String PriceUnit){
		this.PpriceUnit = PriceUnit;
	}

	@Column(name="FACING_DIRECTION")
	public String getFacingDirection(){
		return this.facingDirection;
	}
	public void setFacingDirection(String FacingDirection){
		this.facingDirection = FacingDirection;
	}

	@Column(name="MARITAL_PREFERENCE")
	public String getMaritalPreference(){
		return this.maritalPreference;
	}
	public void setMaritalPreference(String MaritalPreference){
		this.maritalPreference = MaritalPreference;
	}

	@Column(name="FOOD_PREFERENCE")
	public String getFoodPreference(){
		return this.foodPreference;
	}
	public void setFoodPreference(String FoodPreference){
		this.foodPreference = FoodPreference;
	}

	@Column(name="REGIONAL_PREFERENCE")
	public String getRegionalPreference(){
		return this.regionalPreference;
	}
	public void setRegionalPreference(String RegionalPreference){
		this.regionalPreference = RegionalPreference;
	}

	@Column(name="BEDROOMS")
	public String getBedrooms(){
		return this.bedrooms;
	}
	public void setBedrooms(String Bedrooms){
		this.bedrooms = Bedrooms;
	}

	@Column(name="AGE_VALUE")
	public int getAgeValue(){
		return this.ageValue;
	}
	public void setAgeValue(int AgeValue){
		this.ageValue = AgeValue;
	}

	@Column(name="AGE_UNIT")
	public String getAgeUnit(){
		return this.ageUnit;
	}
	public void setAgeUnit(String AgeUnit){
		this.ageUnit = AgeUnit;
	}

	@Column(name="FURNISHED")
	public String getFurnished(){
		return this.furnished;
	}
	public void setFurnished(String Furnished){
		this.furnished = Furnished;
	}

	@Column(name="FLOOR_NUMBER")
	public String getFloorNumber(){
		return this.floorNumber;
	}
	public void setFloorNumber(String FloorNumber){
		this.floorNumber = FloorNumber;
	}

	@Column(name="DEPOSIT")
	public double getDeposit(){
		return this.deposit;
	}
	public void setDeposit(double Deposit){
		this.deposit = Deposit;
	}
	
	@Column(name="MAINTENANCE")
	public double getMaintenance(){
		return this.maintenance;
	}
	public void setMaintenance(double Maintenance){
		this.maintenance = Maintenance;
	}

	@Column(name="APPROVAL_AUTHORITY")
	public String getApprovalAuthority(){
		return this.approvalAuthority;
	}
	public void setApprovalAuthority(String ApprovalAuthority){
		this.approvalAuthority = ApprovalAuthority;
	}

	@Column(name="BUILDER_NAME")
	public String getBuilderName(){
		return this.builderName;
	}
	public void setBuilderName(String BuilderName){
		this.builderName = BuilderName;
	}

	@Column(name="SHARING")
	public String getSharing(){
		return this.sharing;
	}
	public void setSharing(String Sharing){
		this.sharing = Sharing;
	}

	@Column(name="GENDER")
	public String getGender(){
		return this.gender;
	}
	public void setGender(String Gender){
		this.gender = Gender;
	}

	@Column(name="NO_OF_ROOMMATES")
	public int getNoOfRoommates(){
		return this.noOfRoommates;
	}
	public void setNoOfRoommates(int NoOfRoommates){
		this.noOfRoommates = NoOfRoommates;
	}

	@Column(name="CAR_PARKING")
	public String getCarParking(){
		return this.carParking;
	}
	public void setCarParking(String CarParking){
		this.carParking = CarParking;
	}

	@Column(name="FOOD")
	public String getFood(){
		return this.food;
	}
	public void setFood(String Food){
		this.food = Food;
	}

	@Column(name="WIFI")
	public String getWifi(){
		return this.wifi;
	}
	public void setWifi(String Wifi){
		this.wifi = Wifi;
	}

	@Column(name="GYM")
	public String getGym(){
		return this.gym;
	}
	public void setGym(String Gym){
		this.gym = Gym;
	}

	@Column(name="CHILDREN_PLAY_AREA")
	public String getChildrenPlayArea(){
		return this.childrenPlayArea;
	}
	public void setChildrenPlayArea(String ChildrenPlayArea){
		this.childrenPlayArea = ChildrenPlayArea;
	}

	@Column(name="SWIMMING_POOL")
	public String getSwimmingPool(){
		return this.swimmingPool;
	}
	public void setSwimmingPool(String SwimmingPool){
		this.swimmingPool = SwimmingPool;
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
	public String getAreaStr() {
		return areaStr;
	}
	public void setAreaStr(String areaStr) {
		this.areaStr = areaStr;
	}
	
	@Column(name="CLUB_HOUSE")
	public String getClubHouse() {
		return clubHouse;
	}
	public void setClubHouse(String clubHouse) {
		this.clubHouse = clubHouse;
	}
	
	@Column(name="TV")
	public String getTv() {
		return tv;
	}
	public void setTv(String tv) {
		this.tv = tv;
	}
	
	@Transient
	public String getBhk() {
		return bhk;
	}
	public void setBhk(String bhk) {
		this.bhk = bhk;
	}
	
	@Transient
	public String getRent() {
		return rent;
	}
	public void setRent(String rent) {
		this.rent = rent;
	}
	
	@Transient
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}
	
	@Transient
	public String getShare() {
		return share;
	}
	public void setShare(String share) {
		this.share = share;
	}
	
	@Column(name="READY_TO_OCCUPY")
	public String getReadyToOccupy() {
		return readyToOccupy;
	}
	public void setReadyToOccupy(String readyToOccupy) {
		this.readyToOccupy = readyToOccupy;
	}
	
	@Column(name="EXPECTED_COMPLETION_DATE")
	public String getExpectedCompletionDate() {
		return expectedCompletionDate;
	}
	public void setExpectedCompletionDate(String expectedCompletionDate) {
		this.expectedCompletionDate = expectedCompletionDate;
	}
	
	@Transient
	public String getMaintenanceStr() {
		return maintenanceStr;
	}
	public void setMaintenanceStr(String maintenanceStr) {
		this.maintenanceStr = maintenanceStr;
	}
	
	@Transient
	public String getDepositStr() {
		return depositStr;
	}
	public void setDepositStr(String depositStr) {
		this.depositStr = depositStr;
	}
	
	@Column(name="POWER_BACKUP")
	public String getPowerBackup() {
		return powerBackup;
	}
	public void setPowerBackup(String powerBackup) {
		this.powerBackup = powerBackup;
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
	
	@Column(name="BATHROOMS")
	public int getBathrooms() {
		return bathrooms;
	}
	public void setBathrooms(int bathrooms) {
		this.bathrooms = bathrooms;
	}	
}
