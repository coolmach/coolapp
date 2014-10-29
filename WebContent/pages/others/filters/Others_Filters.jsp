
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
							<li><input type="checkbox" class="check_brand" name="brand" value="Sony" /><span class="content">Sony</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Nokia" /><span class="content">Nokia</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Samsung" /><span class="content">Samsung</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Micromax" /><span class="content">Micromax</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Apple" /><span class="content">Apple</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="LG" /><span class="content">LG</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Motorola" /><span class="content">Motorola</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Videocon" /><span class="content">Videocon</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="HTC" /><span class="content">HTC</span></li>
							<li><input type="checkbox" class="check_brand" name="brand"value="Lenovo" /><span class="content">Lenovo</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Blackberry" /><span class="content">Blackberry</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="MTS" /><span class="content">MTS</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Tata" /><span class="content">Tata</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Spice" /><span class="content">Spice</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Acer" /><span class="content">Acer</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Acer" /><span class="content">Acer</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Xolo" /><span class="content">Xolo</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Karbonn" /><span class="content">Karbonn</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Intex" /><span class="content">Intex</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Fly" /><span class="content">Fly</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Lava" /><span class="content">Lava</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Maxx" /><span class="content">Maxx</span></li>
							<li><input type="checkbox" class="check_brand" name="brand" value="Others" /><span class="content">Others</span></li>
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
				<!--div class=" pull-left hidden-subcat searchFilter" id="mobilemodel-main">
					< %@include file="/mobileModels.jsp"%>
				</div-->
				<div class=" pull-left hidden-subcat searchFilter" id="year-main">
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
				<div class=" pull-left hidden-subcat searchFilter" id="operatingSystem-main">
					<div id="os" class="inputstyle pointer form-control">Operating System <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span></div>
					<div id="subCategory_hidden_operatingSystem" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
						    <li><input type="checkbox" class="check_os" name="operatingSystem" value="Android" /><span class="content">Android</span></li>
						    <li><input type="checkbox" class="check_os" name="operatingSystem" value="Symbian(Nokia)" /><span class="content">Symbian (Nokia)</span></li>
							<li><input type="checkbox" class="check_os" name="operatingSystem" value="Apple-iOS" /><span class="content">Apple - iOS</span></li>
							<li><input type="checkbox" class="check_os" name="operatingSystem" value="Windows" /><span class="content">Windows</span></li>
							<li><input type="checkbox" class="check_os" name="operatingSystem" value="Blackberry" /><span class="content">Blackberry</span></li>
							<li><input type="checkbox" class="check_os" name="operatingSystem" value="Other" /><span class="content">Others</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="sims-main">
					<div id="sims" class="inputstyle pointer form-control">
						No. of Sims <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_sims" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_sims" name="dualSim" value="N" /><span class="content">Single Sim</span></li>
							<li><input type="checkbox" class="check_sims" name="dualSim" value="Y" /><span class="content">Dual Sim</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat searchFilter" id="touchScreen-main">
					<div id="touchScreen" class="inputstyle pointer form-control">
						Touch Screen <span
							class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
					</div>
					<div id="subCategory_hidden_touchScreen" class="subCategory_hidden_bck"
						style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_touchScreen" name="touchScreen" value="Y" /><span class="content">Touch</span></li>
							<li><input type="checkbox" class="check_touchScreen" name="touchScreen" value="N" /><span class="content">Non-Touch</span></li>
						</ul>
						<a href="#" class="clear blue_link">clear filters</a>
					</div>
				</div>
				<div class=" pull-left hidden-subcat" id="accessoryType-main">
					<div id="accessoryType" class="inputstyle pointer form-control"> Accessory Type <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span></div>
					<div id="subCategory_hidden_accessoryType" class="subCategory_hidden_bck" style="display: none;">
						<ul class="dropdown-menu scrollable-menu" role="menu">
							<li><input type="checkbox" class="check_type" name="accessoryType" value="Bluetooth Headset" /><span class="content">Bluetooth Headset</span></li>
							<li><input type="checkbox" class="check_type" name="accessoryType" value="Case/Cover" /><span class="content">Case/Cover</span></li>
							<li><input type="checkbox" class="check_type" name="accessoryType" value="Charger" /><span class="content">Charger</span></li>
							<li><input type="checkbox" class="check_type" name="accessoryType" value="Earphones" /><span class="content">Earphones</span></li>
							<li><input type="checkbox" class="check_type" name="accessoryType" value="Headphones" /><span class="content">Headphones</span></li>
							<li><input type="checkbox" class="check_type" name="accessoryType" value="Memory Card" /><span class="content">Memory Card</span></li>
							<li><input type="checkbox" class="check_type" name="accessoryType" value="Others" /><span class="content">Others</span></li>
							
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