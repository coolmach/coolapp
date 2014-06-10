<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">

	<div class="col-md-12 filter_cat">
		<div class="form-group pull-left searchFilter" id="sub-main">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Type</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck" style="display: none;">
				<ul class="list-unstyled">
					<li value="2"><span class="content">Apartment/House For Rent</span></li>
					<li value="1"><span class="content">Apartment/House For Sale</span></li>
					<li value="6"><span class="content">Plot For Sale</span></li>
					<li value="5"><span class="content">PG Accommodation</span></li>
					<li value="7"><span class="content">Roommate Required</span></li>
				</ul>
				<!-- <a href="#" class="clear blue_link">clear filters</a> -->
			</div>
		</div>
		
	 <form class="form-inline" id="apartment-rent"> 

			<div class=" pull-left hidden-subcat searchFilter" id="loc-main">
				<div id="location" class="inputstyle pointer form-control">
					<span class="content">Location</span> 
					<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
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
			<div class=" pull-left hidden-subcat searchFilter" id="area-main">
				<div id="area" class="inputstyle pointer form-control">
					Area <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_area" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_area" name="areaStr" value="<1000 sq.ft" /><span class="content"><1000 sq.ft</span>
						</li>
						<li><input type="checkbox" class="check_area" name="areaStr" value="1000 sq.ft-1200 sq.ft" /><span class="content">1000 sq.ft-1200 sq.ft</span>
						</li>
						<li><input type="checkbox" class="check_area" name="areaStr" value=">1200 sq.ft" /><span class="content">>1200 sq.ft</span> 
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="bhk-main">
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
						<li><input type="checkbox" class="check_bhk" name="bhk" value="4 BHK" /><span class="content">4 BHK</span>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="rent-main">
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
						<li><input type="checkbox" class="check_rent" name="rent" value=">14,000" /><span class="content">>14,000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="dir-main">
				<div id="direction" class="inputstyle pointer form-control">
					Direction <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_dir" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="East" /><span class="content">East</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="West" /><span class="content">West</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="North" /><span class="content">North</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="South" /><span class="content">South</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="pref-main">
				<div id="preference" class="inputstyle pointer form-control">
					Preference <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_pref" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_pref" name="maritalPreference" value="Bachelors" /><span class="content">Bachelors</span>
						</li>
						<li><input type="checkbox" class="check_pref" name="maritalPreference" value="Family" /><span class="content">Family</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="park-main">
				<div id="park" class="inputstyle pointer form-control">
					Car Parking <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_park" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_park" name="carParking" value="Y" /><span class="content">Yes</span>
						</li>
						<li><input type="checkbox" class="check_park" name="carParking" value="N" /><span class="content">No</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
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
			<div class=" pull-left hidden-subcat searchFilter" id="approval-main">
				<div id="approval" class="inputstyle pointer form-control">
					Approval <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_approval" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_approval" name="approvalAuthority" value="BDA" /><span class="content">BDA</span>
						</li>
						<li><input type="checkbox" class="check_approval" name="approvalAuthority" value="BMRDA" /><span class="content">BMRDA</span>
						</li>
						<li><input type="checkbox" class="check_approval" name="approvalAuthority" value="BBMP" /><span class="content">BBMP</span>
						</li>
						<li><input type="checkbox" class="check_approval" name="approvalAuthority" value="Others" /><span class="content">Others</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="ownership-main">
				<div id="ownership" class="inputstyle pointer form-control">
					Ownership <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_ownership" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_ownership" name="newOrResale" value="New" /><span class="content">New</span>
						</li>
						<li><input type="checkbox" class="check_ownership" name="newOrResale" value="ReSale" /><span class="content">ReSale</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="amenities-main">
				<div id="amenities" class="inputstyle pointer form-control">
					Amenities <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amenities" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_amenities" name="gym" value="Y" /><span class="content">Gym</span>
						</li>
						<li><input type="checkbox" class="check_amenities" name="carParking" value="Y" /><span class="content">Car Parking</span>
						</li>
						<li><input type="checkbox" class="check_amenities" name="childrenPlayArea" value="Y" /><span class="content">Children Park</span>
						</li>
						<li><input type="checkbox" class="check_amenities" name="clubHouse" value="Y" /><span class="content">Club House</span>
						</li>
						<li><input type="checkbox" class="check_amenities" name="swimmingPool" value="Y" /><span class="content">Swimming Pool</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="amenitiesPg-main">
				<div id="amenitiesPg" class="inputstyle pointer form-control">
					Amenities <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amenitiesPg" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_amenities_pg" name="wifi" value="Y" /><span class="content">WiFi</span>
						</li>
						<li><input type="checkbox" class="check_amenities_pg" name="tv" value="Y" /><span class="content">TV/DTH</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="food-main">
				<div id="food" class="inputstyle pointer form-control">
					Food <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_food" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_food" name="food" value="Veg" /><span class="content">Veg</span>
						</li>
						<li><input type="checkbox" class="check_food" name="food" value="Non Veg" /><span class="content">Non Veg</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="share-main">
				<div id="share" class="inputstyle pointer form-control">
					Share Amount <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_share" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_share" name="share" value="<3000" /><span class="content"><3000</span>
						</li>
						<li><input type="checkbox" class="check_share" name="share"" value="3000-6000" /><span class="content">3000-6000</span>
						</li>
						<li><input type="checkbox" class="check_share" name="share" value=">6000" /><span class="content">>6000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="furnished-main">
				<div id="furnished" class="inputstyle pointer form-control">
					Furnished <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_furnished" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_furnished" name="furnished" value="Y" /><span class="content">Yes</span>
						</li>
						<li><input type="checkbox" class="check_furnished" name="furnished" value="N" /><span class="content">No</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="gender-main">
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
			<div class=" pull-left hidden-subcat searchFilter" id="region-main">
				<div id="region" class="inputstyle pointer form-control">
					Regional Preference <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_region" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Hindi" /><span class="content">Hindi</span>
						</li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Kannada" /><span class="content">Kannada</span>
						</li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Tamil" /><span class="content">Tamil</span>
						</li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Telugu" /><span class="content">Telugu</span>
						</li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Punjabi" /><span class="content">Punjabi</span>
						</li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Other" /><span class="content">Other</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
		 </form> 
	</div>
	<div class="col-md-12 selected_filters" style="display:none;" id="filterValueBar"></div>
	<div class="col-md-12" id="breadCrumb">
		<a class="grey_link" href="<s:url action=""  />">HOME</a> >
	<span id="cat" style="display:none"><s:property value="category" /></span>
		<span id="sub" style="display:none"><s:property value="subCat" /></span>
		<span><s:property value="categoryStr" /></span> > <span><s:property value="subCategoryStr" /></span>

	</div>
</div>

<!-- <div class="col-md-4"></div> -->
<div class="col-md-6 data" id="postListSection">

		<%@include file="./AdList_RealEstate_Apartment_For_Rent.jsp"%>

</div>
