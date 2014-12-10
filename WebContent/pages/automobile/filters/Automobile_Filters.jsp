
<div class=" header_2 clearfix col-md-9">
	<%@include file="/BreadCrumb.jsp" %>
	<!--s:if test="adList.size() > 0"-->
		<div class="col-md-12 filter_cat">
			<form class="form-inline" id="automobile">
				<!-- Bikes Makes and Models - START -->
				<div class=" pull-left hidden-subcat searchFilter" id="bike_make-main">
					<div id="bike_make" class="inputstyle pointer form-control">
						Make <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_bike_make" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_make" name="make" value="Bajaj"/><span class="content">Bajaj</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Hero Honda"/><span class="content">Hero Honda</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Honda"/><span class="content">Honda</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Kawasaki"/><span class="content">Kawasaki</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="KTM"/><span class="content">KTM</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="LML"/><span class="content">LML</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Royal Enfield"/><span class="content">Royal Enfield</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Suzuki"/><span class="content">Suzuki</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="TVS"/><span class="content">TVS</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Vespa"/><span class="content">Vespa</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Yamaha"/><span class="content">Yamaha</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Others"/><span class="content">Others</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<!-- Bikes Makes and Models - END -->			
				<div class=" pull-left hidden-subcat searchFilter" id="make-main">
					<div id="make" class="inputstyle pointer form-control">
						Make <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_make" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_make" name="make" value="Maruti Suzuki"/><span class="content">Maruti Suzuki</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Ford"/><span class="content">Ford</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Fiat"/><span class="content">Fiat</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Honda"/><span class="content">Honda</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Hyundai"/><span class="content">Hyundai</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Mahindra"/><span class="content">Mahindra</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Chevrolet"/><span class="content">Chevrolet</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Nissan"/><span class="content">Nissan</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Renault"/><span class="content">Renault</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Skoda"/><span class="content">Skoda</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Tata"/><span class="content">Tata</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Toyota"/><span class="content">Toyota</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Volkswagen"/><span class="content">Volkswagen</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Others"/><span class="content">Others</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="model-main">
					<div id="model" class="inputstyle pointer form-control">
						Model <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_model" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" id="model_List_In_Filter_Screen">
							<li>Select Make first</li>
						</ul>
					</div>
				</div>			
				<div class=" pull-left hidden-subcat searchFilter" id="age-main">
					<div id="age" class="inputstyle pointer form-control">
						Age (Years) <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_age" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_age" name="year" value="1" /><span class="content">Less than 1 year</span></li>
							<li><input type="checkbox" class="check_age" name="year" value="2" /><span class="content">1 - 2 years</span></li>
							<li><input type="checkbox" class="check_age" name="year" value="3" /><span class="content">2 - 3 years</span></li>
							<li><input type="checkbox" class="check_age" name="year" value="4" /><span class="content">3 - 4 years</span></li>
							<li><input type="checkbox" class="check_age" name="year" value="5" /><span class="content">4 - 5 years</span></li>
							<li><input type="checkbox" class="check_age" name="year" value="6" /><span class="content">Older than 5 years</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="year-main">
					<div id="year" class="inputstyle pointer form-control">
						Age (Years) <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_year" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_year" name="year" value="1" /><span class="content">2014</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="2" /><span class="content">2012 - 2013</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="3" /><span class="content">2010 - 2011</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="4" /><span class="content">2008 - 2009</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="5" /><span class="content">2006 - 2007</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="6" /><span class="content">2004 - 2005</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="7" /><span class="content">Older than 2005</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>				
				<div class=" pull-left hidden-subcat searchFilter" id="amt_car-main">
					<div id="amt_car" class="inputstyle pointer form-control">
						Price <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_amt_car" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_amt" name="amt" value="<100000" /><span class="content">Less than 1 Lakh</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="100000-200000" /><span class="content">1 - 2 Lakh</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="200000-400000" /><span class="content">2 - 4 Lakh</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="400000-600000" /><span class="content">4 - 6 Lakh</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="600000-800000" /><span class="content">6 - 8 Lakh</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="800000-1000000" /><span class="content">8 - 10 Lakh</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value=">1000000" /><span class="content">Above 10 Lakh</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="amt_bike-main">
					<div id="amt_bike" class="inputstyle pointer form-control">
						Price <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_amt_bike" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_amt" name="amt" value="<15000" /><span class="content">Less than 15,000</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="15000-19999" /><span class="content">15,000 - 19,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="20000-29999" /><span class="content">20,000 - 29,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="30000-39999" /><span class="content">30,000 - 39,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="40000-49999" /><span class="content">40,000 - 49,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="50000-59999" /><span class="content">50,000 - 59,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value=">60000" /><span class="content">Above 60,000</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="amt_cycle-main">
					<div id="amt_cycle" class="inputstyle pointer form-control">
						Price <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_amt_cycle" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_amt" name="amt" value="<1500" /><span class="content">Less than 1,500</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="1500-1999" /><span class="content">1,500 - 1,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="2000-3999" /><span class="content">2,000 - 3,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="4000-5999" /><span class="content">4,000 - 5,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="6000-7999" /><span class="content">6,000 - 7,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value=">8000" /><span class="content">Above 8,000</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>				
				<div class=" pull-left hidden-subcat searchFilter" id="fuelType-main">
					<div id="os" class="inputstyle pointer form-control">Fuel Type <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span></div>
					<div id="subCategory_hidden_fuelType" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_fuelType" name="fuelType" value="Petrol" /><span class="content">Petrol</span></li>
						    <li><input type="checkbox" class="check_fuelType" name="fuelType" value="Diesel" /><span class="content">Diesel</span></li>
							<li><input type="checkbox" class="check_fuelType" name="fuelType" value="Gas" /><span class="content">Gas</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="regState-main">
					<div id="regState" class="inputstyle pointer form-control">
						Reg. State <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_regState" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_regState" name="regState" value="Andhra Pradesh" /><span class="content">Andhra Pradesh</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Arunachal Pradesh" /><span class="content">Arunachal</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Assam" /><span class="content">Assam</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Bihar" /><span class="content">Bihar</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Chandigarh" /><span class="content">Chandigarh</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Chhattisgarh" /><span class="content">Chhattisgarh</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Delhi" /><span class="content">Delhi</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Goa" /><span class="content">Goa</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Gujarat" /><span class="content">Gujarat</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Haryana" /><span class="content">Haryana</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Himachal Pradesh" /><span class="content">Himachal Pradesh</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Jammu and Kashmir" /><span class="content">Jammu Kashmir</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Jharkhand" /><span class="content">Jharkhand</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Karnataka" /><span class="content">Karnataka</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Kerala" /><span class="content">Kerala</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Madhya Pradesh" /><span class="content">Madhya Pradesh</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Maharashtra" /><span class="content">Maharashtra</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Manipur" /><span class="content">Manipur</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Meghalaya" /><span class="content">Meghalaya</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Mizoram" /><span class="content">Mizoram</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Nagaland" /><span class="content">Nagaland</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Odisha" /><span class="content">Odisha</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Puducherry" /><span class="content">Puducherry</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Punjab" /><span class="content">Punjab</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Rajasthan" /><span class="content">Rajasthan</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Sikkim" /><span class="content">Sikkim</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Tamil Nadu" /><span class="content">Tamil Nadu</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Telangana" /><span class="content">Telangana</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Tripura" /><span class="content">Tripura</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Uttar Pradesh" /><span class="content">Uttar Pradesh</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="Uttarakhand" /><span class="content">Uttarakhand</span></li>
							<li><input type="checkbox" class="check_regState" name="regState" value="West Bengal" /><span class="content">West Bengal</span></li>
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
