<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="mobilesFilter">

<%@include file="/pages/others/filters/Others_Filters.jsp"%>
<%@include file="/pages/others/filters/others_SubCategory_Strip.jsp" %>
<%@include file="/pages/others/adList/AdList_Others.jsp"%>





<script>
$(document).ready(function(){
	applyFilters();
});
</script>

