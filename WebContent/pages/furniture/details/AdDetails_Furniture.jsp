<%@ taglib prefix="s" uri="/struts-tags"%>
<span id="postId" class="hidden"><s:property value="postDetails.postId"/></span>

<%@include file="AdDetails_Furniture_Default.jsp" %>

<script type="text/javascript" src="js/autocomplete.js"></script>

<script>
$(document).ready(function(){
	$("#backToResultsButton").bind("click", function(){
		applyFilters();
		return false;
	});
});
</script>
