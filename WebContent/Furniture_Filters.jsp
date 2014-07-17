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
			<div class=" pull-left hidden-subcat searchFilter" id="type-main">
				<div id="brand" class="inputstyle pointer form-control">
					Type<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_type" class="subCategory_hidden_bck">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_type" name="type" value="COT_WOOD"/><span class="content">Cot - Wooden</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="COT_STEEL"/><span class="content">Cot - Steel</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="MATTRESS"/><span class="content">Mattress</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="DINING"/><span class="content">Dining Table</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="SHOE"/><span class="content">Shoe Rack</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="TV"/><span class="content">TV Stand</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="TABLE"/><span class="content">Table</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="CHAIR_WOOD"/><span class="content">Chair - Wood</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="CHAIR_PLASTIC"/><span class="content">Chair - Plastic</span></li>
						<li><input type="checkbox" class="check_type" name="type" value="OTHERS"/><span class="content">Others</span></li>
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
		<span id="breadCrumb_Category_1">Furniture</span>
	</div>
</div>