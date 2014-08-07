<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="subCategory == 1">
	<%@include file="PostAd_Mobile_MobilePhones.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="PostAd_Mobile_Accessories.jsp" %>
</s:elseif>
<s:else>
	<%@include file="PostAd_Mobile_MobilePhones.jsp" %>
</s:else>

<script type="text/javascript" src="js/autocomplete.js"></script>