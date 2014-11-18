
<div class=" header_2" style="overflow:hidden;">
	<%@include file="/BreadCrumb.jsp" %>
	<s:if test="adList.size() > 0">
		<div class="col-md-12 filter_cat">
			<form class="form-inline" id="comp">
				<div class=" pull-left hidden-subcat searchFilter" id="make-main">
					<div id="make" class="inputstyle pointer form-control">
						Make <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_make" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_make" name="make" value="Acer"/><span class="content">Acer</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Apple"/><span class="content">Apple</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Compaq"/><span class="content">Compaq</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="HCL"/><span class="content">HCL</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="HP"/><span class="content">HP</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="IBM"/><span class="content">IBM</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Lenovo"/><span class="content">Lenovo</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Sony"/><span class="content">Sony</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Samsung"/><span class="content">Samsung</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="TVS"/><span class="content">TVS</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Wipro"/><span class="content">Wipro</span></li>

							<li><input type="checkbox" class="check_make" name="make" value="Others"/><span class="content">Others</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="tab_make-main">
					<div id="tab_make" class="inputstyle pointer form-control">
						Make <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_tab_make" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_make" name="make" value="Sony"/><span class="content">Sony</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Samsung"/><span class="content">Samsung</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Apple"/><span class="content">Apple</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Micromax"/><span class="content">Micromax</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="Karbon"/><span class="content">Karbon</span></li>

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
				<div class=" pull-left hidden-subcat searchFilter" id="year-main">
					<div id="year" class="inputstyle pointer form-control">
						Age (Years) <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_year" class="subCategory_hidden_bck" style="display: none;">
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
				<div class=" pull-left hidden-subcat searchFilter" id="accessoryType-main">
					<div id="accessoryType" class="inputstyle pointer form-control">
						Accessory Type <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_accessoryType" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_accessoryType" name="accessoryType" value="Pen Drive" /><span class="content">Pen Drive</span></li>
							<li><input type="checkbox" class="check_accessoryType" name="accessoryType" value="Hard Disk" /><span class="content">Hard Disk</span></li>
							<li><input type="checkbox" class="check_accessoryType" name="accessoryType" value="Memory Card" /><span class="content">Memory Card</span></li>
							<li><input type="checkbox" class="check_accessoryType" name="accessoryType" value="Others" /><span class="content">Others</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
					<div id="amt" class="inputstyle pointer form-control">
						Price <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_amt" class="subCategory_hidden_bck"
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
				<div class=" pull-left hidden-subcat searchFilter" id="accessory_amt-main">
					<div id="accessory_amt" class="inputstyle pointer form-control">
						Price <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_accessory_amt" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_amt" name="amt" value="<500" /><span class="content">Less than 500</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="500-999" /><span class="content">500 - 999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="1000-1999" /><span class="content">1,000 - 1,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="2000-2999" /><span class="content">2,000 - 2,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="3000-3999" /><span class="content">3,000 - 3,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="4000-4999" /><span class="content">4,000 - 4,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value=">5000" /><span class="content">Above 5,000</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>				
			</form>
		</div>
		<div class="col-md-11 selected_filters" style="display:none;" id="filterValueBar">
		<div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div>
	</div>
	</s:if>
	<!-- %@include file="/Pagination.jsp" %-->
</div>

<script>

</script>
