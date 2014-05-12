<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- <%@ taglib prefix="sx" uri="/struts-dojo-tags"%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<s:head/>
<%-- <sx:head cache="false" compressed="false"/> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/jquery-ui.js"></script> 
<%-- <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>  --%>
<script type="text/javascript" src="js/bootstrap.js"></script> 
<script type="text/javascript" src="js/home.js"></script> 
<%-- <script type="text/javascript" src="js/grayscale.js"></script>  --%>
<script type="text/javascript" src="js/jquery.validate.js"></script>  
<!-- <link rel="stylesheet" href="css/bootstrapValidator.css" type="text/css"> -->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css">
<!-- <link rel="stylesheet" href="css/grayscale.css" type="text/css"> -->
<link rel="stylesheet" href="css/home.css" type="text/css"> 
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="container-fluid" >
  <div class="row" id="login_top">
  <tiles:insertAttribute name="header" />
  </div>
    <div class="row main"> 
  <tiles:insertAttribute name="body" />
  <tiles:insertAttribute name="menu" />
  </div>
  <!-- <div class="row footer_2"></div> -->
  <div class="row ">
  <tiles:insertAttribute name="footer" />
  </div>
  
</div>
</body>
</html>