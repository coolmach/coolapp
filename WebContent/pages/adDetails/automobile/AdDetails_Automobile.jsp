<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="subCategory == 1">
	<%@include file="AdDetails_Automobile_Cars.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="AdDetails_Automobile_Bikes.jsp" %>
</s:elseif>

<script type="text/javascript" src="js/autocomplete.js"></script>