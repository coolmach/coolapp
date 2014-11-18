<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="cameraFilter">

<%@include file="/pages/electronics/filters/electronics_SubCategory_Strip.jsp" %>
<%@include file="/pages/electronics/filters/Camera_Filters.jsp"%>
<s:if test="plt == \"D\"">
	<%@include file="/pages/electronics/details/AdDetails_Camera.jsp"%>
</s:if>
<s:else>
	<%@include file="/pages/electronics/adList/AdList_Camera.jsp"%>
</s:else>


<script>
$(document).ready(function(){
	applyFilters();
});
</script>
