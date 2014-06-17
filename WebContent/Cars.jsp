<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">

	<div class="col-md-12 filter_cat">
		<div class="form-group pull-left searchFilter" id="sub-main" style="margin-left:4.5%;">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Categories</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li value="1"><span class="content">Cars</span></li>
					<li value="2"><span class="content">Motorcycles</span></li>
					<li value="3"><span class="content">Scooters</span></li>
					<li value="4"><span class="content">SUVs & Vans</span></li>
					<li value="5"><span class="content">Bicycles</span></li>
					<li value="6"><span class="content">Buses</span></li>
					<li value="7"><span class="content">Trucks</span></li>
					<li value="8"><span class="content">Motor Service/Repair</span></li>
					<li value="9"><span class="content">Spare Parts/Accessories</span></li>
					<li value="10"><span class="content">Driving Schools</span></li>
					<li value="11"><span class="content">Other Vehicles</span></li>
					
				</ul>
				<!-- <a href="#" class="clear blue_link">clear filters</a> -->
			</div>
		</div>
		
		<form class="form-inline" role="form" id="cars">

			<div class=" pull-left hidden-subcat searchFilter" id="brand-main">
				<div id="brand" class="inputstyle pointer form-control">
					<span class="content">Brand</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_brand" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
					<li><input type="checkbox" class="check_brand" name="brand" value="Audi" /><span class="content">Audi</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="BMW" /><span class="content">BMW</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Chevrolet" /><span class="content">Chevrolet</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Ford" /><span class="content">Ford</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Fiat" /><span class="content">Fiat</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Honda" /><span class="content">Honda</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Hyundai" /><span class="content">Hyundai</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Mahindra" /><span class="content">Mahindra</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Maruti Suzuki" /><span class="content">Maruti Suzuki</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Mercedes Benz" /><span class="content">Mercedes Benz</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Mitsubishi" /><span class="content">Mitsubishi</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Nissan" /><span class="content">Nissan</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Skoda" /><span class="content">Skoda</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Tata" /><span class="content">Tata</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Toyota" /><span class="content">Toyota</span></li>
					<li><input type="checkbox" class="check_brand" name="brand" value="Volkswagen" /><span class="content">Volkswagen</span></li>
			        <li><input type="checkbox" class="check_brand" name="brand" value="Others" /><span class="content">Others</span></li>										
						
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="brandBikes-main">
				<div id="brandBikes" class="inputstyle pointer form-control">
					<span class="content">Brand</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_brandBikes" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Bajaj" /><span class="content">Bajaj</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Hero Honda" /><span class="content">Hero Honda</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Honda" /><span class="content">Honda</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Royal Enfield" /><span class="content">Royal Enfield</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="TVS" /><span class="content">TVS</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Yamaha" /><span class="content">Yamaha</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Hero" /><span class="content">Hero</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Kinetic" /><span class="content">Kinetic</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="LML" /><span class="content">LML</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Suzuki" /><span class="content">Suzuki</span></li>
			        <li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Others" /><span class="content">Others</span></li>													
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="used-main">
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
			<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					<span class="content">Price</span> <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
					    <li><input type="checkbox" class="check_amt" name="amt" value="<2,00,000" /><span class="content"><2,00,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="2,00,000-5,00,000" /><span class="content">2,00,000-5,00,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">5,00,000" /><span class="content">>5,00,000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			 <div class=" pull-left hidden-subcat searchFilter" id="loc-main">
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
			<div class=" pull-left hidden-subcat searchFilter" id="os-main">
				<div id="os" class="inputstyle pointer form-control">
					Operating System <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_os" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_os" name="os" value="Android" /><span class="content">Android</span>
						</li>
						<li><input type="checkbox" class="check_os" name="os" value="Apple-iOS" /><span class="content">Apple-iOS</span>
						</li>
						<li><input type="checkbox" class="check_os" name="os" value="Windows" /><span class="content">Windows</span>
						</li>
						<li><input type="checkbox" class="check_os" name="os" value="Blackberry" /><span class="content">Blackberry</span>
						</li>
						<li><input type="checkbox" class="check_os" name="os" value="Other" /><span class="content">Other</span>
						</li>	
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="sims-main">
				<div id="sims" class="inputstyle pointer form-control">
					Sims <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_sims" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_sims" name="sims" value="Dual" /><span class="content">Dual</span>
						</li>
						<li><input type="checkbox" class="check_sims" name="sims" value="Single" /><span class="content">Single</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="type-main">
				<div id="type" class="inputstyle pointer form-control">
					Accessory Type <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_type" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_type" name="type" value="Bluetooth Headset" /><span class="content">Bluetooth Headset</span>
						</li>
						<li><input type="checkbox" class="check_type" name="type" value="Case/Cover" /><span class="content">Case/Cover</span>
						</li>
						<li><input type="checkbox" class="check_type" name="type" value="Charger" /><span class="content">Charger</span>
						</li>
						<li><input type="checkbox" class="check_type" name="type" value="Earphones" /><span class="content">Earphones</span>
						</li>
						<li><input type="checkbox" class="check_type" name="type" value="Headphones" /><span class="content">Headphones</span>
						</li>
						<li><input type="checkbox" class="check_type" name="type" value="Battery" /><span class="content">Battery</span>
						</li>
						<li><input type="checkbox" class="check_type" name="type" value="Memory Card" /><span class="content">Memory Card</span>
						</li>
						<li><input type="checkbox" class="check_type" name="type" value="Other" /><span class="content">Other</span>
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
<div class=" data">
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