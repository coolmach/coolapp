<%@page import="com.opensymphony.xwork2.ognl.OgnlValueStack"%>
<%@page import="com.cbuddy.common.action.LocationAction"%>
<%@ page import="java.util.List"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>

<%
	response.setHeader("Pragma", "No-Cache");
	response.setDateHeader("Expires", 0);
	response.setContentType("application/json");
	response.setHeader("Cache-Control", "no-Cache");

	OgnlValueStack stack = (OgnlValueStack) request.getAttribute("struts.valueStack");

	LocationAction action = (LocationAction) stack.findValue("action");

	JSONArray arr = action.getJsonArray();

	out.println(arr);
%>
