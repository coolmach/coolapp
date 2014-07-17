
<div id="right_LocationFilterSection">

	<div class="form-group">
		<div class="col-sm-12" id="electronicsSubCategorySection">
			<h4>Categories</h4>
			<ul>
				<s:url action="television" var="urlTag1" escapeAmp="false"><s:param name="category">TV</s:param></s:url>
				<s:url action="camera" var="urlTag2" escapeAmp="false"><s:param name="category">CAMERA</s:param></s:url>
				<s:url action="fridge" var="urlTag3" escapeAmp="false"><s:param name="category">FRIDGE</s:param></s:url>
				<s:url action="airCooler" var="urlTag4" escapeAmp="false"><s:param name="category">AC</s:param></s:url>
				<s:url action="washingMachine" var="urlTag5" escapeAmp="false"><s:param name="category">WASHING_MACHINE</s:param></s:url>
				<s:url action="dvd" var="urlTag6" escapeAmp="false"><s:param name="category">DVD</s:param></s:url>
				
				<li><a href="<s:property value="#urlTag1" />">Televisions</a></li>
				<li><a href="<s:property value="#urlTag2" />">Digital Cameras, Camcorders</a></li>
				<li><a href="<s:property value="#urlTag3" />">Refrigerators</a></li>
				<li><a href="<s:property value="#urlTag4" />">Air Coolers, Air Conditioners</a></li>
				<li><a href="<s:property value="#urlTag5" />">Washing Machines</a></li>
				<li><a href="<s:property value="#urlTag6" />">DVD Players, Music Players, iPods</a></li>
			</ul>
		</div>
	</div>	

	<%@include file="location_And_Corporate_Strip.jsp" %>
</div>

