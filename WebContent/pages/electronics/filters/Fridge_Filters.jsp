
<div class=" header_2 clearfix col-md-9">
	<%@include file="/BreadCrumb.jsp" %>
	<!--s:if test="adList.size() > 0"-->
		<div class="col-md-12 filter_cat">
			<form class="form-inline" id="mobile">
				<div class=" pull-left hidden-subcat searchFilter" id="brand-main">
					<div id="brand" class="inputstyle pointer form-control">
						Make <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_brand" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_brand" name="brand" value="Godrej" /><span class="content">Godrej</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="LG" /><span class="content">LG</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Onida" /><span class="content">Onida</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Whirlpool" /><span class="content">Whirlpool</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Samsung" /><span class="content">Samsung</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Videocon" /><span class="content">Videocon</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Others" /><span class="content">Others</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="year-main">
					<div id="year" class="inputstyle pointer form-control">
						Age <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_year" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_year" name="year" value="0.5" /><span class="content">&lt; 1 year</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="1.5" /><span class="content">1 - 2 years</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="2.5" /><span class="content">2 - 3 years</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="3.5" /><span class="content">3 - 4 years</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="4.5" /><span class="content">4 - 5 years</span></li>
							<li><input type="checkbox" class="check_year" name="year" value="5.5" /><span class="content">&gt; 5 years</span></li>
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
						    <li><input type="checkbox" class="check_amt" name="amt" value="<4999" /><span class="content">Less than 5,000</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="5000-9999" /><span class="content">5,000 - 9,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="10000-14999" /><span class="content">10,000 - 14,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="15000-19999" /><span class="content">15,000 - 19,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="20000-25000" /><span class="content">20,000 - 25,000</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value=">25000" /><span class="content">Above 25,000</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="doubleDoor-main">
					<div id="doubleDoor" class="inputstyle pointer form-control">No. of Doors <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span></div>
					<div id="subCategory_hidden_doubleDoor" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_playerType" name="doubleDoor" value="N" /><span class="content">Single Door</span></li>
						    <li><input type="checkbox" class="check_playerType" name="doubleDoor" value="Y" /><span class="content">Double Door</span></li>
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

