<div class=" header_2">
	<div class="col-md-12 filter_cat" style="margin-top:3.86%;">
	  <div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div>
 
	 <form class="form-inline" id="airCooler"> 
			<!-- <div class=" pull-left hidden-subcat searchFilter" id="type-main">
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
			</div> -->
			<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					Price<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
					    <li><input type="checkbox" class="check_amt" name="amt" value="<5,000" /><span class="content"><5,000</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value="5,000-10,000" /><span class="content">5,000 - 10,0000</span></li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">10,000" /><span class="content">>15,000</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="year-main">
				<div id="year" class="inputstyle pointer form-control">
					Year <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_year" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_year" name="yearStr" value="2005" /><span class="content">2005</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2006" /><span class="content">2006</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2007" /><span class="content">2007</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2008" /><span class="content">2008</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2009" /><span class="content">2009</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2010" /><span class="content">2010</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2011" /><span class="content">2011</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2012" /><span class="content">2012</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2013" /><span class="content">2013</span></li>
						<li><input type="checkbox" class="check_year" name="yearStr" value="2014" /><span class="content">2014</span></li>
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
		<span id="breadCrumb_Category_1">Furniture </span> > 
		<span id="breadCrumb_SubCategory"><s:property value="subCategoryStr" /></span>
	</div>
	
	<%@include file="Pagination.jsp" %>
</div>