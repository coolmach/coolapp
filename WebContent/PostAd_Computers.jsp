<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="subCategory == 1">
	<%@include file="PostAd_Computers_Desktop.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="PostAd_Computers_Laptop.jsp" %>
</s:elseif>
<s:else>
	<%@include file="PostAd_Computers_Tab.jsp" %>
</s:else>

