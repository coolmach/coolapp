<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="computersFilter">

<%@include file="/pages/computers/filters/computers_SubCategory_Strip.jsp" %>
<%@include file="/pages/computers/filters/Computers_Filters.jsp"%>
<%@include file="/pages/computers/adList/AdList_Computers.jsp"%>





<script>
$(document).ready(function(){
	applyFilters();
});
</script>
