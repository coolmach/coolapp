
<div id="right_LocationFilterSection">

	<div class="form-group">
		<div class="col-sm-12" id="electronicsSubCategorySection">
			<h4>Categories</h4>
			<ul>
				<s:url action="automobile" var="urlTag1" escapeAmp="false"><s:param name="subCategory">1</s:param></s:url>
				<s:url action="automobile" var="urlTag2" escapeAmp="false"><s:param name="subCategory">2</s:param></s:url>
				<li><a href="<s:property value="#urlTag1" />">Cars</a></li>
				<li><a href="<s:property value="#urlTag2" />">Bikes</a></li>
			</ul>
		</div>
	</div>	

	<%@include file="location_And_Corporate_Strip.jsp" %>
</div>

