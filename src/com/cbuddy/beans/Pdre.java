package com.cbuddy.beans; 


import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name = "Pdre")

public class Pdre {
	private int PostId;
	private String SubCategory;
	private String RentOrSale;
	private String NewOrResale;
	private String Area;
	private String Location;
	private String City;
	private double PriceValue;
	private String PriceUnit;
	private String FacingDirection;
	private String MaritalPreference;
	private String FoodPreference;
	private String RegionalPreference;
	private int Bedrooms;
	private int AgeValue;
	private String AgeUnit;
	private String Furnished;
	private String FloorNumber;
	private double Maintenance;
	private String ApprovalAuthority;
	private String BuilderName;
	private String Sharing;
	private String Gender;
	private int NoOfRoommates;
	private String CarParking;
	private String Food;
	private String Wifi;
	private String Gym;
	private String ChildrenPlayArea;
	private String SwimmingPool;
	private Timestamp CreatedOn;
	private String CreatedBy;
	private Timestamp ModifiedOn;
	private String ModifiedBy;


	@Id
	@GeneratedValue	
	@Column(name="POST_ID")
	public int getPostId(){
		return this.PostId;
	}
	public void setPostId(int PostId){
		this.PostId = PostId;
	}

	@Column(name="SUB_CATEGORY")
	public String getSubCategory(){
		return this.SubCategory;
	}
	public void setSubCategory(String SubCategory){
		this.SubCategory = SubCategory;
	}

	@Column(name="RENT_OR_SALE")
	public String getRentOrSale(){
		return this.RentOrSale;
	}
	public void setRentOrSale(String RentOrSale){
		this.RentOrSale = RentOrSale;
	}

	@Column(name="NEW_OR_RESALE")
	public String getNewOrResale(){
		return this.NewOrResale;
	}
	public void setNewOrResale(String NewOrResale){
		this.NewOrResale = NewOrResale;
	}

	@Column(name="AREA")
	public String getArea(){
		return this.Area;
	}
	public void setArea(String Area){
		this.Area = Area;
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

	@Column(name="PRICE_VALUE")
	public double getPriceValue(){
		return this.PriceValue;
	}
	public void setPriceValue(double PriceValue){
		this.PriceValue = PriceValue;
	}

	@Column(name="PRICE_UNIT")
	public String getPriceUnit(){
		return this.PriceUnit;
	}
	public void setPriceUnit(String PriceUnit){
		this.PriceUnit = PriceUnit;
	}

	@Column(name="FACING_DIRECTION")
	public String getFacingDirection(){
		return this.FacingDirection;
	}
	public void setFacingDirection(String FacingDirection){
		this.FacingDirection = FacingDirection;
	}

	@Column(name="MARITAL_PREFERENCE")
	public String getMaritalPreference(){
		return this.MaritalPreference;
	}
	public void setMaritalPreference(String MaritalPreference){
		this.MaritalPreference = MaritalPreference;
	}

	@Column(name="FOOD_PREFERENCE")
	public String getFoodPreference(){
		return this.FoodPreference;
	}
	public void setFoodPreference(String FoodPreference){
		this.FoodPreference = FoodPreference;
	}

	@Column(name="REGIONAL_PREFERENCE")
	public String getRegionalPreference(){
		return this.RegionalPreference;
	}
	public void setRegionalPreference(String RegionalPreference){
		this.RegionalPreference = RegionalPreference;
	}

	@Column(name="BEDROOMS")
	public int getBedrooms(){
		return this.Bedrooms;
	}
	public void setBedrooms(int Bedrooms){
		this.Bedrooms = Bedrooms;
	}

	@Column(name="AGE_VALUE")
	public int getAgeValue(){
		return this.AgeValue;
	}
	public void setAgeValue(int AgeValue){
		this.AgeValue = AgeValue;
	}

	@Column(name="AGE_UNIT")
	public String getAgeUnit(){
		return this.AgeUnit;
	}
	public void setAgeUnit(String AgeUnit){
		this.AgeUnit = AgeUnit;
	}

	@Column(name="FURNISHED")
	public String getFurnished(){
		return this.Furnished;
	}
	public void setFurnished(String Furnished){
		this.Furnished = Furnished;
	}

	@Column(name="FLOOR_NUMBER")
	public String getFloorNumber(){
		return this.FloorNumber;
	}
	public void setFloorNumber(String FloorNumber){
		this.FloorNumber = FloorNumber;
	}

	@Column(name="MAINTENANCE")
	public double getMaintenance(){
		return this.Maintenance;
	}
	public void setMaintenance(double Maintenance){
		this.Maintenance = Maintenance;
	}

	@Column(name="APPROVAL_AUTHORITY")
	public String getApprovalAuthority(){
		return this.ApprovalAuthority;
	}
	public void setApprovalAuthority(String ApprovalAuthority){
		this.ApprovalAuthority = ApprovalAuthority;
	}

	@Column(name="BUILDER_NAME")
	public String getBuilderName(){
		return this.BuilderName;
	}
	public void setBuilderName(String BuilderName){
		this.BuilderName = BuilderName;
	}

	@Column(name="SHARING")
	public String getSharing(){
		return this.Sharing;
	}
	public void setSharing(String Sharing){
		this.Sharing = Sharing;
	}

	@Column(name="GENDER")
	public String getGender(){
		return this.Gender;
	}
	public void setGender(String Gender){
		this.Gender = Gender;
	}

	@Column(name="NO_OF_ROOMMATES")
	public int getNoOfRoommates(){
		return this.NoOfRoommates;
	}
	public void setNoOfRoommates(int NoOfRoommates){
		this.NoOfRoommates = NoOfRoommates;
	}

	@Column(name="CAR_PARKING")
	public String getCarParking(){
		return this.CarParking;
	}
	public void setCarParking(String CarParking){
		this.CarParking = CarParking;
	}

	@Column(name="FOOD")
	public String getFood(){
		return this.Food;
	}
	public void setFood(String Food){
		this.Food = Food;
	}

	@Column(name="WIFI")
	public String getWifi(){
		return this.Wifi;
	}
	public void setWifi(String Wifi){
		this.Wifi = Wifi;
	}

	@Column(name="GYM")
	public String getGym(){
		return this.Gym;
	}
	public void setGym(String Gym){
		this.Gym = Gym;
	}

	@Column(name="CHILDREN_PLAY_AREA")
	public String getChildrenPlayArea(){
		return this.ChildrenPlayArea;
	}
	public void setChildrenPlayArea(String ChildrenPlayArea){
		this.ChildrenPlayArea = ChildrenPlayArea;
	}

	@Column(name="SWIMMING_POOL")
	public String getSwimmingPool(){
		return this.SwimmingPool;
	}
	public void setSwimmingPool(String SwimmingPool){
		this.SwimmingPool = SwimmingPool;
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
