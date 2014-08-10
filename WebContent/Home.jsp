<%@ taglib prefix="s" uri="/struts-tags"%>
	<div id="messageRow" class="row">
		<div class="col-sm-9">
			<div id="mainHeading" class="col-sm-12">
				An Exclusive <span style="color:#444444;">Buy & Sell</span> Portal for <span style="color:#444444;">Techies!</span>
			</div>
			<div id="subHeading" class="col-sm-12">
				"Say NO to Brokers, YES to Fellow IT Community"
			</div>
		</div>
		<div class="col-sm-1" style="margin-top:7px;margin-left:20px;">
			<button class="mainButton">Post Free Ad</button>
		</div>		
	</div>
	<div id="searchBoxRow" class="row">
		<div id="searchBoxArea" style="margin-left:0px;">
			<input id="searchBox" type="text" class="" placeholder="Search For Items" style="margin-left:20px;width:500px;">
		</div>
	</div>
	<div id="iconsRow">
	
		<s:url action="realestate" var="url_REAL" escapeAmp="false"><s:param name="category">REAL</s:param></s:url>
		<s:url action="realestate" var="url_AUTO" escapeAmp="false"><s:param name="category">AUTO</s:param></s:url>
		<s:url action="realestate" var="url_COMP" escapeAmp="false"><s:param name="category">COMP</s:param></s:url>
		<s:url action="realestate" var="url_ELEC" escapeAmp="false"><s:param name="category">ELEC</s:param></s:url>
		<s:url action="realestate" var="url_MOBILE" escapeAmp="false"><s:param name="category">MOBILE</s:param></s:url>
		<s:url action="realestate" var="url_FURN" escapeAmp="false"><s:param name="category">FURN</s:param></s:url>
	
		<div class="col-sm-2 tile" id="tile1">
			<a href="<s:property value="#url_REAL" />">
			<div class="tile_image" id="image1_black"></div>
			<div class="tile_image" id="image1_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption1">Real Estate</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile2">
			<a href="<s:property value="#url_AUTO" />">
			<div class="tile_image" id="image2_black"></div>
			<div class="tile_image" id="image2_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption2">Automobiles</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile3">
			<a href="<s:property value="#url_ELEC" />">
			<div class="tile_image" id="image3_black"></div>
			<div class="tile_image" id="image3_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption3">Household</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile4">
			<a href="<s:property value="#url_MOBILE" />">
			<div class="tile_image" id="image4_black"></div>
			<div class="tile_image" id="image4_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption4">Mobiles</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile5">
			<a href="<s:property value="#url_COMP" />">
			<div class="tile_image" id="image5_black"></div>
			<div class="tile_image" id="image5_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption5">Computers</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile6">
			<a href="<s:property value="#url_FURN" />">
			<div class="tile_image" id="image6_black"></div>
			<div class="tile_image" id="image6_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption6">Furniture</div>
			</a>
		</div>
	</div>