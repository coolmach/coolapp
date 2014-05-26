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
					<li><span class="content">Apartment/House For Rent</span></li>
					<li><span class="content">Apartment/House For Sale</span></li>
					<li><span class="content">Plot For Sale</span></li>
					<li><span class="content">PG Accommodation</span></li>
					<li><span class="content">Roommate Required</span></li>
				</ul>
				<!-- <a href="#" class="clear blue_link">clear filters</a> -->
			</div>
		</div>
		
	 <form class="form-inline" id="apartment-rent"> 

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
						<li><input type="checkbox" class="check_area" name="area" value="1000 sq.ft" /><span class="content"><1000 sq.ft</span>
						</li>
						<li><input type="checkbox" class="check_area" name="area" value="1000-1200 sq.ft" /><span class="content">1000-1200 sq.ft</span>
						</li>
						<li><input type="checkbox" class="check_area" name="area" value=">1200 sq.ft" /><span class="content">>1200 sq.ft</span> 
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="bhk-main">
				<div id="bhk" class="inputstyle pointer form-control">
					BHK <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_bhk" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_bhk" name="bhk" value="1 BHK" /><span class="content">1 BHK</span>
						</li>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="2 BHK" /><span class="content">2 BHK</span>
						</li>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="3 BHK" /><span class="content">3 BHK</span>
						</li>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="Others" /><span class="content">Others</span>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="rent-main">
				<div id="rent" class="inputstyle pointer form-control">
					Rent <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_rent" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_rent" name="rent" value="<10,000" /><span class="content"><10,000</span>
						</li>
						<li><input type="checkbox" class="check_rent" name="rent" value="10,000-14,000" /><span class="content">10,000-14,000</span>
						</li>
						<li><input type="checkbox" class="check_rent" name="rent" value="14,000-18,000" /><span class="content">14,000-18,000</span>
						</li>
						<li><input type="checkbox" class="check_rent" name="rent" value=">18,000" /><span class="content">>18,000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="dir-main">
				<div id="direction" class="inputstyle pointer form-control">
					Direction <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_dir" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_dir" name="direction" value="East" /><span class="content">East</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="direction" value="West" /><span class="content">West</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="direction" value="North" /><span class="content">North</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="direction" value="South" /><span class="content">South</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="pref-main">
				<div id="preference" class="inputstyle pointer form-control">
					Preference <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_pref" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_pref" name="preference" value="Bachelors" /><span class="content">Bachelors</span>
						</li>
						<li><input type="checkbox" class="check_pref" name="preference" value="Family" /><span class="content">Family</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="park-main">
				<div id="park" class="inputstyle pointer form-control">
					Car Parking <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_park" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_park" name="parking" value="Yes" /><span class="content">Yes</span>
						</li>
						<li><input type="checkbox" class="check_park" name="parking" value="No" /><span class="content">No</span>
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
			<div class=" pull-left hidden-subcat" id="approval-main">
				<div id="approval" class="inputstyle pointer form-control">
					Approval <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_approval" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_approval" name="approval" value="BDA" /><span class="content">BDA</span>
						</li>
						<li><input type="checkbox" class="check_approval" name="approval" value="BMRDA" /><span class="content">BMRDA</span>
						</li>
						<li><input type="checkbox" class="check_approval" name="approval" value="BBMP" /><span class="content">BBMP</span>
						</li>
						<li><input type="checkbox" class="check_approval" name="approval" value="Others" /><span class="content">Others</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="ownership-main">
				<div id="ownership" class="inputstyle pointer form-control">
					Ownership <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_ownership" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_ownership" name="ownership" value="New" /><span class="content">New</span>
						</li>
						<li><input type="checkbox" class="check_ownership" name="ownership" value="ReSale" /><span class="content">ReSale</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="amenities-main">
				<div id="amenities" class="inputstyle pointer form-control">
					Amenities <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amenities" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_amenities" name="amenities" value="Gym" /><span class="content">Gym</span>
						</li>
						<li><input type="checkbox" class="check_amenities" name="amenities" value="Car Parking" /><span class="content">Car Parking</span>
						</li>
						<li><input type="checkbox" class="check_amenities" name="amenities" value="Children Park" /><span class="content">Children Park</span>
						</li>
						<li><input type="checkbox" class="check_amenities" name="amenities" value="Club House" /><span class="content">Club House</span>
						</li>
						<li><input type="checkbox" class="check_amenities" name="amenities" value="Swimming Pool" /><span class="content">Swimming Pool</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="amenitiesPg-main">
				<div id="amenitiesPg" class="inputstyle pointer form-control">
					Amenities <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amenitiesPg" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_amenities_pg" name="amenities_pg" value="WiFi" /><span class="content">WiFi</span>
						</li>
						<li><input type="checkbox" class="check_amenities_pg" name="amenities_pg" value="TV/DTH" /><span class="content">TV/DTH</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="food-main">
				<div id="food" class="inputstyle pointer form-control">
					Food <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_food" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_food" name="food" value="veg" /><span class="content">Veg</span>
						</li>
						<li><input type="checkbox" class="check_food" name="food" value="Non Veg" /><span class="content">Non Veg</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="share-main">
				<div id="share" class="inputstyle pointer form-control">
					Share Amount <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_share" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_share" name="share" value="0-3000" /><span class="content">0-3000</span>
						</li>
						<li><input type="checkbox" class="check_share" name="share" value=">3000" /><span class="content">>3000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="furnished-main">
				<div id="furnished" class="inputstyle pointer form-control">
					Furnished <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_furnished" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_furnished" name="furnished" value="Yes" /><span class="content">Yes</span>
						</li>
						<li><input type="checkbox" class="check_furnished" name="furnished" value="No" /><span class="content">No</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="gender-main">
				<div id="food" class="inputstyle pointer form-control">
					Gender <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_gender" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_gender" name="gender" value="Male" /><span class="content">Male</span>
						</li>
						<li><input type="checkbox" class="check_gender" name="gender" value="Female" /><span class="content">Female</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="region-main">
				<div id="region" class="inputstyle pointer form-control">
					Regional Preference <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_region" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_region" name="region" value="Hindi" /><span class="content">Hindi</span>
						</li>
						<li><input type="checkbox" class="check_region" name="region" value="Kannada" /><span class="content">Kannada</span>
						</li>
						<li><input type="checkbox" class="check_region" name="region" value="Tamil" /><span class="content">Tamil</span>
						</li>
						<li><input type="checkbox" class="check_region" name="region" value="Telugu" /><span class="content">Telugu</span>
						</li>
						<li><input type="checkbox" class="check_region" name="region" value="Punjabi" /><span class="content">Punjabi</span>
						</li>
						<li><input type="checkbox" class="check_region" name="region" value="Other" /><span class="content">Other</span>
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

<s:if test='subCat.equals("Apartment/House For Rent")'>
		<%@include file="./AdList_RealEstate_Apartment_For_Rent.jsp"%>
</s:if>
</div>
