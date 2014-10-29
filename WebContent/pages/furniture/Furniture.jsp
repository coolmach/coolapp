<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="furnitureFilter">

<%@include file="/pages/furniture/filters/Furniture_Filters.jsp"%>
<%@include file="/pages/furniture/filters/furniture_SubCategory_Strip.jsp" %>
<%@include file="/pages/furniture/adList/AdList_Furniture.jsp"%>


<script>
$(document).ready(function(){
	applyFilters();
});
</script>

