<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="mobilesFilter">
<input type="hidden" name="user_entered_location" id="user_entered_location" value="<s:property value='%{user_entered_location}'/>">
<%@include file="/pages/mobiles/filters/mobile_SubCategory_Strip.jsp" %>
<%@include file="/pages/mobiles/filters/Mobiles_Filters.jsp"%>
<%@include file="/pages/mobiles/adList/AdList_Mobiles.jsp"%>

<input type="hidden" name="subCategory" id="subCategory" value="<s:property value='%{subCategory}'/>">  



<script>
$(document).ready(function(){

});
</script>

