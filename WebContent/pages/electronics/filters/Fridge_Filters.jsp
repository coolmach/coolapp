<div class=" header_2">

<%@include file="/BreadCrumb.jsp" %>
<s:if test="adList.size() > 0">
	<div class="col-md-12 filter_cat" >
	  <div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div>
	 <form class="form-inline" id="fridge"> 
			<div class=" pull-left hidden-subcat searchFilter" id="brand-main">
				<div id="brand" class="inputstyle pointer form-control">
					Brand<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_brand" class="subCategory_hidden_bck" style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
						<li><input type="checkbox" class="check_brand" name="brand" value="LG"/><span class="content">LG</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Samsung"/><span class="content">Samsung</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Whirlpool"/><span class="content">Whirlpool</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="IFB"/><span class="content">IFB</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Videocon"/><span class="content">Videocon</span></li>
						<li><input type="checkbox" class="check_brand" name="brand" value="Kelvinator"/><span class="content">Kelvinator</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="year-main">
				<div id="year" class="inputstyle pointer form-control">
					Year<span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
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
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					Price<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck" style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
					    <li><input type="checkbox" class="check_amt" name="amt" value="<15000" /><span class="content"><15,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="15000-30000" /><span class="content">15,000-30,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">50000" /><span class="content">>50,000</span>
						</li>
					</ul>
				</div>
			</div>
		 </form> 
	</div>
	<div class="col-md-11 selected_filters" style="display:none;" id="filterValueBar"></div>
	</s:if>
	<%@include file="/Pagination.jsp" %>
</div>