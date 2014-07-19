<div class="paginate col-md-6" style="margin-left: 5%;">
	<ul class="pager">
		<li class="previous hidden"><a id="page_prev" href="#">Previous</a>
		</li>
		<li><input id="page_info" type="text" readonly="readonly"
			value="Showing Page <s:property value="page"/> of <s:property value="%{(count<10)?1:count/10}"/>" />
		</li>
		<s:if test="%{count>10}">
			<li class="next"><a id="page_next" href="#">Next</a>
			</li>
		</s:if>
	</ul>
</div>