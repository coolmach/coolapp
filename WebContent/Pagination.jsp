<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	.highlighted_index{font-size:120%; color:rgb(255,127,39);}
	.normal_index{font-size:100%; color:#0099CC;}
</style>
<input type="hidden" name="currentPage" id="currentPage" value="<s:property value='%{currentPage}'/>">
<input type="hidden" name="totalPages" id="totalPages" value="<s:property value='%{totalPages}'/>">
<input type="hidden" name="requestedPage" id="requestedPage" value="<s:property value='%{requestedPage}'/>">

<div style="float:left;">
	<s:if test="%{totalPages > 1}">
		<s:bean name="org.apache.struts2.util.Counter" var="pageCounter">
			<s:param name="last" value="%{totalPages}" />
		</s:bean>
		<div>
			Pages:
			<s:iterator value="#pageCounter">
				<span style="margin-left:5px;" id="pageNo_<s:property/>">
					<a href="#" onclick="return fetchPage('<s:property/>')">
						<s:property />
					</a>
				</span>
			</s:iterator>
		</div>
	</s:if>
</div>

<script>
function fetchPage(pageNo){
	$("#requestedPage").val(pageNo);
	highlightPageIndex(pageNo);
	applyFilters();
	return false;
}
function highlightPageIndex(pageNo){
	$("[id^=pageNo_]").removeClass("highlighted_index");
	$("[id^=pageNo_]").addClass("normal_index");
	$("#pageNo_" + pageNo).removeClass("normal_index");
	$("#pageNo_" + pageNo).addClass("highlighted_index");
}
$(document).ready(function(){
	var requestedPage = $("#requestedPage").val();
	if(requestedPage == "" || requestedPage == "0"){
		requestedPage = "1";
	}
	highlightPageIndex(requestedPage);
});
</script>