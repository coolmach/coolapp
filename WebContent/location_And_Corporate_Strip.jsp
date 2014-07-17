
	<div id="cityBar">
		<form id="cityForm">
			<input type="radio" class="radioButton" name="city" id="city" value="BLR" onClick="applyFilters()"><span class="radioCaption">Bangalore</span>
			<input type="radio" class="radioButton" name="city" id="city" value="CHE" onClick="applyFilters()"><span class="radioCaption_RightAlign">Chennai</span>
		</form>
	</div>
	<div id="locationSearchBar">
		<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="locSearch" id="locSearch">
		<img class="searchIcon" src="images/search_green_resized.png">	
	</div>
	<div id="locationDetails" style="display:none;">

	</div>

	<div id="companySearchBar">
		<input type="text" class="locationTextBox" placeholder="Enter Company (e.g. Infosys)" name="corpSearchString" id="corpSearchString">
		<img class="searchIcon" src="images/search_orange_resized.png">
	</div>	
	<div id="selectedCorporateDetails" style="display:none;">
		<div id="corporateListBar">
			<div id="corporateResultSection">
				<!--div id="corpCheckBoxSection" class="checkboxColumn"><input type="checkbox" class="check_corpId checkbox" name="corpId" id="corpId" value="${selectedCorporate.name}"></div-->
				<input type="hidden" name="corpId" id="corpId">
				<div id="corpNameSection" class=""><span class="radioCaptionWithoutSpace">${selectedCorporate.value}</span></div>
			</div>
			<div id="clearSection">
				<a class="smallLink_Yellow" onClick="resetCorporateFilter()">Clear Filter</a>
			</div>
		</div>
	</div>

<link rel="stylesheet" type="text/css" href="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.css"/>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>	
	