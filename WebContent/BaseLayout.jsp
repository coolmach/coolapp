<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<script type="text/javascript" src="js/bootstrap.js"></script> 
<script type="text/javascript" src="js/home.js"></script> 
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/home.css" type="text/css"> 
</head>
<body>
<div class="container-fluid">
  <div class="row-fluid">
  <tiles:insertAttribute name="header" />
  </div>
  <div class="row-fluid header_2"></div>
  <div class="row-fluid">
  <tiles:insertAttribute name="body" />
  </div>
  <div class="row-fluid">
  <tiles:insertAttribute name="footer" />
  </div>
  
</div>
</body>
</html>