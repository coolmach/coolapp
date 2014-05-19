package com.cbuddy.util;

public class TextUtil {
	public static boolean isAlphaNumeric(String input){
		boolean alphaNumeric = false;
		if(input != null){
			String pattern= "^[\\pL\\pN]+$";
			if(input.matches(pattern)){
				alphaNumeric = true;
			}
		}
		return alphaNumeric;
	}

	public static boolean isNumeric(String input){
		boolean numeric = false;
		if(input != null){
			String pattern= "^[\\pN]+$";
			if(input.matches(pattern)){
				numeric = true;
			}
		}
		return numeric;
	}
	
	public static boolean isValidEmail(String input){
		boolean valid = false;
		if(input != null){
			String pattern = 
					"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
					+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
			if(input.matches(pattern)){
				valid = true;
			}
		}
		return valid;
	}
}
