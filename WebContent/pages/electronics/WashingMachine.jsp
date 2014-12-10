<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="washingMachineFilter">
<input type="hidden" name="user_entered_location" id="user_entered_location" value="<s:property value='%{user_entered_location}'/>">
<%@include file="/pages/electronics/filters/electronics_SubCategory_Strip.jsp" %>
<%@include file="/pages/electronics/filters/WashingMachine_Filters.jsp"%>
<%@include file="/pages/electronics/adList/AdList_WashingMachine.jsp"%>

<input type="hidden" name="subCategory" id="subCategory" value="<s:property value='%{subCategory}'/>">  

<script>
$(document).ready(function(){

});
</script>
