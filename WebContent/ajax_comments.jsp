<%@ taglib prefix="s" uri="/struts-tags"%>
<s:iterator value="cmList" var="item">
	    <div style="border-bottom: 1px solid;margin-bottom: 11px;">
		<div style="background-color: gainsboro;"><s:property value="%{#item.comment}" /></div>
		<s:date name="%{#item.modifiedDate}" format="dd/MM/yyyy" />
		<s:iterator value="childComment" var="child">
			<div style="margin-left:12px;">
				<s:property value="%{#child.comment}" />
			</div>
			<div style="margin-left:12px;"><s:date name="%{#child.modifiedDate}" format="dd/MM/yyyy" /></div>
		</s:iterator>
		<a id="post_childCmt_<s:property value="%{#item.commentId}" />" href="#" class="">reply</a>
		<div style="display:none;" id="childCmt-div">
		    <textarea required="required" id="childCmtArea_<s:property value="%{#item.commentId}" />" class="form-control" rows="3" ></textarea>
		     <button id="cmt_close_<s:property value="%{#item.commentId}" />" type="button" class="btn btn-default">Close</button>
		     <button id="post_child_cmt_<s:property value="%{#item.commentId}" />" type="button" class="btn btn-default">Post</button>
		</div>
	</div>
</s:iterator>
