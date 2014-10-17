<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="commonElectronicsFilter">

<%@include file="/pages/electronics/filters/Electronics_Filters.jsp"%>
<%@include file="/pages/electronics/filters/electronics_SubCategory_Strip.jsp" %>
<%@include file="/pages/electronics/adList/AdList_Common.jsp"%>



<script>
$(document).ready(function(){
	applyFilters();
});
</script>

