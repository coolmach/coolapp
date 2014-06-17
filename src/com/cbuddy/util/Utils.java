package com.cbuddy.util;

import java.util.HashMap;


public class Utils {
	private static Utils instance = new Utils();
	private HashMap<String, String> categoryDescMap = new HashMap<String, String>(); 
	private Utils(){
		//Category and Sub Categories for REAL_ESTATE
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE, "Real Estate");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT, "Apartments for Rent");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE, "Apartments for Sale");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_RENT, "Individual House for Rent");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_SALE, "Individual House for Sale");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_LAND_SALE, "Land for Sale");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION, "PG Accommodation");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED, "Roommate Required");
		//Category and Sub Categories for CARS/BIKES
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES, "AutoMobiles");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS, "Cars");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_MOTORCYCLES, "MotorCycles");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_SCOOTERS, "Scooters");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_VANS, "Vans");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_BICYCLES, "Bicycles");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_BUSES, "Buses");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_TRUCKS, "Trucks");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_REPAIRS, "Motor Service/Repair");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_SPARE_PARTS, "Spare Parts");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_DRIVING_SCHOOLS, "Driving Schools");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_OTHER_VEHICLES, "Other Vehicles");
	}
	public static Utils getInstance(){
		return instance;
	}
	
	
	public String getCategoryDesc(String categoryCode){
		String output = categoryCode;
		if(categoryDescMap.get(categoryCode) != null){
			output = categoryDescMap.get(categoryCode);
		}
		return output;
	}

	public String getSubCategoryDesc(String categoryCode, String subCategoryCode){
		String output = subCategoryCode;
		if(categoryDescMap.get(categoryCode + "_" + subCategoryCode) != null){
			output = categoryDescMap.get(categoryCode + "_" + subCategoryCode);
		}
		return output;
	}
	
	public String getFloorNumberDesc(String floorNumber){
		
		if(floorNumber == null){
			return null;
		}
		
		String output = floorNumber;

		if(floorNumber.equals("G")){
			output = "Ground";
		}else if(floorNumber.equals("1")){
			output = "First";
		}else if(floorNumber.equals("2")){
			output = "Second";
		}else if(floorNumber.equals("3")){
			output = "Third";
		}else if(floorNumber.equals("4")){
			output = "Fourth";
		}else if(floorNumber.equals("5")){
			output = "Fifth";
		}else if(floorNumber.equals("6")){
			output = "Sixth";
		}else if(floorNumber.equals("7")){
			output = "Seventh";
		}
		return output;
	}
	
	public String getDirectionDesc(String direction){
		
		if(direction == null){
			return null;
		}
		
		String output = direction;
		if(direction.equals("N")){
			output = "North";
		}else if(direction.equals("E")){
			output = "East";
		}else if(direction.equals("W")){
			output = "West";
		}else if(direction.equals("S")){
			output = "South";
		}
		return output;
	}
	
	public String getFurnishedDesc(String furnish){
		
		if(furnish == null){
			return null;
		}
		
		String output = furnish;
		if(furnish.equals("N")){
			output = "Not Furnished";
		}else if(furnish.equals("S")){
			output = "Semi Furnished";
		}else if(furnish.equals("F")){
			output = "Fully Furnished";
		}
		return output;
	}
}
