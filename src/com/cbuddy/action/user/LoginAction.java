package com.cbuddy.action.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.cbuddy.beans.Ucred;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.services.AuthenticateUserService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LogUtil;
import com.model.user.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements SessionAware,ServletRequestAware,ModelDriven<Ucred>{

	private String username;
	private String password;
	private String isLoginErrorExists="false";
	private String isSignUpErrorExists="false";
	private boolean isValidUser = false;

	private String firstName;

	private String selectedCorpName; //In Sign Up screen, it corresponds to the value SELECTED by user in autosuggest list. This value cannot be modified after selection.
	public String getSelectedCorpName() {
		return selectedCorpName;
	}
	public void setSelectedCorpName(String selectedCorpName) {
		this.selectedCorpName = selectedCorpName;
	}

	private String corpName; //In Sign Up screen, it corresponds to the value in Company Name text box at the time of form submission. This value can be modified by the user later even after selection from auto suggest.

	private String responseMsg;


	Ucred ucred = new Ucred();

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isValidUser() {
		return isValidUser;
	}
	public void setValidUser(boolean isValidUser) {
		this.isValidUser = isValidUser;
	}

	public String getIsLoginErrorExists() {
		return isLoginErrorExists;
	}
	public void setIsLoginErrorExists(String isLoginErrorExists) {
		this.isLoginErrorExists = isLoginErrorExists;
	}

	public String getIsSignUpErrorExists() {
		return isSignUpErrorExists;
	}
	public void setIsSignUpErrorExists(String isSignUpErrorExists) {
		this.isSignUpErrorExists = isSignUpErrorExists;
	}

	/*public void validate(){
		System.out.println("LoginAction.validate()");
		if (userName == null || userName.trim().equals("")){
			addFieldError("userName","Username is required");
			setValid("false");
		}else if (password == null || password.trim().equals("")){
			addFieldError("password","Password is required");
			setValid("false");
		}
	}*/

	public String execute(){

		clearErrors();
		User user =  (User) session.get("userInfo");
		if(user != null){
			return "success";
		}else{
			User u = null;
			try{
				u = new AuthenticateUserService().authenticateUser(username, password);
				session.put("userInfo", u);
				session.put("userLoggedIn", "Y");
				session.put("username", u.getFirstName());

				return "success";
			}catch(CBuddyException e){
				switch(e.getErrorCode()){
				case CBuddyConstants.NON_EXISTENT_USER_ID:
					//Email Id / Mobile number does not exist
					addFieldError("username", "Invalid user credentials");
					break;
				case CBuddyConstants.INVALID_USER_NAME:
					//Neither a valid email id nor valid mobile number
					addFieldError("username", "Invalid user id");
					break;
				case CBuddyConstants.INVALID_PASSWORD:
					//Invalid password
					addFieldError("password", "Invalid Password");
					break;
				}
				isLoginErrorExists="true";

				return "input";
			}
		}
	}

	public String signUp(){
		LogUtil.getInstance().info("LoginAction - Signup()");
		try{

			if(!selectedCorpName.equals(corpName)){
				return Action.INPUT;
			}

			AuthenticateUserService auService = new AuthenticateUserService();
			auService.registerUser(getModel());

			responseMsg = "You have been successfully become a cBuddy " + getModel().getFirstName();

		}catch(CBuddyException e){
			switch(e.getErrorCode()){
			case CBuddyConstants.EXISTENT_USER_ID:
				addFieldError("CorpEmailId",e.getMessage());
				break;	
			}
			isSignUpErrorExists="true";

			return "error";
		}

		return "success";
	}


	public String myLogin(){
		return "success";
	}

	private Map<String,Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	@Override
	public Ucred getModel() {
		return ucred;
	}
	HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}
	public String selectedCompanyName() {
		return selectedCorpName;
	}
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public String getResponseMsg() {
		return responseMsg;
	}
	public void setResponseMsg(String responseMsg) {
		this.responseMsg = responseMsg;
	}
}
