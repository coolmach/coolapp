<div class=" header_2">

<%@include file="/BreadCrumb.jsp" %>
<s:if test="adList.size() > 0">
	<div class="col-md-12 filter_cat" >
	  <div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div>
	
	 <form class="form-inline" id="cars"> 
			<!-- <div class=" pull-left hidden-subcat searchFilter" id="make-main">
				<div id="make" class="inputstyle pointer form-control">
					Make <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_make" class="subCategory_hidden_bck" style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_make" name="make" value="SON"/><span class="content">Sony</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="ACE"/><span class="content">Acer</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="DELL"/><span class="content">Dell</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="HP"/><span class="content">HP/Compaq</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="SAM"/><span class="content">Samsung</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="WIP"/><span class="content">Wipro</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="HCL"/><span class="content">HCL</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="APP"/><span class="content">Apple</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="OTH"/><span class="content">Others</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div> -->

			<!-- <div class=" pull-left hidden-subcat searchFilter" id="year-main">
				<div id="year" class="inputstyle pointer form-control">
					Year <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_year" class="subCategory_hidden_bck" style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
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
			</div> -->
			<!-- <div class=" pull-left hidden-subcat searchFilter" id="model-main">
				<div id="model" class="inputstyle pointer form-control">
					Model <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_model" class="subCategory_hidden_bck" style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_model" name="model" value="IPAD" /><span class="content">iPad</span></li>
						<li><input type="checkbox" class="check_model" name="model" value="GALAXY" /><span class="content">Galaxy</span></li>
						<li><input type="checkbox" class="check_model" name="model" value="OTHERS" /><span class="content">Others</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div> -->				
			<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					Price<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
					    <li><input type="checkbox" class="check_amt" name="amt" value="<15000" /><span class="content"><15,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="15000-30000" /><span class="content">15,000-30,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">50000" /><span class="content">>50,000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
		 </form> 
	</div>
	<div class="col-md-11 selected_filters" style="display:none;" id="filterValueBar"></div>
	</s:if>
	<%@include file="/Pagination.jsp" %>
</div>