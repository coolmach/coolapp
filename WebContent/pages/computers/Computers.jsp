<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="action" id="action" value="computersFilter">
<input type="hidden" name="user_entered_location" id="user_entered_location" value="<s:property value='%{user_entered_location}'/>">
<%@include file="/pages/computers/filters/computers_SubCategory_Strip.jsp" %>
<%@include file="/pages/computers/filters/Computers_Filters.jsp"%>
<%@include file="/pages/computers/adList/AdList_Computers.jsp"%>

<input type="hidden" name="subCategory" id="subCategory" value="<s:property value='%{subCategory}'/>">  



<script>
$(document).ready(function(){

});
</script>
