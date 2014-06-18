<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="subCategory == 1">
	<%@include file="PostAd_Automobile_Cars.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="PostAd_Automobile_Bikes.jsp" %>
</s:elseif>
<s:else>
	<%@include file="PostAd_Automobile_Cars.jsp" %>
</s:else>

