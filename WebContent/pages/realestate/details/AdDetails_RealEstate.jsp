<%@ taglib prefix="s" uri="/struts-tags"%>
<span id="postId" class="hidden"><s:property value="postDetails.postId"/></span>

<s:if test="subCategory == 1">
	<%@include file="AdDetails_RealEstate_Apartment_For_Sale.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="AdDetails_RealEstate_Apartment_For_Rent.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 3">
	<%@include file="AdDetails_RealEstate_Ind_House_For_Sale.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 4">
	<%@include file="AdDetails_RealEstate_Ind_House_For_Rent.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 6">
	<%@include file="AdDetails_RealEstate_Land_For_Sale.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 5">
	<%@include file="AdDetails_RealEstate_PG_Accommodation.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 7">
	<%@include file="AdDetails_RealEstate_Roommate_Required.jsp" %>
</s:elseif>
<s:else>
	<%@include file="AdDetails_RealEstate_Apartment_For_Rent.jsp" %>
</s:else>

<input type="hidden" name="currentPage" id="currentPage" value="<s:property value='%{currentPage}'/>">
<input type="hidden" name="totalPages" id="totalPages" value="<s:property value='%{totalPages}'/>">
<input type="hidden" name="requestedPage" id="requestedPage" value="">

<script type="text/javascript" src="js/autocomplete.js"></script>

<script>
$(document).ready(function(){
	$("#backToResultsButton").bind("click", function(){
		applyFilters();
		return false;
	});
});
</script>