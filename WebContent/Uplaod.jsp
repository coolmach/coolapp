<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<s:head />
</head>
 
<body>
<h1>Struts 2 upload multiple files example</h1>
 
<s:form action="dummyUpload" namespace="/" 
method="POST" enctype="multipart/form-data">
 
<s:file label="File 1" name="upload" size="40" />
<s:file label="File 2" name="upload" size="40" />
<s:file label="FIle 2" name="upload" size="40" />
 
<s:submit value="submit" name="submit" />
 
</s:form>
 
</body>
</html>
