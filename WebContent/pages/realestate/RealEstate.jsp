<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="realestateFilter">
<input type="hidden" name="user_entered_location" id="user_entered_location" value="<s:property value='%{user_entered_location}'/>">
<%@include file="/pages/realestate/filters/realestate_SubCategory_Strip.jsp" %>
<%@include file="/pages/realestate/filters/RealEstate_Filters.jsp"%>
<%@include file="/pages/realestate/adList/AdList_RealEstate.jsp"%>





<script>
$(document).ready(function(){

});
</script>