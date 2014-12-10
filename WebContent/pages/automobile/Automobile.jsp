<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="automobileFilter">
<input type="hidden" name="user_entered_location" id="user_entered_location" value="<s:property value='%{user_entered_location}'/>">
<%@include file="/pages/automobile/filters/automobile_SubCategory_Strip.jsp" %>
<%@include file="/pages/automobile/filters/Automobile_Filters.jsp"%>
<%@include file="/pages/automobile/adList/AdList_Automobile.jsp"%>

<input type="hidden" name="subCategory" id="subCategory" value="<s:property value='%{subCategory}'/>">  


<script>
$(document).ready(function(){

});
</script>

