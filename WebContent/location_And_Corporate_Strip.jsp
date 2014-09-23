
<div id="locationSection">
        <div class="heading">
			Search By Location
        </div>
	<div id="cityBar">
		<form id="cityForm">
			<input type="radio" class="radioButton" checked="checked" name="city" id="city" value="BLR" onClick="applyFilters()"><span class="radioCaption">Bangalore</span>
			<input type="radio" class="radioButton" name="city" id="city" value="CHE" onClick="applyFilters()"><span class="radioCaption_RightAlign">Chennai</span>
		</form>
	</div>
	<div id="locationSearchBar">
		<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="locSearch" id="locSearch">
		<img class="searchIcon" src="images/search_green_resized.png">	
	</div>
	<div id="locationDetails" style="display:none;">

	</div>
</div>

<div id="companySection">
        <div class="heading">
			Search By Company
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
				<a class="smallLink_Yellow" onClick="resetCorporateFilter()"><span class="glyphicon glyphicon-remove"></span></a>
			</div>
		</div>
	</div>
</div>
	