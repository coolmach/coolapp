<%@ taglib prefix="s" uri="/struts-tags"%>
<s:iterator value="cmList" var="item">
	    <div style="border-bottom: 1px solid;margin-bottom: 11px;">
		<div style="background-color: gainsboro;"><s:property value="%{#item.comment}" /></div>
		<s:property value="%{#item.modifiedDate}" />
		
		<s:iterator value="childComment" var="child">
			<div style="margin-left:12px;">
				<s:property value="%{#child.comment}" />
			</div>
			<div style="margin-left:12px;"><s:property value="%{#item.modifiedDate}" /></div>
		</s:iterator>
	</div>
</s:iterator>
