package com.cbuddy.user.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Poit;
import com.cbuddy.beans.Ucred;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.posts.util.PostsUtil;
import com.cbuddy.user.model.User;
import com.cbuddy.user.services.AuthenticateUserService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LogUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements SessionAware,ServletRequestAware,ModelDriven<Ucred>{

	private static final long serialVersionUID = 6843895148367665639L;
	private List<Poit> adList = new ArrayList<Poit>();
	private String username;
	private String password;

	private String isLoginErrorExists="false";
	private String isSignUpErrorExists="false";
	private boolean isValidUser = false;

	private String param; //Encrypted string containing 'Activation Code' and 'Personal Email Id'. Will be fired from the Activation URL sent through email to the user 

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
				
				populateUserPosts(u);
				
				session.put("userInfo", u);
				session.put("userLoggedIn", "Y");
				session.put("username", u.getFirstName());
				if(session.get("LOGIN_FAILED") != null){
					//Called from LoginInterceptor - Post Ad
					session.remove("LOGIN_FAILED"); //Resetting the flag set by Login Interceptor
					return "proceedToPostAd";
				}
				
				//Get Posts for the user
				
				return Action.SUCCESS;
			}catch(CBuddyException e){
				System.out.println(e.getErrorCode());
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
				case CBuddyConstants.USER_PENDING_FOR_ACTIVATION:
					//User not active
					return Action.SUCCESS;
				}
				isLoginErrorExists="true";

				return Action.INPUT;
			}
		}
	}

	private String getFullURL(HttpServletRequest request){
		StringBuffer requestURL = request.getRequestURL();
		//request.getRequestURL() = "http://localhost:8080/Virat/signup" - We have to remove the last token 'signup'

		return requestURL.substring(0, requestURL.lastIndexOf("/"));
	}

	public String signUp(){

		LogUtil.getInstance().info(">>> LoginAction - Signup()");
		try{

			if(!selectedCorpName.equals(corpName)){
				addFieldError("CorpEmailId", "Invalid Company Selected");
				return Action.ERROR;
			}

			AuthenticateUserService auService = new AuthenticateUserService();

			LogUtil.getInstance().info(">>> getFullURL(): " + getFullURL(request));

			User u = auService.registerUser(getModel(), getFullURL(request));

			session.put("userInfo", u);
			session.put("userLoggedIn", "Y");
			session.put("username", u.getFirstName());

			responseMsg = "An activation link has been sent to '" + u.getCorpEmailId() + "'. Please click on the link to activate your account.";

		}catch(CBuddyException e){
			switch(e.getErrorCode()){
			case CBuddyConstants.EXISTENT_USER_ID:
				addFieldError("CorpEmailId",e.getMessage());
				break;
			case CBuddyConstants.DOMAIN_NOT_REGISTERED:
				addFieldError("DomainNotRegistered", e.getMessage());
				break;
			default:
				addFieldError("CorpEmailId", e.getMessage());
				break;
			}

			isSignUpErrorExists="true";

			return Action.ERROR;
		}

		if(session.get("LOGIN_FAILED") != null && session.get("LOGIN_FAILED").equals("Y")){
			/* LOGIN_FAILED flag is set by Login Interceptor.
			 * If the control comes here it means that the user has tried to click Post Ad and the Login Interceptor has
			 * taken the user to the register/login page. The user being new would have clicked on register flow and
			 * have come here.
			 * In this case we should continue the original action - "post ad".
			 */
			session.remove("LOGIN_FAILED");
			return "proceedToPostAd";
		}else{
			/* User has clicked on Sign In in the home page and wants to register.
			 * Take him to sign up confirmation page.
			 */
			return "proceedToSignupConfirmation";
		}
	}

	private void populateUserPosts(User u){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		
		Query query = dbSession.createQuery("from Poit where created_by = :userId");
		query.setParameter("userId", u.getUserId());
		adList = (List<Poit>)query.list();
		
		if(adList != null && adList.size()>0){
			new PostsUtil().populateAdditionalDetailsForPoit(dbSession, adList);	
		}
	}
	
	public String activateUser(){
		try{

			User u = new AuthenticateUserService().activateUser(param);

			populateUserPosts(u);
			
			session.put("userInfo", u);
			session.put("userLoggedIn", "Y");
			session.put("username", u.getFirstName());

		}catch(CBuddyException e){
			addFieldError("email", e.getMessage());
			return Action.INPUT;
		}
		responseMsg = "Your have successfully activated your cBuddy account!";
		return Action.SUCCESS;
	}

	public String resendActivationCode(){
		try{
			new AuthenticateUserService().resendActivationCode(username, getFullURL(request));
			responseMsg = "Activation code has been successfully sent to your email id. Please login and click on the activation link.";
		}catch(CBuddyException e){
			addFieldError("email", e.getMessage());
			return Action.INPUT;
		}
		return Action.SUCCESS;
	}
	
	public String forgotPwd(){
		try{
			new AuthenticateUserService().forgotPwd(getModel(), getFullURL(request));
			responseMsg = "New Password has been successfully sent to your email id.";
		}catch(CBuddyException e){
			addFieldError("PersonalEmailId", e.getMessage());
			return Action.INPUT;
		}
		return Action.SUCCESS;
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
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public List<Poit> getAdList() {
		return adList;
	}
	public void setAdList(List<Poit> adList) {
		this.adList = adList;
	}
}
