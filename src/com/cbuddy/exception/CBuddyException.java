package com.cbuddy.exception;

public class CBuddyException extends Exception{
	private static final long serialVersionUID = 1L;
	private String message;
	private int code = 0;
	private String fieldName; //Indicates which field in a form was entered wrong (applicable to form validation error messages - used to highlight the field in the form while throwing the error (document.getElementById(#fieldName#).focus()))
	public CBuddyException(String msg, int code){
		this.message = msg;
		this.code = code;
	}
	public CBuddyException(String msg, int code, String fieldName){
		this.message = msg;
		this.code = code;
		this.fieldName = fieldName;
	}
	public CBuddyException(String msg){
		this.message = msg;
	}
	public CBuddyException(String msg, String errorFieldName){
		this.message = msg;
		this.fieldName = errorFieldName;
	}
	public String getMessage(){
		return this.message;
	}
	public int getErrorCode(){
		return this.code;
	}
	public String getFieldName(){
		return this.fieldName;
	}
}
