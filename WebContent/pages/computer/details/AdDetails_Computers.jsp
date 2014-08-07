<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="subCategory == 1">
	<%@include file="AdDetails_Computers_Desktop.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="AdDetails_Computers_Laptop.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 3">
	<%@include file="AdDetails_Computers_Tablet.jsp" %>
</s:elseif>
<s:else>
	<%@include file="AdDetails_Computers_Desktop.jsp" %>
</s:else>

<script type="text/javascript" src="js/autocomplete.js"></script>