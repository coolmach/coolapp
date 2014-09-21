<s:if test="%{furnished == \"F\" || furnished == \"S\"}">
	<s:if test="#counter < 3">
		<s:if test="#counter > 0">
			<span class="separator">|</span>
		</s:if>
		<s:set var="counter" value="%{#counter+1}"/>
		<span class="postField"><s:property value="furnishedStr" /></span>
	</s:if>
</s:if>
<s:if test="%{maintenance != 0}">
	<s:if test="#counter < 3">	
		<s:if test="#counter > 0">
			<span class="separator">|</span>
		</s:if>
		<s:set var="counter" value="%{#counter+1}"/>
		<span class="postField">Maintenance:&nbsp;<s:property value="maintenanceStr" /> </span>
	</s:if>
</s:if>
<s:if test="%{carParking == \"Y\"}">
	<s:if test="#counter < 3">
		<s:if test="#counter > 0">
			<span class="separator">|</span>
		</s:if>
		<s:set var="counter" value="%{#counter+1}"/>
		<span class="postField">Car&nbsp;Parking</span>
	</s:if>
</s:if>
<s:if test="%{powerBackup == \"Y\"}">
	<s:if test="#counter < 3">
		<s:if test="#counter > 0">
			<span class="separator">|</span>
		</s:if>
		<s:set var="counter" value="%{#counter+1}"/>
		<span class="postField">Power&nbsp;Backup</span>
	</s:if>
</s:if>
<s:if test="%{childrenPlayArea == \"Y\"}">
	<s:if test="#counter < 3">
		<s:if test="#counter > 0">
			<span class="separator">|</span>
		</s:if>
		<s:set var="counter" value="%{#counter+1}"/>
		<span class="postField">Children&nbsp;Play&nbsp;Area</span>
	</s:if>
</s:if>
<s:if test="%{gym == \"N\"}">
	<s:if test="#counter < 3">
		<s:if test="#counter > 0">
			<span class="separator">|</span>
		</s:if>
		<s:set var="counter" value="%{#counter+1}"/>
		<span class="postField">Gym</span>
	</s:if>
</s:if>
	