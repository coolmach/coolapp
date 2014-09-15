package com.cbuddy.util;

import java.text.DecimalFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.cbuddy.exception.CBuddyException;


public class NumberFormatterUtil {
	public static String formatAmount(double input){
		DecimalFormat df = new DecimalFormat("#,##,###.00");
		return df.format(input);
	}
	
	public static String getNumericValue(String str){

		Pattern pattern = Pattern.compile("(\\d+\\.\\d+)|(\\d+)");
		try{
			Matcher matcher = pattern.matcher(str);
			matcher.find();
			str = matcher.group();
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}

	public static double convertStrToAmount(String amountStr)
	throws CBuddyException{
		double d = 0;
		if(amountStr == null){
			return d;
		}
		
		/* Check location of commas, E.g. 1,50,000.45
		 * The last comma in the string should have 3 digits after it.
		 * All other commas should have max 2 digits between it and the next comma.
		 */
		if(amountStr.contains(",")){
			String[] amountTokens = amountStr.split(",");
			String lastToken = amountTokens[amountTokens.length - 1];
			if(lastToken.length() < 3){
				throw new CBuddyException("Invalid Amount");
			}
			for(int index=0; index<amountTokens.length-1; index++){
				String token = amountTokens[index];
				if(token.length()>3){
					throw new CBuddyException("Invalid Amount");
				}
			}
		}
		
		//Remove commas and convert this string to double
		amountStr = amountStr.replace(",", "");
		try{
			d = Double.parseDouble(amountStr);
		}catch(Exception e){
			throw new CBuddyException("Invalid Amount");
		}
		
		return d;
	}
	
	public static void main(String[] args){
		String input = "2,223.33";
		double d = Double.parseDouble(input);
		System.out.println(d);
	}
}
