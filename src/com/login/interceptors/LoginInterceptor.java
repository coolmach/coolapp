package com.login.interceptors;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import com.model.user.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {
 
 public void init() {
  System.out.println("LoginInterceptor.init()");
 }
 
 public void destroy() {
	 System.out.println("LoginInterceptor.destroy()");
 }
 
 public String intercept(ActionInvocation invocation) throws Exception {
 
	 Map<String,Object> session = invocation.getInvocationContext().getSession(); 
     User user = (User) session.get("user");
     System.out.println("LoginInterceptor.intercept()"+user);
     if(user == null){
    	 return ActionSupport.LOGIN;
     }
     return invocation.invoke();
 
 }
 
}