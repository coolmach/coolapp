<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>Showcase - fileupload - multiple fileupload using List</title>
</head>
<body>

<s:form action="dummyUpload" method="POST" enctype="multipart/form-data">
	<s:file label="File 1" name="fileUpload" size="40" />
<s:file label="File 2" name="fileUpload" size="40" />
<s:file label="FIle 2" name="fileUpload" size="40" /> 
	<s:submit />
</s:form>

</body>
</html>