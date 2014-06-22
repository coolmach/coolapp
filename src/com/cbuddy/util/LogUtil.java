package com.cbuddy.util;

import org.apache.log4j.Logger;

public class LogUtil {

	private static Logger instance = Logger.getLogger(LogUtil.class.getName());
	private LogUtil(){

	}
	public static Logger getInstance(){
		return instance;
	}
	public void log(String message){
		instance.debug(message);
	}
	public void logException(Exception e){
		instance.error(e);
	}
}
