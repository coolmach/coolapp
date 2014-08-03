<div class=" header_2">

    <%@include file="/BreadCrumb.jsp" %>
    
	<div class="col-md-12 filter_cat" >
	  <div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div>
		<!-- <div class="form-group pull-left searchFilter" id="sub-main" style="margin-left:4.5%;">
			<div id="subCategory" class="inputstyle pointer form-control">
			Type<span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck" style="display: none;">
				<ul class="list-unstyled">
					<li value="1"><span class="content">Cars</span></li>
					<li value="2"><span class="content">Bikes/Scooters</span></li>
				</ul>
			</div>
		</div> -->
		
	 <form class="form-inline" id="cars"> 
			<div class=" pull-left hidden-subcat searchFilter" id="make-main">
				<div id="make" class="inputstyle pointer form-control">
					Make<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_make" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_make" name="make" value="MAR"/><span class="content">Maruti Suzuki</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="HYU"/><span class="content">Ford</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="FORD"/><span class="content">Fiat</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="HON"/><span class="content">Honda</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="HYU"/><span class="content">Hyundai</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="MAH"/><span class="content">Mahindra</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="CHE"/><span class="content">Chevrolet</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="NIS"/><span class="content">Nissan</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="REN"/><span class="content">Renault</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="SKO"/><span class="content">Skoda</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="TATA"/><span class="content">Tata</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="TOY"/><span class="content">Toyota</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="VOL"/><span class="content">Volkswagen</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="OTH"/><span class="content">Others</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="makeBikes-main">
				<div id="makeBikes" class="inputstyle pointer form-control">
					Make<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_makeBikes" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
					<li><input type="checkbox" class="check_brandBikes" name="make" value="BAJ" /><span class="content">Bajaj</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="make" value="HER" /><span class="content">Hero Honda</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="make" value="HON" /><span class="content">Honda</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="make" value="ROY" /><span class="content">Royal Enfield</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="make" value="TVS" /><span class="content">TVS</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="make" value="YAM" /><span class="content">Yamaha</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="make" value="LML" /><span class="content">LML</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="make" value="SUZ" /><span class="content">Suzuki</span></li>
			        <li><input type="checkbox" class="check_brandBikes" name="make" value="Others" /><span class="content">Others</span></li>													
					</ul>
			
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="automobileModel-main">
				<div id="automobileModel" class="inputstyle pointer form-control">
					Model <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_automobileModel" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_automobileModel" name="automobileModel" value="M1"/><span class="content">Model 1</span></li>
						<li><input type="checkbox" class="check_automobileModel" name="automobileModel" value="M2"/><span class="content">Model 2</span></li>
						<li><input type="checkbox" class="check_automobileModel" name="automobileModel" value="M3"/><span class="content">Model 3</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="fuelType-main">
				<div id="fuelType" class="inputstyle pointer form-control">
					Fuel Type <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_fuelType" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_fuelType" name="fuelType" value="P"/><span class="content">Petrol</span></li>
						<li><input type="checkbox" class="check_fuelType" name="fuelType" value="D"/><span class="content">Diesel</span></li>
						<li><input type="checkbox" class="check_fuelType" name="fuelType" value="C"/><span class="content">CNG</span></li>
					</ul>
				</div>
			</div>
			
			<div class=" pull-left hidden-subcat searchFilter" id="year-main">
				<div id="year" class="inputstyle pointer form-control">
					Year<span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_year" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2005" /><span class="content">2005</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2006" /><span class="content">2006</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2007" /><span class="content">2007</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2008" /><span class="content">2008</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2009" /><span class="content">2009</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2010" /><span class="content">2010</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2011" /><span class="content">2011</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2012" /><span class="content">2012</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2013" /><span class="content">2013</span>
						</li>
						<li><input type="checkbox" class="check_year" name="yearOfMake" value="2014" /><span class="content">2014</span>
						</li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					Price<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
					    <li><input type="checkbox" class="check_amt" name="amt" value="<100000" /><span class="content"><10,0000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="100000-500000" /><span class="content">1,00000-5,00000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">500000" /><span class="content">>5,00000</span>
						</li>
					</ul>
				</div>
			</div>
		 </form> 
	</div>
	<div class="col-md-11 selected_filters" style="display:none;" id="filterValueBar"></div>
	
	<%@include file="/Pagination.jsp" %>
</div>