<div class=" header_2" style="overflow:hidden;">
	<%@include file="/BreadCrumb.jsp" %>
	<s:if test="adList.size() > 0">
		<div class="col-md-12 filter_cat">
			<form class="form-inline" id="comp">	
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
				<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
					<div id="amt" class="inputstyle pointer form-control">
						Price <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_amt" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_amt" name="amt" value="<3000" /><span class="content">Less than 3,000</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="3000-4999" /><span class="content">3,000 - 4,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="5000-7999" /><span class="content">5,000 - 7,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value="8000-9999" /><span class="content">8,000 - 9,999</span></li>
							<li><input type="checkbox" class="check_amt" name="amt" value=">10000" /><span class="content">Above 10,000</span></li>
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
