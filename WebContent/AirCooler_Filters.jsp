<div class=" header_2">
	<div class="col-md-12 filter_cat" style="margin-top:3.86%;">
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
	 <form class="form-inline" id="airCooler"> 
			<div class=" pull-left hidden-subcat searchFilter" id="brand-main">
				<div id="brand" class="inputstyle pointer form-control">
					Brand<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_brand" class="subCategory_hidden_bck">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_brand" name="brand" value="Sony"/><span class="content">Sony</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Samsung"/><span class="content">Samsung</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Videocon"/><span class="content">Videocon</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="LG"/><span class="content">LG</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Philips"/><span class="content">Philips</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Onida"/><span class="content">Onida</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Toshiba"/><span class="content">Toshiba</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="BPL"/><span class="content">BPL</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="acType-main">
				<div id="acType" class="inputstyle pointer form-control">
					AC Type<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_acType" class="subCategory_hidden_bck">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_acType" name="acType" value="Split" /><span class="content">Split AC</span></li>
						<li><input type="checkbox" class="check_acType" name="acType" value="Window" /><span class="content">Window AC</span></li>
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
						<li><input type="checkbox" class="check_amt" name="amt" value="50000-10000" /><span class="content">5,000 - 10,0000</span></li>
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
		<span id="breadCrumb_SubCategory">Air Coolers / Air Conditioners</span>
	</div>
</div>