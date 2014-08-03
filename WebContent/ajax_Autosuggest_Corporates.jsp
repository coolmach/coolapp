<%@page import="com.opensymphony.xwork2.ognl.OgnlValueStack"%>
<%@page import="com.cbuddy.user.action.CorpAction"%>
<%@ page import="java.util.List"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>

<%
	response.setHeader("Pragma", "No-Cache");
	response.setDateHeader("Expires", 0);
	response.setContentType("application/json");
	response.setHeader("Cache-Control", "no-Cache");

	OgnlValueStack stack = (OgnlValueStack) request.getAttribute("struts.valueStack");

	CorpAction action = (CorpAction) stack.findValue("action");

	JSONArray arr = action.getJsonArray();
	
	System.out.println(arr);

	out.println(arr);
%>
