package com.cbuddy.util;

import java.text.DecimalFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


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

}
