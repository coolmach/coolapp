<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="automobileFilter">
<%@include file="/pages/automobile/filters/automobile_SubCategory_Strip.jsp" %>
<%@include file="/pages/automobile/filters/Automobile_Filters.jsp"%>
<%@include file="/pages/automobile/adList/AdList_Automobile.jsp"%>





<script>
$(document).ready(function(){
	applyFilters();
});
</script>

