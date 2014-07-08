package com.cbuddy.util;

import org.apache.log4j.Logger;

public class LogUtil {

	private static Logger instance = Logger.getLogger("CBUDDY_LOGGER");
	private LogUtil(){

	}
	public static Logger getInstance(){
		return instance;
	}
	public void log(String message){
		instance.info(message);
	}
	public void logException(Exception e){
		instance.error(e);
	}
}
