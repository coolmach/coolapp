<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>

<s:head />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><tiles:insertAttribute name="title" /></title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="js/autocomplete.js"></script>
<script type="text/javascript" src="js/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/home.js"></script>
<script type="text/javascript" src="js/home_plain.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script src="js/jquery.simplemodal.js"></script>
<script type="text/javascript" src="js/Cbuddy.js"></script>

<link rel="stylesheet" href="css/Cbuddy.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="css/jasny-bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/home.css" type="text/css">
<link rel="stylesheet" href="css/home_plain.css" type="text/css">
<link rel="stylesheet" href="css/MyHome.css" type="text/css">
<link rel="stylesheet" type="text/css" href="css/postAd.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.simplemodal.css" />
<link rel="stylesheet" type="text/css" href="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" />

<link rel="shortcut icon" href="images/common/favicon.png" type="image/png">

</head>
<body>
	<input type="hidden" id="context_path" value='<%=request.getContextPath()%>  ' />
    <div id="wrap">
		<tiles:insertAttribute name="header" />
		<div id="content">
			<div class="container_of_imgs">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
	
</body>
</html>