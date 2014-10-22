<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="fridgeFilter">

<%@include file="/pages/electronics/filters/Fridge_Filters.jsp"%>
<%@include file="/pages/electronics/filters/electronics_SubCategory_Strip.jsp" %>
<%@include file="/pages/electronics/adList/AdList_Fridge.jsp"%>


<script>
$(document).ready(function(){
	applyFilters();
});
</script>
