<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">

	<div class="col-md-12 filter_cat">
		<div class="form-group pull-left" id="sub-main">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Categories</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><span class="content">Cars</span></li>
					<li><span class="content">Motorcycles</span></li>
					<li><span class="content">Scooters</span></li>
					<li><span class="content">SUVs & Vans</span></li>
					<li><span class="content">Bicycles</span></li>
					<li><span class="content">Buses</span></li>
					<li><span class="content">Trucks</span></li>
					<li><span class="content">Motor Service/Repair</span></li>
					<li><span class="content">Spare Parts/Accessories</span></li>
					<li><span class="content">Driving Schools</span></li>
					<li><span class="content">Other Vehicles</span></li>
					
				</ul>
				<!-- <a href="#" class="clear blue_link">clear filters</a> -->
			</div>
		</div>
		
		<form class="form-inline" role="form" id="cars">

			<div class=" pull-left hidden-subcat" id="brand-main">
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
			<div class=" pull-left hidden-subcat" id="brandBikes-main">
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
			<div class=" pull-left hidden-subcat" id="os-main">
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
			<div class=" pull-left hidden-subcat" id="sims-main">
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
			<div class=" pull-left hidden-subcat" id="type-main">
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