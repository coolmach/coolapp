<div class="paginate col-md-8" >
	<ul class="pager">
		<li class="previous hidden"><a id="page_prev" href="#">Previous</a>
		</li>
		<li><input id="page_info" type="hidden" readonly="readonly"
			value="Showing Page <s:property value="%{(count>0)?page:0}"/> of <s:property 
			value="%{(count<=10 && count>0)?1:(((count%10)==0)?count/10:((count/10))+1)}"/>" />
		</li>

		<s:if test="%{count>10}">
			<li class="next"><a id="page_next" href="#">Next</a></li>
		</s:if>
	</ul>
</div>