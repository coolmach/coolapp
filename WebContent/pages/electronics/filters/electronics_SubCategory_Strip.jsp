<%-- <div id="right_LocationFilterSection">
	<div class="form-group" id="subCategory-right">
		<div id="" class="" style="position: relative;">
			<h4>Categories</h4>
			<ul class="list-unstyled">
			       <!--  <li value="0"><span class="content">All</span></li> -->
				    <li value="1"><span class="content">Televisions</span><span class="filter hidden">/televisionFilter</span></li>
					<li value="2"><span class="content">Digital Cameras, Camcorders</span><span class="filter hidden">/cameraFilter</span></li>
					<li value="3"><span class="content">Refrigerators</span><span class="filter hidden">/fridgeFilter</span></li>
					<li value="4"><span class="content">Air Coolers, Air Conditioners</span><span class="filter hidden">/airCoolerFilter</span></li>
					<li value="5"><span class="content">Washing Machines</span><span class="filter hidden">/washingMachineFilter</span></li>
					<li value="6"><span class="content">DVD Players, Music Players, iPods</span><span class="filter hidden">/dvdFilter</span></li>
			</ul>
		</div>
	</div>
	<%@include file="/location_And_Corporate_Strip.jsp"%>
</div>
 --%>

 <div id="right_LocationFilterSection" class="col-md-3">
		<div class="form-group" id="electronics_right">
		<div id="" class="" style="position: relative;">
			<div class="heading">
			<h4><a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_ul">
          Categories
                 <span class="glyphicon glyphicon-chevron-down"></span>
               </a>
             </h4>
        </div>
			<ul class="list-unstyled collapse in"" id="collapse_ul" style="margin-left:10px;">
			    <s:url action="electronics" var="urlTag0" escapeAmp="false"><s:param name="category">ALL</s:param></s:url>
				<s:url action="television" var="urlTag1" escapeAmp="false"><s:param name="category">TV</s:param></s:url>
				<s:url action="camera" var="urlTag2" escapeAmp="false"><s:param name="category">CAMERA</s:param></s:url>
				<s:url action="fridge" var="urlTag3" escapeAmp="false"><s:param name="category">FRIDGE</s:param></s:url>
				<s:url action="airCooler" var="urlTag4" escapeAmp="false"><s:param name="category">AC</s:param></s:url>
				<s:url action="washingMachine" var="urlTag5" escapeAmp="false"><s:param name="category">WASHING_MACHINE</s:param></s:url>
				<s:url action="dvd" var="urlTag6" escapeAmp="false"><s:param name="category">DVD</s:param></s:url>
				
				<li><a href="<s:property value="#urlTag0" />">All</a></li>
				<li><a href="<s:property value="#urlTag1" />">Televisions</a></li>
				<li><a href="<s:property value="#urlTag2" />">Digital Cameras, Camcorders</a></li>
				<li><a href="<s:property value="#urlTag3" />">Refrigerators</a></li>
				<li><a href="<s:property value="#urlTag4" />">Air Coolers, Air Conditioners</a></li>
				<li><a href="<s:property value="#urlTag5" />">Washing Machines</a></li>
				<li><a href="<s:property value="#urlTag6" />">DVD Players, Music Players, iPods</a></li>
			</ul>
		</div>	
        </div>
	<%@include file="/location_And_Corporate_Strip.jsp" %>
</div> 

