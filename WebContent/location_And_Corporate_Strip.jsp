
<div id="locationSection">
        <div class="heading">
			Search By Location
        </div>
	<div id="cityBar">
		<form id="cityForm">
			<input type="radio" class="radioButton" checked="checked" name="city" id="city" value="BLR" onClick="applyFiltersForLocation('BLR')"><span class="radioCaption">Bangalore</span>
			<input type="radio" class="radioButton" name="city" id="city" value="CHE" onClick="applyFiltersForLocation('CHE')"><span class="radioCaption_RightAlign">Chennai</span>
		</form>
	</div>
	<div id="locationSearchBar">
		<select class="dropDown" name="locSearch" id="locSearch" style="width:200px;">
			<option value='-1'>Choose Location</option>
		</select>
		<!--img class="searchIcon" src="images/search_green_resized.png"-->	
	</div>
	<div id="locationDetails" style="display:none;">
	</div>
</div>

<div id="companySection">
        <div class="heading">
			Search By Company
        </div>
	<div id="companySearchBar">
		<select class="dropDown" name="corpSearchString" id="corpSearchString" style="width:200px;">
			<option value='-1'>Choose Company</option>
		</select>
		<!--img class="searchIcon" src="images/search_orange_resized.png"-->
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
	
	
<script>
function applyFilters_Loc(city){
	$.ajax({
		url: "Virat" + "/searchPostsFilter?",
		//url:$('#contextPath').text() + "getLocation",
		type: "POST",
		//dataType: "json",
		data: {searchKeyword:$("#item_search").val(), city:city, location:$("#locSearch").val(), corpId:$("#corpSearchString").val()},
		success: function(data) {
			console.log(data);
			$('.data').html('');
			$('.data').html(data);
		},
		error: function (error) {
			console.log(error);
			alert('error: ' + error.responseText);
		}
	});
}

function reapplyFilters(city){
	if($("#item_search").val() != ""){
		//If the list screen is a common list screen (AdList_SearchResults) for a keyword search, then applyFilters_Loc() should be called.
		applyFilters_Loc(city);
	}else{
		//If the list screen is specific to a Cateogry (e.g. AdList_Automobiles), then applyFilters() should be called.
		applyFilters();
	}
}
function getCompanies(){
	//alert("location - 1");
	//applyFilters();	
	$.ajax({
		url:"getCompanies",
		data:{},
		dataType:'json',
		type:'POST',
		success:function(res){
			$("#corpSearchString").html("");
			$("#corpSearchString").append("<option value='-1'>Choose Company</option>");
			for(var key in res.companyMap){
				if (res.companyMap.hasOwnProperty(key)) {
					optionStr = "<option value='" + key + "'>" + res.companyMap[key] + "</option>";
					$("#corpSearchString").append(optionStr);
	            }
			}
		}
	});
}
function updateCompanySection(companyName, companyId){
	$("#corpSearchString").val(companyId);
	//content = "<div id='corpCheckBoxSection' class='checkboxColumn'><input type='checkbox' class='check_corpId checkbox' name='corpId' id='corpId' value='" + ui.item.value + "'></div>";
	//$("#corpCheckBoxSection").html(content);
	content = "<div id='corpNameSection' class='checkboxCaptionColumn'><span class='radioCaptionWithoutSpace'>" + companyName + "</span></div>";
	$("#corpNameSection").html(content);
	$("#selectedCorporateDetails").show();
	$("#corpId").val(companyId);
	//alert("location - 2");
	reapplyFilters();
}
function applyFiltersForLocation(city){
	reapplyFilters(city);
	getLocations(city);
}
function getLocations(city){
	//alert("location - 3");
	//applyFilters();	
	
	$("#locationDetails").html(""); 
	
	//Get list of locations to be updated in the drop down
	$.ajax({
		url:"getLocations",
		data:{city:city},
		dataType:'json',
		type:'POST',
		success:function(res){
			$("#locSearch").html("");
			$("#locSearch").append("<option value='-1'>Choose Location</option>");
			for(var key in res.locationMap){
				if (res.locationMap.hasOwnProperty(key)) {
					optionStr = "<option value='" + key + "'>" + res.locationMap[key] + "</option>";
					$("#locSearch").append(optionStr);
	            }
			}
		}
	});
}

function updateNeighborhood(city, location){
	var ctxPath = $('#context_path').val().trim();
	$.ajax({
		//url:"http://localhost:8080/Virat/getNeighbor?city=BLR&location=" + ui.item.value,
		//url:$('#contextPath').text() + "/getNeighbor",
		url: ctxPath + "/getNeighbor",
		type: "POST",
		data: {city:city,location:location},
		success: function(data){
			$("#locationDetails").html(data);
			$("#locationDetails").show();
			$("#location").attr("checked", "true");
			//alert("location - 4");
			reapplyFilters();
		},
		error: function(data){
			alert(data.responseText);
		}
	});
}

$(document).ready(function(){
	getLocations('BLR'); //Populate with Bangalore locations when the page is loaded
	$("#locSearch").off().on("change",function(){
		updateNeighborhood($("input[name=city]:checked").val(), $("#locSearch").val());
	});
	$("#corpSearchString").off().on("change",function(){
		updateCompanySection($("#corpSearchString option:selected").text(), $("#corpSearchString").val());
	});
	getCompanies();
});
</script>