
<div class=" header_2 clearfix col-md-9">
	<%@include file="/BreadCrumb.jsp" %>
	<!--s:if test="adList.size() > 0"-->
	<div class="col-md-12 filter_cat">
	 	<form class="form-inline" id="apartment-rent"> 
			<div class=" pull-left hidden-subcat searchFilter" id="area-main">
				<div id="area" class="inputstyle pointer form-control">
					Area <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_area" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_area" name="areaStr" value="<1000 sq.ft" /><span class="content">Less than 1000 sq.ft</span></li>
						<li><input type="checkbox" class="check_area" name="areaStr" value="1000 sq.ft-1199 sq.ft" /><span class="content">1000 sq.ft-1199 sq.ft</span></li>
						<li><input type="checkbox" class="check_area" name="areaStr" value="1200 sq.ft-1399 sq.ft" /><span class="content">1200 sq.ft-1399 sq.ft</span></li>
						<li><input type="checkbox" class="check_area" name="areaStr" value="1400 sq.ft-1600 sq.ft" /><span class="content">1400 sq.ft-1600 sq.ft</span></li>
						<li><input type="checkbox" class="check_area" name="areaStr" value=">1600 sq.ft" /><span class="content">Above 1600 sq.ft</span></li>
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
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_bhk" name="bhk" value="1" /><span class="content">1 BHK</span></li>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="2" /><span class="content">2 BHK</span></li>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="2.5" /><span class="content">2.5 BHK</span></li>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="3" /><span class="content">3 BHK</span></li>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="4" /><span class="content">4 BHK</span>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="Single" /><span class="content">Single Room</span></li>
						<li><input type="checkbox" class="check_bhk" name="bhk" value="Studio" /><span class="content">Studio</span></li>
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
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_rent" name="rent" value="<10000" /><span class="content">Less than 10,000</span></li>
						<li><input type="checkbox" class="check_rent" name="rent" value="10000-14999" /><span class="content">10,000-14,999</span></li>
						<li><input type="checkbox" class="check_rent" name="rent" value="15000-19999" /><span class="content">15,000-19,999</span></li>
						<li><input type="checkbox" class="check_rent" name="rent" value="20000-25000" /><span class="content">20,000-25,000</span></li>
						<li><input type="checkbox" class="check_rent" name="rent" value=">25000" /><span class="content">Above 25,000</span></li>
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
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="E" /><span class="content">East</span></li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="W" /><span class="content">West</span></li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="N" /><span class="content">North</span></li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="S" /><span class="content">South</span></li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="NE" /><span class="content">North East</span></li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="NW" /><span class="content">North West</span></li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="SE" /><span class="content">South East</span></li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="SW" /><span class="content">South West</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="pref-main">
				<div id="preference" class="inputstyle pointer form-control">
					Preference <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_pref" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_pref" name="maritalPreference" value="B" /><span class="content">Bachelors</span>
						</li>
						<li><input type="checkbox" class="check_pref" name="maritalPreference" value="F" /><span class="content">Family</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="park-main">
				<div id="park" class="inputstyle pointer form-control">
					Car Parking <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_park" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
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
					Price <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_amt" name="amt" value="<2000000" /><span class="content">0 - 20 Lakh</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value="2000000-2999999" /><span class="content">20 - 29 Lakh</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value="3000000-3999999" /><span class="content">30 - 39 Lakh</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value="4000000-4999999" /><span class="content">40 - 49 Lakh</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value="5000000-5999999" /><span class="content">50 - 59 Lakh</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value="6000000-6999999" /><span class="content">60 - 75 Lakh</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">7500000" /><span class="content">Above 75 Lakh</span></li>					
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="approval-main">
				<div id="approval" class="inputstyle pointer form-control">
					Approval <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_approval" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" id="approvalAuthorityFilter" role="menu">
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
					Ownership <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_ownership" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_ownership" name="newOrResale" value="N" /><span class="content">New</span>
						</li>
						<li><input type="checkbox" class="check_ownership" name="newOrResale" value="R" /><span class="content">Resale</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="amenities-main">
				<div id="amenities" class="inputstyle pointer form-control">
					Amenities <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amenities" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_amenities" name="gym" value="Y" /><span class="content">Gym</span></li>
						<li><input type="checkbox" class="check_amenities" name="childrenPlayArea" value="Y" /><span class="content">Children Park</span></li>
						<li><input type="checkbox" class="check_amenities" name="clubHouse" value="Y" /><span class="content">Club House</span></li>
						<li><input type="checkbox" class="check_amenities" name="swimmingPool" value="Y" /><span class="content">Swimming Pool</span></li>
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
					<ul class="dropdown-menu scrollable-menu" role="menu">
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
					<ul class="dropdown-menu scrollable-menu" role="menu">
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
					Shared Rent <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_share" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_share" name="share" value="<3000" /><span class="content"><3000</span>
						</li>
						<li><input type="checkbox" class="check_share" name="share"" value="3000-5999" /><span class="content">3000 - 5999</span>
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
					<ul class="dropdown-menu scrollable-menu" role="menu">
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
					<ul class="dropdown-menu scrollable-menu" role="menu">
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
					Language <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_region" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Hindi" /><span class="content">Hindi</span></li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Kannada" /><span class="content">Kannada</span></li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Tamil" /><span class="content">Tamil</span></li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Telugu" /><span class="content">Telugu</span></li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Punjabi" /><span class="content">Punjabi</span></li>
						<li><input type="checkbox" class="check_region" name="regionalPreference" value="Other" /><span class="content">Other</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
		 </form> 
	</div>
	<div class="col-md-11 selected_filters" style="display:none;" id="filterValueBar">
		<div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div>
	</div>
	<!--/s:if-->
	<!-- %@include file="/Pagination.jsp" %-->
</div>

<script>

</script>