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

	public String getFuelTypeDesc(String fuelType){
		if(fuelType == null){
			return null;
		}

		String output = fuelType;
		if(fuelType.equals("P")){
			output = "Petrol";
		}else if(fuelType.equals("D")){
			output = "Diesel";
		}
		return output;
	}

	public String getCarMakeDesc(String input){
		if(input == null){
			return null;
		}

		String output = input;
		if(input.equals("MAR")) output = "Maruti Suzuki";
		else if(input.equals("HYU")) output = "Ford";
		else if(input.equals("FORD")) output = "Fiat";
		else if(input.equals("HON")) output = "Honda";
		else if(input.equals("HYU")) output = "Hyundai";
		else if(input.equals("MAH")) output = "Mahindra";
		else if(input.equals("CHE")) output = "Chevrolet";
		else if(input.equals("NIS")) output = "Nissan";
		else if(input.equals("REN")) output = "Renault";
		else if(input.equals("SKO")) output = "Skoda";
		else if(input.equals("TATA")) output = "Tata";
		else if(input.equals("TOY")) output = "Toyota";
		else if(input.equals("VOL")) output = "Volkswagen";
		else if(input.equals("OTH")) output = "Others";
		return output;
	}
	
	public String getCarModelDesc(String make, String model){
		if(model == null || make == null){
			return null;
		}

		String output = model;
		if(model.equals("M1")) output = "Model 1";
		else if(model.equals("M2")) output = "Model 2";
		else if(model.equals("M3")) output = "Model 3";
		else if(model.equals("M4")) output = "Model 4";
		else if(model.equals("M5")) output = "Model 5";
		return output;
	}
	
	public String getBikeMakeDesc(String input){
		if(input == null){
			return null;
		}

		String output = input;
		if(input.equals("BAJ")) output = "Bajaj";
		else if(input.equals("HER")) output = "Hero Honda";
		else if(input.equals("HON")) output = "Honda";
		else if(input.equals("TVS")) output = "TVS";
		else if(input.equals("YAM")) output = "Yamaha";
		else if(input.equals("SUZ")) output = "Suzuki";
		else if(input.equals("ROY")) output = "Royal Enfield";
		else if(input.equals("OTH")) output = "Others";
		return output;
	}
	
	public String getBikeModelDesc(String make, String model){
		if(model == null || make == null){
			return null;
		}

		String output = model;
		if(model.equals("M1")) output = "Model 1";
		else if(model.equals("M2")) output = "Model 2";
		else if(model.equals("M3")) output = "Model 3";
		else if(model.equals("M4")) output = "Model 4";
		else if(model.equals("M5")) output = "Model 5";
		return output;
	}
}
