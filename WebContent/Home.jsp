<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
ul#actions{
    display:none;
}
#postAdMenu:hover ul#actions{
    display: block;
}
#actions li{
 	height:35px; cursor:pointer; background-color:rgb(250,245,226);width:150px;padding:5px;
}
</style>

	<div class="header_responseMessage">
		<s:property value="responseMsg" />
	</div> 
	 <div id="messageRow" class="row">
		<div class="col-sm-9">
			<div id="mainHeading" class="col-sm-12">
				An Exclusive <span style="color:#444444;">Buy & Sell</span> Portal for <span style="color:#444444;">Techies!</span>
			</div>
			<div id="subHeading" class="col-sm-12">
				"Say NO to Brokers, YES to Fellow IT Community"
			</div>
		</div>
		<div class="col-sm-2" style="margin-top:7px;margin-left:20px;" id="postAdMenu">
			<button class="mainButton">Post Free Ad</button>
				<s:url action="post_RealEstate" var="url_REAL_ADLIST" escapeAmp="false"></s:url>
				<s:url action="post_Automobile" var="url_AUTO_ADLIST" escapeAmp="false"></s:url>
				<s:url action="post_Computers" var="url_COMP_ADLIST" escapeAmp="false"></s:url>
				<s:url action="post_Electronics" var="url_ELEC_ADLIST" escapeAmp="false"></s:url>
				<s:url action="post_Mobiles" var="url_MOBILE_ADLIST" escapeAmp="false"></s:url>
				<s:url action="post_Furniture" var="url_FURNITURE_ADLIST" escapeAmp="false"></s:url>
			  <ul id="actions">
			    <li><a href='<s:property value="#url_REAL_ADLIST"/>'>Real Estate</a></li>
			    <li><a href='<s:property value="#url_AUTO_ADLIST"/>'>Automobiles</a></li>
			    <li><a href='<s:property value="#url_COMP_ADLIST"/>'>Computers</a></li>
			    <li><a href='<s:property value="#url_ELEC_ADLIST"/>'>Home Appliances</a></li>
			    <li><a href='<s:property value="#url_MOBILE_ADLIST"/>'>Mobiles</a></li>
			    <li><a href='<s:property value="#url_FURNITURE_ADLIST"/>'>Furniture</a></li>
			  </ul>
		</div>		
	</div>
	<div id="searchBoxRow" class="row">
		<div id="searchBoxArea" style="margin-left:0px;">
			<input id="searchBox" type="text" class="" placeholder="Search For Items" style="margin-left:20px;width:500px;">
		</div>
	</div>
	<div id="iconsRow" style="margin:0,padding:0;">
	<div id="showcase-row">
<div class="moduletable top_links  col-md-12">
<!-- <div class="mod-menu"> -->
		<s:url action="realestate" var="url_REAL" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">1</s:param></s:url>
		<s:url action="automobile" var="url_AUTO" escapeAmp="false"><s:param name="category">AUTO</s:param><s:param name="subCategory">1</s:param></s:url>
		<s:url action="computers" var="url_COMP" escapeAmp="false"><s:param name="category">COMP</s:param><s:param name="subCategory">1</s:param></s:url>
		<s:url action="electronics" var="url_ELEC" escapeAmp="false"><s:param name="category">ELEC</s:param><s:param name="subCategory">0</s:param></s:url>
		<s:url action="mobile" var="url_MOBILE" escapeAmp="false"><s:param name="category">MOBILE</s:param><s:param name="subCategory">1</s:param></s:url>
		<s:url action="furniture" var="url_FURN" escapeAmp="false"><s:param name="category">FURN</s:param><s:param name="subCategory">1</s:param></s:url>
	<ul class="nav">
	<li class="item-177 firstItem">
		<div class="" id="tile1">
			<a href="<s:property value="#url_REAL" />">
			<div class="tile_image" id="image1_black"></div>
			<div class="tile_image" id="image1_color" style="display:none"></div>
			<span>Real Estate</span></a>
			</a>
		</div>
		</li>
		<li class="item-178">
		<div class="" id="tile2">
			<a href="<s:property value="#url_AUTO" />">
			<div class="tile_image" id="image2_black"></div>
			<div class="tile_image" id="image2_color" style="display:none"></div>
			<span>Automobiles</span></a>
			</a>
		</div>
		</li>
		<li class="item-179">
		<div class="" id="tile3">
			<a href="<s:property value="#url_ELEC" />">
			<div class="tile_image" id="image3_black"></div>
			<div class="tile_image" id="image3_color" style="display:none"></div>
			<span>Household</span></a>
			</a>
		</div>
		</li>
		<li class="item-180">
		<div class="" id="tile4">
			<a href="<s:property value="#url_MOBILE" />">
			<div class="tile_image" id="image4_black"></div>
			<div class="tile_image" id="image4_color" style="display:none"></div>
			<span>Mobiles</span></a>
			</a>
		</div>
		</li>
		<li class="item-181">
		<div class="" id="tile5">
			<a href="<s:property value="#url_COMP" />">
			<div class="tile_image" id="image5_black"></div>
			<div class="tile_image" id="image5_color" style="display:none"></div>
			<span>Computers</span></a>
			</a>
		</div>
		</li>
		<li class="item-182 lastItem">
		<div class="" id="tile6">
			<a href="<s:property value="#url_FURN" />">
			<div class="tile_image" id="image6_black"></div>
			<div class="tile_image" id="image6_color" style="display:none"></div>
			<span>Furniture</span></a>
			</a>
		</div>
		</li>
	</ul>
	</div>
	</div>
</div>
<!-- </div> -->