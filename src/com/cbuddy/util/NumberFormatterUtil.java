package com.cbuddy.util;

import java.text.DecimalFormat;


public class NumberFormatterUtil {
	public static String formatAmount(double input){
		DecimalFormat df = new DecimalFormat("#,##,###.00");
		return df.format(input);
	}
}
