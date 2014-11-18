
<div class=" header_2" style="overflow:hidden;">
	<%@include file="/BreadCrumb.jsp" %>
	<s:if test="adList.size() > 0">
		<div class="col-md-12 filter_cat">
			<form class="form-inline" id="electronics">
				<div class=" pull-left hidden-subcat searchFilter" id="subCategoryFilterStr-main">
					<div id="subCategoryFilterStr" class="inputstyle pointer form-control">
						Appliance Type <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_subCategoryFilterStr" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_subCategoryFilterStr" name="subCategoryFilterStr" value="1" /><span class="content">Televisions</span></li>
							<li><input type="checkbox" class="check_subCategoryFilterStr" name="subCategoryFilterStr" value="2" /><span class="content">DVD / MP3 Players, iPods</span></li>
							<li><input type="checkbox" class="check_subCategoryFilterStr" name="subCategoryFilterStr" value="3" /><span class="content">Cameras, Camcorders</span></li>
							<li><input type="checkbox" class="check_subCategoryFilterStr" name="subCategoryFilterStr" value="4" /><span class="content">Fridges</span></li>
							<li><input type="checkbox" class="check_subCategoryFilterStr" name="subCategoryFilterStr" value="5" /><span class="content">Washing Machines</span></li>
							<li><input type="checkbox" class="check_subCategoryFilterStr" name="subCategoryFilterStr" value="6" /><span class="content">Air Coolers, Air Conditioners</span></li>
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