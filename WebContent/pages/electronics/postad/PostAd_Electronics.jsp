<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="subCategory == 1">
	<%@include file="PostAd_Electronics_Television.jsp" %>
</s:if>
<s:elseif test="subCategory == 2">
	<%@include file="PostAd_Electronics_DVD.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 3">
	<%@include file="PostAd_Electronics_Camera.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 4">
	<%@include file="PostAd_Electronics_Fridge.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 5">
	<%@include file="PostAd_Electronics_AirCooler.jsp" %>
</s:elseif>
<s:elseif test="subCategory == 6">
	<%@include file="PostAd_Electronics_WashingMachine.jsp" %>
</s:elseif>
<s:else>
	<%@include file="PostAd_Others.jsp" %>
</s:else>

<script type="text/javascript" src="js/autocomplete.js"></script>