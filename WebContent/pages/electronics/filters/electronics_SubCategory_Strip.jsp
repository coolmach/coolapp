<%@ taglib prefix="s" uri="/struts-tags"%>

	<s:url action="television" var="url_TELEVISION" escapeAmp="false"><s:param name="category">ELEC</s:param><s:param name="subCategory">1</s:param></s:url>
	<s:url action="dvd" var="url_DVD" escapeAmp="false"><s:param name="category">ELEC</s:param><s:param name="subCategory">2</s:param></s:url>
	<s:url action="camera" var="url_CAMERA" escapeAmp="false"><s:param name="category">ELEC</s:param><s:param name="subCategory">3</s:param></s:url>
	<s:url action="fridge" var="url_FRIDGE" escapeAmp="false"><s:param name="category">ELEC</s:param><s:param name="subCategory">4</s:param></s:url>
	<s:url action="washingMachine" var="url_WASHINGMACHINE" escapeAmp="false"><s:param name="category">ELEC</s:param><s:param name="subCategory">5</s:param></s:url>
	<s:url action="airCooler" var="url_AIRCOOLER" escapeAmp="false"><s:param name="category">ELEC</s:param><s:param name="subCategory">6</s:param></s:url>


<div id="right_LocationFilterSection" class="col-md-3">
	<%@include file="/location_And_Corporate_Strip.jsp"%>
	<div style="margin-top:5px;">&nbsp;</div>
	<div class="form-group" id="subCategory-right-electronics">
		<div id="" class="" style="position: relative;">
		<div class="heading" style="padding-top:10px;">
			<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_ul">
          			Categories
                 <span class="glyphicon glyphicon-chevron-down"></span>
            </a>
        </div>
		<ul class="list-unstyled collapse in" id="collapse_ul" style="padding:10px;">
		    <li value="1"><span class="content"><a href='<s:property value="#url_TELEVISION"/>'>Television</a></span></li>
			<li value="2"><span class="content"><a href='<s:property value="#url_DVD"/>'>DVD / Music Players / iPod</a></span></li>
			<li value="3"><span class="content"><a href='<s:property value="#url_CAMERA"/>'>Cameras, Camcorders</a></span></li>
			<li value="4"><span class="content"><a href='<s:property value="#url_FRIDGE"/>'>Fridge</a></span></li>
			<li value="5"><span class="content"><a href='<s:property value="#url_WASHINGMACHINE"/>'>Washing Machines</a></span></li>
			<li value="6"><span class="content"><a href='<s:property value="#url_AIRCOOLER"/>'>Air Coolers, Air Conditioners</a></span></li>
		</ul>
		</div>
	</div>
</div>


