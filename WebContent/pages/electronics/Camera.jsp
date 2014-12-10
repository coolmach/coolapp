<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="cameraFilter">
<input type="hidden" name="user_entered_location" id="user_entered_location" value="<s:property value='%{user_entered_location}'/>">
<%@include file="/pages/electronics/filters/electronics_SubCategory_Strip.jsp" %>
<%@include file="/pages/electronics/filters/Camera_Filters.jsp"%>
<s:if test="plt == \"D\"">
	<%@include file="/pages/electronics/details/AdDetails_Camera.jsp"%>
</s:if>
<input type="hidden" name="subCategory" id="subCategory" value="<s:property value='%{subCategory}'/>">  
<s:else>
	<%@include file="/pages/electronics/adList/AdList_Camera.jsp"%>
</s:else>


<script>
$(document).ready(function(){

});
</script>
