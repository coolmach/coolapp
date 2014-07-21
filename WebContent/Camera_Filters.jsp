<div class=" header_2">
	<div class="col-md-12 filter_cat" >
	  <div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div>
		<div class="form-group pull-left searchFilter" id="sub-main" style="margin-left:4.5%;">
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
		</div>	  
	 <form class="form-inline" id="camera"> 
			<div class=" pull-left hidden-subcat searchFilter" id="brand-main">
				<div id="brand" class="inputstyle pointer form-control">
					Brand<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_brand" class="subCategory_hidden_bck">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_brand" name="brand" value="Sony"/><span class="content">Sony</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Nikon"/><span class="content">Nikon</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Canon"/><span class="content">Canon</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Olympus"/><span class="content">Olympus</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Samsung"/><span class="content">Samsung</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Panasonic"/><span class="content">Panasonic</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Fujifilm"/><span class="content">Fujifilm</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Kodak"/><span class="content">Kodak</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="year-main">
				<div id="year" class="inputstyle pointer form-control">
					Year<span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_year" class="subCategory_hidden_bck">
					<ul class="list-unstyled">
						<li><input type="radio" class="check_year" name="yearOfMake" value="> 2013" /><span class="content">Less than 1 year old</span></li>
						<li><input type="radio" class="check_year" name="yearOfMake" value="2012-2013" /><span class="content">1 - 2 years old</span></li>
						<li><input type="radio" class="check_year" name="yearOfMake" value="2011-2012" /><span class="content">2 - 3 years old</span></li>
						<li><input type="radio" class="check_year" name="yearOfMake" value="2010-2011" /><span class="content">3 - 4 years old</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					Price<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck">
					<ul class="list-unstyled">
					    <li><input type="checkbox" class="check_amt" name="amt" value="<5000" /><span class="content"><5,000</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value="5000-10000" /><span class="content">5,000 - 10,0000</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value="10000-15000" /><span class="content">10,000 - 15,000</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">15000" /><span class="content">Above 15,000</span></li>
					</ul>
				</div>
			</div>
		 </form> 
	</div>
	<div class="col-md-12 selected_filters" style="display:none;" id="filterValueBar"></div>
	
	<div class="col-md-12" id="breadCrumb">
	   <span id="cat" style="display:none"><s:property value="category" /></span>
	   <span id="sub" style="display:none"><s:property value="subCategory" /></span>
	
	<a class="grey_link" href="<s:url action=""  />">Home</a> >
		<span id="breadCrumb_Category_1">Electronics</span> > 
		<span id="breadCrumb_SubCategory">Digital Cameras</span>
	</div>
</div>