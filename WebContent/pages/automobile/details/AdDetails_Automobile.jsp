<%@ taglib prefix="s" uri="/struts-tags"%>
<span id="postId" class="hidden"><s:property value="%{#action.model.postId}"/></span>
<s:if test="subCategory == 1">
	<%@include file="AdDetails_Automobile_Cars.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="AdDetails_Automobile_Bikes.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 3">
	<%@include file="AdDetails_Automobile_Cycles.jsp" %>
</s:elseif>
<script type="text/javascript" src="js/autocomplete.js"></script>

<script>
$(document).ready(function(){
	$("#backToResultsButton").bind("click", function(){
		applyFilters();
		return false;
	});
});
</script>