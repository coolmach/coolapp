<%@ taglib prefix="s" uri="/struts-tags"%>

<div class=" header_2">
	<div class="col-md-12 filter_cat">
		<div class="form-group pull-left searchFilter" id="sub-main" style="margin-left:4.5%;">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Type</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<input type="hidden" id="contextPath" name="contextPath" value='<%=request.getContextPath()%>' />
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck" style="display: none;">
				<ul class="list-unstyled">
					<li value="2"><span class="content">Apartment For Rent</span></li>
					<li value="1"><span class="content">Apartment For Sale</span></li>
					<li value="4"><span class="content">Independent House For Rent</span></li>
					<li value="3"><span class="content">Independent House For Sale</span></li>
					<li value="6"><span class="content">Plot For Sale</span></li>
					<li value="5"><span class="content">PG Accommodation</span></li>
					<li value="7"><span class="content">Roommate Required</span></li>
				</ul>
				<!-- <a href="#" class="clear blue_link">clear filters</a> -->
			</div>
		</div>
		
	 <form class="form-inline" id="apartment-rent"> 

			<%--<div class=" pull-left hidden-subcat searchFilter" id="loc-main">
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
			</div>--%>
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
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="E" /><span class="content">East</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="W" /><span class="content">West</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="N" /><span class="content">North</span>
						</li>
						<li><input type="checkbox" class="check_dir" name="facingDirection" value="S" /><span class="content">South</span>
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
	   <span id="cat" style="display:none"><s:property value="category" /></span>
	   <span id="sub" style="display:none"><s:property value="subCategory" /></span>
	
	<a class="grey_link" href="<s:url action=""  />">Home</a> >
		<span id="breadCrumb_Category"><s:property value="categoryStr" /></span> > 
		<span id="breadCrumb_SubCategory"><s:property value="subCategoryStr" /></span>
	</div>
</div>

<!-- <div class="col-md-4"></div> -->

<div class="data">
	<s:if test="adList.size() > 0">
		<div class="col-md-6 listSection" id="postListSection">
		<table class="table table-bordered">
			<tr>
				<th>Post Details</th>
				<td colspan="3" style="text-align:right;width:100%;">Showing Records (? - ? of ?))</td>
			</tr>
			<s:iterator value="adList" status="userStatus">
				<tr style="font-size:12px;">
					 <td style="width:25%;"><img class="images_ad" src="<s:url value='ImageAction?imageId=%{imageFileName}' />" style="width:100px;height:100px;"></td> 
					 <td>
						<p style="color:#428bca;font-size:14px;">
							<s:property value="title" />
						</p> <%-- <s:iterator begin="1" end="rating">
							<img class="rating_stars" src="images/star.jpg">
						</s:iterator>  <br /> --%>
						<span class="postField"><s:property value="city" /></span> <span class="separator">|</span>
						<span class="postField"><s:property value="location" /></span>
						<br>
						
						<s:if test="%{subCategory == 1}">
							<!-- Apartment for Sale -->
							<span class="postField"><s:property value="bedrooms" /> BHK</span> <span class="separator">|</span>
							<span class="postField"><s:property value="area" /> sq ft</span> <span class="separator">|</span>
							<span class="postField"><s:property value="newOrResaleStr" /></span>
							<br>
							<span class="postField"><s:property value="facingDirectionStr" /> facing</span> <span class="separator">|</span>
							<span class="postField"><s:property value="floorNumberStr" /> Floor</span>
						</s:if>
						<s:elseif test="%{subCategory == 2}">
							<!-- Apartment for Rent -->
							<span class="postField"><s:property value="bedrooms" /> BHK</span> <span class="separator">|</span>
							<span class="postField"><s:property value="area" /> sq ft</span>
							<s:if test="%{furnished == F || furnished == S}">
								<span class="separator">|</span>
								<span class="postField"><s:property value="furnishedStr" /></span>
							</s:if>
							<s:if test="%{maintenance != 0}">
								<span class="separator">|</span>
								<span class="postField">Maintenance:&nbsp;<s:property value="maintenanceStr" /></span>
							</s:if>
							<s:if test="%{carParking == Y}">
								<span class="separator">|</span>
								<span class="postField">Car&nbsp;Parking</span>
							</s:if>
							<s:if test="%{powerBackup == Y}">
								<span class="separator">|</span>
								<span class="postField">Power&nbsp;Backup</span>
							</s:if>
							<s:if test="%{childrenPlayArea == Y}">
								<span class="separator">|</span>
								<span class="postField">Children&nbsp;Play&nbsp;Area</span>
							</s:if>
							<s:if test="%{gym == Y}">
								<span class="separator">|</span>
								<span class="postField">Gym</span>
							</s:if>										
							<br>

						</s:elseif>
						<s:elseif test="%{subCategory == 3}">
							<span class="postField"><s:property value="bedrooms" /> BHK</span> <span class="separator">|</span>
							<span class="postField"><s:property value="area" /> sq ft</span> <span class="separator">|</span>
							<span class="postField"><s:property value="newOrResaleStr" /></span>						
							<br>
							<span class="postField">Contact <s:property value="ContactPersonName" /></span> <span class="separator">|</span>
							<span class="postField"><s:property value="ContactNo" /></span>
						</s:elseif>
						<s:elseif test="%{subCategory == 4}">
							<span class="postField"><s:property value="bedrooms" /> BHK</span> <span class="separator">|</span>
							<span class="postField"><s:property value="area" /> sq ft</span> <span class="separator">|</span>
							<span class="postField"><s:property value="newOrResaleStr" /></span>						
						</s:elseif>
						<s:elseif test="%{subCategory == 5}">
							<span class="postField"><s:property value="bedrooms" /> BHK</span> <span class="separator">|</span>
							<span class="postField"><s:property value="area" /> sq ft</span> <span class="separator">|</span>
							<span class="postField"><s:property value="newOrResaleStr" /></span>						
						</s:elseif>																		
						<s:elseif test="%{subCategory == 6}">
							<span class="postField"><s:property value="bedrooms" /> BHK</span> <span class="separator">|</span>
							<span class="postField"><s:property value="area" /> sq ft</span> <span class="separator">|</span>
							<span class="postField"><s:property value="newOrResaleStr" /></span>						
						</s:elseif>
						<s:elseif test="%{subCategory == 7}">
							<span class="postField"><s:property value="bedrooms" /> BHK</span> <span class="separator">|</span>
							<span class="postField"><s:property value="area" /> sq ft</span> <span class="separator">|</span>
							<span class="postField"><s:property value="newOrResaleStr" /></span>						
						</s:elseif>
						<s:else>
						
						</s:else>
						<br>
					</td>
					<td>
						<span class="postField_Highlight">Rs.<s:property value="priceValueStr" /></span>
					</td> 
					<td><s:date name="createdOn" format="dd/MM/yyyy" /></td>
				</tr>  
			</s:iterator>
		</table>
	</s:if>
	<s:else>
		<div class="col-md-6 listSection">
			<table class="table table-bordered">
				<tr>
					<td colspan="3" style="padding-left:15px;font-size:13px;">No posts found! Try refining search criteria</th>
				</tr>
			</table>
		</div>	
	</s:else>
	</div>
</div>
<div id="right_LocationFilterSection">
	<div id="cityBar">
		<input type="radio" class="radioButton" name="city" id="city" value="BLR" checked><span class="radioCaption">Bangalore</span>
		<input type="radio" class="radioButton" name="city" id="city" value="CHE"><span class="radioCaption_RightAlign">Chennai</span>
	</div>
	<div id="locationSearchBar">
		<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="locSearch" id="locSearch">
		<img class="searchIcon" src="images/search_green_resized.png">	
	</div>
	<div id="locationDetails" style="display:none;">
		<div id="locationListBar">
			<div id="locationResultSection">
				<input type="checkbox" class="checkBox" name="location" id="location" value="23"><span class="radioCaption">Electronics City</span>
			</div>
			<div id="clearSection">
				<a class="smallLink" onClick="resetLocationFilter()">Clear Filter</a>
			</div>
		</div>
		<div id="horizontalSeparator">
			<hr>
		</div>
		<div id="neighborhoodLocationBar">
			<div id="heading">Nearby Areas</div>
			<div id="neighborAreaList">
				<table>
					<tr>
						<td><input type="checkbox" class="checkBox" name="location" id="location" value="23"><span class="radioCaption">Location 1</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" class="checkBox" name="location" id="location" value="23"><span class="radioCaption">Location 2</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" class="checkBox" name="location" id="location" value="23"><span class="radioCaption">Location 3</span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="companySearchBar">
		<input type="text" class="locationTextBox" placeholder="Enter Company (e.g. Infosys)" name="companySearch" id="companySearch">
		<img class="searchIcon" src="images/search_orange_resized.png">	
	</div>
			
</div>

<script>
	$("#breadCrumb_Category").html("Real Estate");
	if($("#breadCrumb_SubCategory").html() == ""){
		$("#breadCrumb_SubCategory").html("Apartment for Rent");
	}
</script>

<link rel="stylesheet" type="text/css" href="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.css"/>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>

<script>
	$(document).ready(function(){
		$("#locSearch").autocomplete({
		    source: function(request, response) {
			    $.ajax({
				    //url: "http://localhost:8080/Virat/getLocation?city=BLR",
				    url:$('#contextPath').text() + "/getLocation",
				    type: "POST",
				    dataType: "json",
				    //data: {location:$("#locSearch").val()},
				    data: {city:$('input[name=city]:checked').val(),location:$("#locSearch").val()},
				    success: function(data) {
				        response( $.map(data, function(item) {
					        return {
					            label: item.value,
					            value: item.id,
					        };
				        }));
				    },
				    error: function (error) {
				       alert('error: ' + error.responseText);
				    }
			    });
			},
			select:function(event, ui){
				event.preventDefault();
				$.ajax({
					//url:"http://localhost:8080/Virat/getNeighbor?city=BLR&location=" + ui.item.value,
					url:$('#contextPath').text() + "/getNeighbor",
					type:"POST",
					data: {city:$('input[name=city]:checked').val(),location:ui.item.value},
					success:function(data){
						$("#locationDetails").html(data);
						$("#locationDetails").show();
					},
					error:function(data){
						alert(data.responseText);
					}
				});
			},
		    minLength: 2
		 });
	});
</script>

<script>
//if user clicks on Clear Filter in Location bar in Ad List page
function resetLocationFilter(event) {
	var ctxPath = $('#context_path').text();
	var path = "realestateFilter";
	$('input[class^=check_location]').attr("checked", false);
	
	subCat = $('#sub').text();
	cat = $('#cat').text();
	$("#filterValueBar").show();
	
	var data="";
	data = data + '&subCategory='+subCat+'&category='+cat;
	var str="";
	$("input[class^=check_]:checked").each(function()
	  {		 
		var sub = $(this).attr('name');
		data = data + '&'+sub+'='+$(this).val();
		var check = $(this).parent().children('span.content').text();
		var div_Id = check.replace(/\s+/g, '').replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
		str = str+'<div style="margin-left:12px;" class="pull-left filters" id="'+div_Id+'">'+check+'<span style="margin-left:4px;" class="glyphicon glyphicon-remove form-control-show"id="'+div_Id+'">'+'</span>'+'</div >';
	  });

	$('.selected_filters').html(str);

	if($("#filterValueBar").text() == ""){
		$("#filterValueBar").hide();
	}
	
	$.ajax({
		type: 'POST',
		url: ctxPath+path, 
		data: data,
		success: function(data, status) {
			$('.data').html('');
			$('.data').html(data);

		}
	});

	$("#locationListBar").html("")
	$("#horizontalSeparator").html("")
	$("#neighborhoodLocationBar").html("")
}
</script>