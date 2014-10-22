<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="airCoolerFilter">

<%@include file="/pages/electronics/filters/AirCooler_Filters.jsp"%>
<%@include file="/pages/electronics/filters/electronics_SubCategory_Strip.jsp" %>
<%@include file="/pages/electronics/adList/AdList_AirCooler.jsp"%>


<script>
$(document).ready(function(){
	applyFilters();
});
</script>
