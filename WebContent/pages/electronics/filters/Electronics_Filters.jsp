
<div class=" header_2">
	<%@include file="/BreadCrumb.jsp" %>
	<s:if test="adList.size() > 0">
		<div class="col-md-12 col-md-offset-3 filter_cat">
			<form class="form-inline" id="mobile">
				<div class=" pull-left hidden-subcat searchFilter" id="brand-main">
					<div id="brand" class="inputstyle pointer form-control">
						Make <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_brand" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_brand" name="brand" value="Akai" /><span class="content">Akai</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="LG" /><span class="content">LG</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Onida" /><span class="content">Onida</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Panasonic" /><span class="content">Panasonic</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Philips" /><span class="content">Philips</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Samsung" /><span class="content">Samsung</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Sansui" /><span class="content">Sansui</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Sharp" /><span class="content">Sharp</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Sony" /><span class="content">Sony</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Toshiba" /><span class="content">Toshiba</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Videocon" /><span class="content">Videocon</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="screenType-main">
					<div id="screenType" class="inputstyle pointer form-control">
						Model <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_screenType" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu">
							<li><input type="checkbox" class="check_brand" name="brand" value="CRT" /><span class="content">CRT</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="LCD" /><span class="content">LCD</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="LED" /><span class="content">LED</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Plasma" /><span class="content">Plasma</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="4K" /><span class="content">4K</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="3D" /><span class="content">3D</span></li>
						</ul>
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
			</form>
		</div>
		<div class="col-md-11 col-md-offset-3 selected_filters" style="display:none;" id="filterValueBar">
		<div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div>
	</div>
	</s:if>
	<!-- %@include file="/Pagination.jsp" %-->
</div>

<script>

</script>