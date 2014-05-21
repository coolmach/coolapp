<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">

	<div class="col-md-12 filter_cat">
		<div class="form-group pull-left" id="sub-main">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Type</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><span class="content">Laptop</span></li>
					<li><span class="content">Desktop</span></li>
					<li><span class="content">Tablet</span></li>
				</ul>
				<!-- <a href="#" class="clear blue_link">clear filters</a> -->
			</div>
		</div>
		
		<form class="form-inline" role="form" id="laptops">

			<div class=" pull-left hidden-subcat" id="brand-main">
				<div id="brand" class="inputstyle pointer form-control">
					<span class="content">Brand</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_brand" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_brand" name="brand" value="Apple" /><span class="content">Apple</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Acer" /><span class="content">Acer</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Dell" /><span class="content">Dell</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="HP" /><span class="content">HP </span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Samsung" /><span class="content">Samsung</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Lenovo" /><span class="content">Lenovo</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Compaq" /><span class="content">Compaq</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="HCL" /><span class="content">HCL</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="IBM" /><span class="content">IBM</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="LG" /><span class="content">LG</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Sony" /><span class="content">Sony</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Toshiba" /><span class="content">Toshiba</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Panasonic" /><span class="content">Panasonic</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Others" /><span class="content">Others</span>					
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="used-main">
				<div id="used" class="inputstyle pointer form-control">
					Used/Unused <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_used" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_used" name="used" value="Used" /><span class="content">Used</span>
						</li>
						<li><input type="checkbox" class="check_used" name="used" value="New" /><span class="content">New</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					<span class="content">Price</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
					    <li><input type="checkbox" class="check_amt" name="amt" value="<5,000" /><span class="content"><5,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="5,000-10,000" /><span class="content"><10,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="10,000-14,000" /><span class="content">10,000-14,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="14,000-18,000" /><span class="content">14,000-18,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">18,000" /><span class="content">>18,000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			 <div class=" pull-left hidden-subcat" id="loc-main">
				<div id="location" class="inputstyle pointer form-control">
					<span class="content">Location</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_loc" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_loc" name="location" value="BTM" /><span class="content">BTM</span>
						</li>
						<li><input type="checkbox" class="check_loc" name="location" value="HSR" /><span class="content">HSR</span>
						</li>
						<li><input type="checkbox" class="check_loc" name="location" value="Bellanduru" /><span class="content">Bellanduru</span>
						</li>
						<li><input type="checkbox" class="check_loc" name="location" value="Marathalli" /><span class="content">Marathalli</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="ram-main">
				<div id="ram" class="inputstyle pointer form-control">
					<span class="content">RAM</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_ram" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_ram" name="ram" value="1GB" /><span class="content">1GB</span>
						</li>
						<li><input type="checkbox" class="check_ram" name="ram" value="2GB" /><span class="content">2GB</span>
						</li>
						<li><input type="checkbox" class="check_ram" name="ram" value="4GB" /><span class="content">4GB</span>
						</li>
						<li><input type="checkbox" class="check_ram" name="ram" value=">4GB" /><span class="content">>4GB</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="screen-main">
				<div id="screen" class="inputstyle pointer form-control">
					<span class="content">Screen Size</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_screen" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_screen" name="screen" value="12-12.9 inches" /><span class="content">12-12.9 inches</span>
						</li>
						<li><input type="checkbox" class="check_screen" name="screen" value="13-13.9 inches" /><span class="content">13-13.9 inches</span>
						</li>
						<li><input type="checkbox" class="check_screen" name="screen" value="14-14.9 inches" /><span class="content">14-14.9 inches</span>
						</li>
						<li><input type="checkbox" class="check_screen" name="screen" value="<12 inches" /><span class="content"><12 inches</span>
						</li>
						<li><input type="checkbox" class="check_screen" name="screen" value=">16 inches" /><span class="content">>16 inches</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			
		</form>
	</div>
	<div class="col-md-12 selected_filters"></div>
	<div class="col-md-12">
		<a class="grey_link" href="<s:url action=""  />">HOME</a> >
		<span id="cat"><s:property value="category" /></span> > <span id="sub"><s:property value="subCategory" /></span>
	</div>
</div>
<!-- <div class="col-md-4"></div> -->
<div class="col-md-6 data">
	<s:if test="adList.size() > 0">
		<table class="table table-bordered">
			<tr>
				<th>Description</th>
				<th></th>
				<th>Price</th>
				<th>Date</th>
				<th>Posted By</th>
			</tr>
			<s:iterator value="adList" status="userStatus">
				<tr>
					<td><img class="images_ad" src=" <s:property value="imageFileName" />">
					</td>
					<td>
						<p>
							<s:property value="title" />
						</p><%--  <s:iterator begin="1" end="rating">
							<img class="rating_stars" src="images/star.jpg">
						</s:iterator>  --%> <br /><small><b><s:property value="cityCode" />,<s:property
									value="locCode" /> </b> </small><br /> <small>Contact <s:property
								value="contactPerson" />,<s:property value="contactNo" /> </small>
					</td>
					<td><s:url action="addetails" var="urlTag">
							<s:param name="price">
								<s:property value="price" />
							</s:param>
						</s:url> <a class="blue_link" href="<s:property value="#urlTag" />"><s:property
								value="price" /> </a>
					</td>
					<td><s:date name="rCreTime" format="dd/MM/yyyy" /></td>
					<td><s:property value="firstName" />(<s:property
							value="corpName" />)</td>
				</tr>
			</s:iterator>
		</table>

	</s:if>
</div>