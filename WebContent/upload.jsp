<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Multiple Files Upload with Struts2</title>
</head>
<body>
    <center>
        <h2>Pick multiple files to upload</h2>
        <s:form action="uploadFile" enctype="multipart/form-data" method="post">
            <s:file name="fileUpload" label="Pick file #1" size="30"/>
            <s:file name="fileUpload" label="Pick file #2" size="30"/>
            <s:file name="fileUpload" label="Pick file #3" size="30"/>
            <br/>
            <s:submit value="Upload All" />
        </s:form>
    </center>
</body>
</html>