package com.cbuddy.util;

import java.util.HashMap;


public class Utils {
	private static HashMap<String, String> categoryDescMap = new HashMap<String, String>(); 
	static{
		//Category and Sub Categories for REAL_ESTATE
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE, "Real Estate");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT, "Apartment for Rent");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE, "Apartment for Sale");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_RENT, "Individual House for Rent");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_SALE, "Individual House for Sale");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_LAND_SALE, "Land for Sale");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION, "PG Accommodation");
		categoryDescMap.put(CBuddyConstants.CATEGORY_REAL_ESTATE + "_" + CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED, "Roommate Required");
		
		//Category and Sub Categories for CARS/BIKES
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES, "AutoMobiles");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS, "Cars");
		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_MOTORCYCLES, "MotorCycles");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_SCOOTERS, "Scooters");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_VANS, "Vans");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_BICYCLES, "Bicycles");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_BUSES, "Buses");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_TRUCKS, "Trucks");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_REPAIRS, "Motor Service/Repair");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_SPARE_PARTS, "Spare Parts");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_DRIVING_SCHOOLS, "Driving Schools");
//		categoryDescMap.put(CBuddyConstants.CATEGORY_AUTOMOBILES + "_" + CBuddyConstants.SUBCATEGORY_AUTOMOBILES_OTHER_VEHICLES, "Other Vehicles");
		
		//Category and Sub Categories for LAPTOPS
		categoryDescMap.put(CBuddyConstants.CATEGORY_COMPUTERS, "Computers and Laptops");
		categoryDescMap.put(CBuddyConstants.CATEGORY_COMPUTERS + "_" + CBuddyConstants.SUBCATEGORY_COMPUTERS_DESKTOPS, "Desktops");
		categoryDescMap.put(CBuddyConstants.CATEGORY_COMPUTERS + "_" + CBuddyConstants.SUBCATEGORY_COMPUTERS_LAPTOPS, "Laptops");
		categoryDescMap.put(CBuddyConstants.CATEGORY_COMPUTERS + "_" + CBuddyConstants.SUBCATEGORY_COMPUTERS_TABS, "Tabs");
		categoryDescMap.put(CBuddyConstants.CATEGORY_COMPUTERS + "_" + CBuddyConstants.SUBCATEGORY_COMPUTERS_ACCESSORIES, "Accessories");
		
		//Category and Sub Categories for MOBILE
		categoryDescMap.put(CBuddyConstants.CATEGORY_MOBILE, "Mobiles And Accessories");
		categoryDescMap.put(CBuddyConstants.CATEGORY_MOBILE + "_" + CBuddyConstants.SUBCATEGORY_MOBILE_MOBILEPHONES, "Handsets");
		categoryDescMap.put(CBuddyConstants.CATEGORY_MOBILE + "_" + CBuddyConstants.SUBCATEGORY_MOBILE_ACCESORIES, "Accessories");
	
		//Category and Sub Categories for FURNITURE
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE, "Furniture");
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_COT_WOOD, "Cot - Wooden");
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_COT_STEEL, "Cot - Steel");		
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_MATTRESS, "Mattress");
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_DINING, "Dining Table");
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_SHOE, "Shoe Rack");
     	categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_TV, "TV Stand");
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_TABLE, "Table");
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_CHAIR_WOOD, "Chair - Wood");
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_CHAIR_PLASTIC, "hair - Plastic");
		categoryDescMap.put(CBuddyConstants.CATEGORY_FURNITURE + "_" + CBuddyConstants.SUBCATEGORY_FURNITURE_OTHERS, "Others");
	
		////Category and Sub Categories for ELECTRONICS AND HOUSEHOLD
		categoryDescMap.put(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD, "Electronics & Household");
		categoryDescMap.put(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD + "_" + CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_ALL, "All");
		categoryDescMap.put(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD + "_" + CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_TELEVISION, "Televisions");
		categoryDescMap.put(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD + "_" + CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_CAMERA, "Digital Cameras, Camcorders");
		categoryDescMap.put(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD + "_" + CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_AIRCOOLER, "Air Coolers, Air Conditioners");
		categoryDescMap.put(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD + "_" + CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_FRIDGE, "Refrigerators");
		categoryDescMap.put(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD + "_" + CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_WASHINGMACHINE, "Washing Machines");
		categoryDescMap.put(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD + "_" + CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_DVD_MUSIC_PLAYER, "DVD Players, Music Players, iPods");
	
		
	}
	
	public Utils(){
	}

	public String getCategoryDesc(String categoryCode){
		String output = "";
		if(categoryDescMap.get(categoryCode) != null){
			output = categoryDescMap.get(categoryCode);
		}
		return output;
	}

	public String getSubCategoryDesc(String categoryCode, String subCategoryCode){
		String output = "";
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
	
	public String getLaptopMakeDesc(String input){
		if(input == null){
			return null;
		}

		String output = input;
		if(input.equals("SON")) output = "Sony";
		else if(input.equals("ACE")) output = "Acer";
		else if(input.equals("DELL")) output = "Dell";
		else if(input.equals("SAM")) output = "Samsung";
		else if(input.equals("HP")) output = "HP/Compaq";
		else if(input.equals("APP")) output = "Apple";
		else if(input.equals("WIP")) output = "Wipro";
		else if(input.equals("HCL")) output = "HCL";
		else if(input.equals("OTH")) output = "Others";
		return output;
	}
	
	public String getMobileBrandDesc(String input){
		if(input == null){
			return null;
		}

		String output = input;
		if(input.equals("SON")) output = "Sony";
		else if(input.equals("SAM")) output = "Samsung";
		else if(input.equals("NOK")) output = "Nokia";
		else if(input.equals("APP")) output = "Apple";
		else if(input.equals("OTH")) output = "Others";
		return output;
	}
	
	public String getFurnitureTypeDesc(String input){
		if(input == null){
			return null;
		}

		String output = input;
		if(input.equals("COT_WOOD")) output = "Cot - Wooden";
		else if(input.equals("COT_STEEL")) output = "Cot - Steel";
		else if(input.equals("MATTRESS")) output = "Mattress";
		else if(input.equals("DINING")) output = "Dining Table";
		else if(input.equals("SHOE")) output = "Shoe Rack";
		else if(input.equals("TV")) output = "TV Stand";
		else if(input.equals("TABLE")) output = "Table";
		else if(input.equals("CHAIR_WOOD")) output = "Chair - Wooden";
		else if(input.equals("CHAIR_PLASTIC")) output = "Chair - Plastic";
		else if(input.equals("ALMIRAH")) output = "Almirah";
		else if(input.equals("OTH")) output = "Others";
		return output;
	}
	
	private static String[] keywords = {"JUNGLE", "HILL", "CHIMNEY", "BREEZE", "FLOWER", "BROOK", "SNOW", "COFFEE", "FOUNTAIN", "GREEN"};
	public String generateActivationCode(){
		//Math.random gives between 0 and 1.
		long randomNumber = Math.round(Math.random() * 100000);
		String actCode = String.valueOf(randomNumber).substring(0,4);
		
		int randomIndex = (int)Math.round(Math.random() * 10);
		actCode = keywords[randomIndex%10] + "@" + actCode;
		
		return actCode;
	}
	
}
