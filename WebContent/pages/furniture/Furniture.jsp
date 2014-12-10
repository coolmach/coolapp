<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="furnitureFilter">
<input type="hidden" name="user_entered_location" id="user_entered_location" value="<s:property value='%{user_entered_location}'/>">
<%@include file="/pages/furniture/filters/furniture_SubCategory_Strip.jsp" %>
<%@include file="/pages/furniture/filters/Furniture_Filters.jsp"%>
<%@include file="/pages/furniture/adList/AdList_Furniture.jsp"%>

<input type="hidden" name="subCategory" id="subCategory" value="<s:property value='%{subCategory}'/>">  

<script>
$(document).ready(function(){

});
</script>

