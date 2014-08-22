package com.cbuddy.interceptors;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.cbuddy.user.action.LoginAction;
import com.cbuddy.user.model.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor implements ServletRequestAware{

	private static final long serialVersionUID = 5934557559084272884L;

	private String originalURL;

	private String savedUrl="signIn";
	
	public String getSavedUrl(){
	    return savedUrl;
	}
	
	public void init() {
		System.out.println("LoginInterceptor.init()");
	}

	public void destroy() {
		System.out.println("LoginInterceptor.destroy()");
	}

	HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}
	
	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public String intercept(ActionInvocation invocation) throws Exception {

		Map<String,Object> session = invocation.getInvocationContext().getSession(); 
		User user = (User) session.get("userInfo");

		if(user == null){
			session.put("LOGIN_FAILED", "Y");
			HttpServletRequest request = ServletActionContext.getRequest();
			String queryString = request.getQueryString();
			String path = request.getRequestURI().substring(request.getContextPath().length());
			session.put("savedUrl", path+(queryString==null?"":("?"+queryString))); 
			savedUrl = path+(queryString==null?"":("?"+queryString));
			return ActionSupport.LOGIN;
		}else{
			return invocation.invoke();
		}
		
	}

	/*public final String interceptlll(final ActionInvocation invocation) throws Exception {
		// before save original url
		Map session = invocation.getInvocationContext().getSession();
		Object action = invocation.getAction();

		User user = (User) session.get("userInfo");
		System.out.println("LoginInterceptor.intercept()"+user);

		HttpServletRequest request = ServletActionContext.getRequest();

		if (!(action instanceof LoginAction)){ 
			String queryString = request.getQueryString();
			session.put("savedUrl", request.getRequestURI() + (queryString==null?"":("?"+queryString)));
		} else {
			return invocation.invoke();
		}

		if (user == null) { //return false if not authenticated
			session.put("isLogin", true);
			return Action.LOGIN;
		} else {
			originalURL = (String) session.get("savedUrl");
			boolean isLogin = (Boolean)session.get("isLogin");
			if (originalURL != null && !originalURL.equals("") && isLogin) {
				session.put("isLogin", false); 
				return "redirect";
			}
			return invocation.invoke();
		}
	}

	public String getOriginalURL() {
		return originalURL;
	}

	public void setOriginalURL(String originalURL) {
		this.originalURL = originalURL;
	}*/

}