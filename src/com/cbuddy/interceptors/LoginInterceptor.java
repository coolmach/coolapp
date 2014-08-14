package com.cbuddy.interceptors;

import java.util.Map;

import com.cbuddy.user.model.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 5934557559084272884L;

	public void init() {
		System.out.println("LoginInterceptor.init()");
	}

	public void destroy() {
		System.out.println("LoginInterceptor.destroy()");
	}

	public String intercept(ActionInvocation invocation) throws Exception {

		Map<String,Object> session = invocation.getInvocationContext().getSession(); 
		User user = (User) session.get("userInfo");
		System.out.println("LoginInterceptor.intercept()"+user);
		if(user == null){
			session.put("LOGIN_FAILED", "Y");
			return ActionSupport.LOGIN;
		}
		return invocation.invoke();

	}

}