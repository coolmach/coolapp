package com.cbuddy.action.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.cbuddy.beans.Ucred;
import com.cbuddy.beans.Uprof;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.services.AuthenticateUserService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LogUtil;
import com.model.user.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements SessionAware,ServletRequestAware,ModelDriven<Ucred>{

	private String userName;
	private String password;
	private String valid="true";
	private boolean isValidUser = false;
	private String firstName;
	
	private String selectedCompanyName; //In Sign Up screen, it corresponds to the value SELECTED by user in autosuggest list. This value cannot be modified after selection.
	private String corpName; //In Sign Up screen, it corresponds to the value in Company Name text box at the time of form submission. This value can be modified by the user later even after selection from auto suggest.
	
	private String responseMsg;
	
	Ucred ucred = new Ucred();

	public boolean isValidUser() {
		return isValidUser;
	}
	public void setValidUser(boolean isValidUser) {
		this.isValidUser = isValidUser;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
		System.out.println("--------execute(): "+userName);
		clearErrors();
		User user =  (User) session.get("userInfo");
		if(user != null){
			return "success";
		}else{
			User u = null;
			try{
				u = new AuthenticateUserService().authenticateUser(userName, password);
				session.put("userInfo", u);
				session.put("userLoggedIn", "Y");
				System.out.println(u.getFirstName());
				this.firstName = u.getFirstName();
				return "success";
			}catch(CBuddyException e){
				switch(e.getErrorCode()){
				case CBuddyConstants.NON_EXISTENT_USER_ID:
					//Email Id / Mobile number does not exist
					addFieldError("userName", "Invalid user credentials");
					break;
				case CBuddyConstants.INVALID_USER_NAME:
					//Neither a valid email id nor valid mobile number
					addFieldError("userName", "Invalid user id");
					break;
				case CBuddyConstants.INVALID_PASSWORD:
					//Invalid password
					addFieldError("password", "Invalid Password");
					break;
				}
				return "input";
			}
		}
	}

	public String signUp(){
		LogUtil.getInstance().info("LoginAction - Signup()");
		try{
			
			if(!selectedCompanyName.equals(corpName)){
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
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
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
		return selectedCompanyName;
	}
	public void setSelectedCompanyName(String selectedCompanyName) {
		this.selectedCompanyName = selectedCompanyName;
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
