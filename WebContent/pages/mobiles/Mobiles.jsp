<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="mobilesFilter">

<%@include file="/pages/mobiles/filters/Mobiles_Filters.jsp"%>
<%@include file="/pages/mobiles/filters/mobile_SubCategory_Strip.jsp" %>
<%@include file="/pages/mobiles/adList/AdList_Mobiles.jsp"%>





<script>
$(document).ready(function(){
	applyFilters();
});
</script>

