<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="realestateFilter">

<%@include file="/pages/realestate/filters/RealEstate_Filters.jsp"%>

<%@include file="/pages/realestate/adList/AdList_RealEstate.jsp"%>

<%@include file="/pages/realestate/filters/realestate_SubCategory_Strip.jsp" %>



<script>
$(document).ready(function(){
	applyFilters();
});
</script>