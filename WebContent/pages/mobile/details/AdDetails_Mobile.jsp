<%@ taglib prefix="s" uri="/struts-tags"%>
<span id="postId" class="hidden"><s:property value="%{#action.model.postId}"/></span>
<s:if test="subCategory == 1">
	<%@include file="AdDetails_Mobile_MobilePhones.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="AdDetails_Mobile_Accessories.jsp" %>
</s:elseif>
<s:else>
	<%@include file="AdDetails_Mobile_MobilePhones.jsp" %>
</s:else>

<script type="text/javascript" src="js/autocomplete.js"></script>