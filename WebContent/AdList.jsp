<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">

	<div class="col-md-12 filter_cat">
		<div class="form-group pull-left" id="subCategory-main">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Apartment/House For Rent</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><!-- <input type="checkbox" id="first_checkbox_btn" name="choice" value="Apartment/House For Rent" /> --><span class="content">Apartment/House For Rent</span></li>
					<li><span class="content">Apartment/House For Sale</span></li>
					<li><span class="content">Plot For Sale</span></li>
					<li><span class="content">PG Accommodation</span></li>
					<li><span class="content">Roommate Required</span></li>
				</ul>
				<a href="#" class="clear blue_link">clear filters</a>
			</div>
		</div>
		
		<form class="form-inline" role="form" id="apartment-rent">

			<div class=" pull-left hidden-subcat" id="loc-main">
				<div id="location" class="inputstyle pointer form-control">
					<span class="content">Location</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_loc" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><span class="content">BTM</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">HSR</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Bellanduru</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Marathalli</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content"><1000 sq.ft</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">1000-1200 sq.ft</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">>1200 sq.ft</span> <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">1 BHK</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">2 BHK</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">3 BHK</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Others</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
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
						<li><span class="content"><10,000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">10,000-14,000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">14,000-18,000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">>18,000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">East</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">West</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">North</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">South</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">Bachelors</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Family</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">Yes</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">No</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="price-main">
				<div id="price" class="inputstyle pointer form-control">
					Price <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_price" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><span class="content"><10,000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">10,000-14,000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">14,000-18,000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">>18,000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">BDA</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">BMRDA</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">BBMP</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Others</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">New</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">ReSale</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">Gym</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Car Parking</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Children Park</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Club House</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Swimming Pool</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
			<div class=" pull-left hidden-subcat" id="amenities-pg-main">
				<div id="amenties-pg" class="inputstyle pointer form-control">
					Amenities <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amenities_pg" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><span class="content">WiFi</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">TV/DTH</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
				<div id="subCategory_hidden_amenities_food" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><span class="content">Veg</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Non Veg</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">0-3000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">>3000</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">Yes</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">No</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">Male</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Female</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
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
						<li><span class="content">Hindi</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Kannada</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Tamil</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Telugu</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Punjabi</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
						<li><span class="content">Other</span><span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>

			</div>
		</form>
		
	
	</div>
	<div class="col-md-11">
		<a class="grey_link" href="<s:url action=""  />">HOME</a> >
		<s:property value="category" /> > <span id="sub"><s:property value="subCategory" /></span>
	</div>
</div>
<!-- <div class="col-md-4"></div> -->
<div class="col-md-6">
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