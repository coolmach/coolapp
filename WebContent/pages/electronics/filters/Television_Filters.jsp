<div class=" header_2">

<%@include file="/BreadCrumb.jsp" %>
<s:if test="adList.size() > 0">
	<div class="col-md-12 filter_cat" >
	  <div id="clear_all_f" class="pull-left pointer" style="text-decoration: underline;color:#4f00fc">clear all</div> 
	 <form class="form-inline" id="television"> 
			<div class=" pull-left hidden-subcat searchFilter" id="make-main">
				<div id="make" class="inputstyle pointer form-control">
					Make<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_make" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_make" name="make" value="Sony"/><span class="content">Sony</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="Samsung"/><span class="content">Samsung</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="Videocon"/><span class="content">Videocon</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="LG"/><span class="content">LG</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="Philips"/><span class="content">Philips</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="Onida"/><span class="content">Onida</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="Toshiba"/><span class="content">Toshiba</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="BPL"/><span class="content">BPL</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="screenType-main">
				<div id="screenType" class="inputstyle pointer form-control">
					Screen Type<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_screenType" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_screenType" name="screenType" value="LCD" /><span class="content">LCD TV</span></li>
						<li><input type="checkbox" class="check_screenType" name="screenType" value="LED" /><span class="content">LED TV</span></li>
						<li><input type="checkbox" class="check_screenType" name="screenType" value="CRT" /><span class="content">Normal (CRT) TV</span></li>
					</ul>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="year-main">
				<div id="year" class="inputstyle pointer form-control">
					Year<span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
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
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					Price<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
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