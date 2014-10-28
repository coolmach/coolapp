<%@ taglib prefix="s" uri="/struts-tags"%>
<span id="postId" class="hidden"><s:property value="postDetails.postId"/></span>

<s:if test="subCategory == 1">
	<%@include file="AdDetails_Furniture_Default.jsp" %>
</s:if>

<script type="text/javascript" src="js/autocomplete.js"></script>

<script>
$(document).ready(function(){
	$("#backToResultsButton").bind("click", function(){
		applyFilters();
		return false;
	});
});
</script>
