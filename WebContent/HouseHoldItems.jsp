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
					<li><span class="content">Air Conditioners & Coolers</span></li>
					<li><span class="content">Bags/Luggage</span></li>
					<li><span class="content">Baby Products</span></li>
					<li><span class="content">Clothing/Garments</span></li>
					<li><span class="content">Gifts</span></li>
					<li><span class="content">Fashion Accessories</span></li>
					<li><span class="content">Handicrafts</span></li>
					<li><span class="content">Health/Beauty Products</span></li>
					<li><span class="content">Home/Kitchen Appliances</span></li>
					<li><span class="content">Home/Office Furniture</span></li>
					<li><span class="content">Household</span></li>
					<li><span class="content">Jewellery</span></li>
					<li><span class="content">Musical Instruments</span></li>
					<li><span class="content">Paintings</span></li>
					<li><span class="content">Sport/Fitness Equipment</span></li>
					<li><span class="content">Toys/Games</span></li>
					<li><span class="content">Sport/Fitness Equipment</span></li>
					<li><span class="content">Watches</span></li>
					<li><span class="content">Others</span></li>
				</ul>
			</div>
		</div>
		
	 <form class="form-inline" id="household-items"> 

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
			<div class=" pull-left hidden-subcat" id="area-main">
				<div id="area" class="inputstyle pointer form-control">
					Area <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_area" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_area" name="area" value="<1000 sq.ft" /><span class="content"><1000 sq.ft</span>
						</li>
						<li><input type="checkbox" class="check_area" name="area" value="1000 sq.ft-1200 sq.ft" /><span class="content">1000 sq.ft-1200 sq.ft</span>
						</li>
						<li><input type="checkbox" class="check_area" name="area" value=">1200 sq.ft" /><span class="content">>1200 sq.ft</span> 
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
					    <li><input type="checkbox" class="check_amt" name="amt" value="<10,000" /><span class="content"><10,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="10,000-15,000" /><span class="content"><10,000-15000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">15,000" /><span class="content">>15,000</span>
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
			<div class=" pull-left hidden-subcat" id="brand-main">
				<div id="brand" class="inputstyle pointer form-control">
					<span class="content">Brand</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_brand" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_brand" name="brand" value="Bajaj" /><span class="content">Bajaj</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Bluestar" /><span class="content">Bluestar</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Electrolux" /><span class="content">Electrolux</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Godrej" /><span class="content">Godrej</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Haier" /><span class="content">Haier</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Hitachi" /><span class="content">Hitachi</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Kenstar" /><span class="content">Kenstar</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="LG" /><span class="content">LG</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Panasonic" /><span class="content">Panasonic</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Samsung" /><span class="content">Samsung</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Symphony" /><span class="content">Symphony</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Usha" /><span class="content">Usha</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Videocon" /><span class="content">Videocon</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Voltas" /><span class="content">Voltas</span>					
						<li><input type="checkbox" class="check_brand" name="brand" value="Whirlpool" /><span class="content">Whirlpool</span>
						<li><input type="checkbox" class="check_brand" name="brand" value="Others" /><span class="content">Others</span>
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
		<span id="cat"><s:property value="category" /></span> > <span id="sub"><s:property value="subCat" /></span>
	</div>
</div>

<!-- <div class="col-md-4"></div> -->
<div class="col-md-6 data">

		<%@include file="./AdList_For_HouseHoldItems.jsp"%>

</div>
