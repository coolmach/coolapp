package com.cbuddy.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.cbuddy.exception.CBuddyException;


public class FormatterUtil {
	
	public static String formatAmount(double input){
		String output = formatLakh(input);
		if(output.contains(".")){
			output = output.substring(0, output.indexOf('.'));
		}
		return output;
	}

	private static String formatLakh(double d) {
	    String s = String.format(Locale.UK, "%1.2f", Math.abs(d));
	    s = s.replaceAll("(.+)(...\\...)", "$1,$2");
	    while (s.matches("\\d{3,},.+")) {
	        s = s.replaceAll("(\\d+)(\\d{2},.+)", "$1,$2");
	    }
	    return d < 0 ? ("-" + s) : s;
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
	
	public static String formatDate(Timestamp timestamp){
		String formattedDate = null;
		if(timestamp == null){
			return null;
		}
		
		long inputTime = timestamp.getTime();
		
		Calendar now = Calendar.getInstance();
		Calendar timeToCheck = Calendar.getInstance();
		timeToCheck.setTimeInMillis(inputTime);

		if(now.get(Calendar.YEAR) == timeToCheck.get(Calendar.YEAR)) {
		    if(now.get(Calendar.DAY_OF_YEAR) == timeToCheck.get(Calendar.DAY_OF_YEAR)) {
		    	formattedDate = "Today";
		    }
		}
		
		if(formattedDate == null){
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
			formattedDate = sdf.format(new Date(timestamp.getTime()));
		}
		
		return formattedDate;
	}
	
	public static void main(String[] args){
		String input = "2,223.33";
		double d = 200000;
		System.out.println(formatAmount(d));
	}
}
