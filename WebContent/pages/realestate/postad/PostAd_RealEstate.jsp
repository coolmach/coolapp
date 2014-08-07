<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="subCategory == 1">
	<%@include file="PostAd_RealEstate_Apartment_For_Sale.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="PostAd_RealEstate_Apartment_For_Rent.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 3">
	<%@include file="PostAd_RealEstate_Ind_House_For_Sale.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 4">
	<%@include file="PostAd_RealEstate_Ind_House_For_Rent.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 6">
	<%@include file="PostAd_RealEstate_Land_For_Sale.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 5">
	<%@include file="PostAd_RealEstate_PG_Accommodation.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 7">
	<%@include file="PostAd_RealEstate_Roommate_Required.jsp" %>
</s:elseif>
<s:else>
	<%@include file="PostAd_RealEstate_Apartment_For_Rent.jsp" %>
</s:else>

<script type="text/javascript" src="js/autocomplete.js"></script>