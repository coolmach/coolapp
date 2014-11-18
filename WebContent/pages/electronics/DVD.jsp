<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="dvdFilter">

<%@include file="/pages/electronics/filters/electronics_SubCategory_Strip.jsp" %>
<%@include file="/pages/electronics/filters/DVD_Filters.jsp"%>
<%@include file="/pages/electronics/adList/AdList_DVD.jsp"%>


<script>
$(document).ready(function(){
	applyFilters();
});
</script>
