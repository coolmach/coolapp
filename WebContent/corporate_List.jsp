<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="js/Cbuddy.js"></script>		
<div id="corporateDetails">
	<s:if test="selectedCorporate != null">
	<div id="corporateListBar">
		<div id="corporateResultSection">
			<div class="checkboxColumn"><input type="checkbox" class="check_corpId checkBox" name="corpId" id="corpId" value="${selectedCorporate.name}"></div>
			<div class="checkboxCaptionColumn"><span class="radioCaptionWithoutSpace">${selectedCorporate.value}</span></div>
		</div>
		<div id="clearSection">
			<a class="smallLink" onClick="resetCorporateFilter()">Clear Filter</a>
		</div>
	</div>
	</s:if>
</div>
