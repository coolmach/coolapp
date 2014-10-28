<%@ taglib prefix="s" uri="/struts-tags"%>
<span id="postId" class="hidden"><s:property value="%{#action.model.postId}"/></span>
<s:if test="subCategory == 1">
	<%@include file="AdDetails_Computers_Desktops.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="AdDetails_Computers_Laptops.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 3">
	<%@include file="AdDetails_Computers_Tablets.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 4">
	<%@include file="AdDetails_Computers_Accessories.jsp" %>
</s:elseif>
<script type="text/javascript" src="js/autocomplete.js"></script>