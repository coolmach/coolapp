
$(document).ready(function(){
	var ctxPath = $('#context_path').val().trim();
	$("#locSearch").autocomplete({
		source: function(request, response) {
			$.ajax({
				//url: "http://localhost:8080/Virat/getLocation?city=BLR",
				//url:$('#context_path').text() + "/getLocation",
				url:ctxPath + "/getLocation",
				type: "POST",
				dataType: "json",
				//data: {location:$("#locSearch").val()},
				data: {city:$('input[name=city]:checked').val(),location:$("#locSearch").val()},
				success: function(data) {
					response( $.map(data, function(item) {
						return {
							label: item.value,
							value: item.id
						};
					}));
				},
				error: function (error) {
					alert('error: ' + error.responseText);
				}
			});
		},
		select:function(event, ui){
			event.preventDefault();
			$.ajax({
				//url:"http://localhost:8080/Virat/getNeighbor?city=BLR&location=" + ui.item.value,
				//url:$('#contextPath').text() + "/getNeighbor",
				url:ctxPath + "/getNeighbor",
				type:"POST",
				data: {city:$('input[name=city]:checked').val(),location:ui.item.value},
				success:function(data){
					$("#locationDetails").html(data);
					$("#locationDetails").show();
					$("#location").attr("checked", "true");
					//alert("common.js - 1");
					applyFilters();
				},
				error:function(data){
					alert(data.responseText);
				}
			});
		},
		minLength: 2
	});
});

$(document).ready(function(){
	var ctxPath = $('#context_path').val().trim();
	$("#corpSearchString").autocomplete({
		source: function(request, response) {
			$.ajax({
				//url: "http://localhost:8080/Virat/getLocation?city=BLR",
				//url:$('#context_path').text() + "/getLocation",
				url:ctxPath + "/autoSuggestCorp",
				type: "POST",
				dataType: "json",
				//data: {location:$("#locSearch").val()},
				data: {corpSearchString:$("#corpSearchString").val()},
				success: function(data) {
					response( $.map(data, function(item) {
						return {
							label: item.description,
							value: item.id
						};
					}));
				},
				error: function (error) {
					alert('error: ' + error.responseText);
				}
			});
		},
		select:function(event, ui){
			event.preventDefault();
			$("#corpSearchString").val(ui.item.label);
			//content = "<div id='corpCheckBoxSection' class='checkboxColumn'><input type='checkbox' class='check_corpId checkbox' name='corpId' id='corpId' value='" + ui.item.value + "'></div>";
			//$("#corpCheckBoxSection").html(content);
			content = "<div id='corpNameSection' class='checkboxCaptionColumn'><span class='radioCaptionWithoutSpace'>" + ui.item.label + "</span></div>";
			$("#corpNameSection").html(content);
			$("#selectedCorporateDetails").show();
			$("#corpId").val(ui.item.value);
			//alert("common.js - 2");
			applyFilters();
		},
		minLength: 2
	});

	
});

function applyFilters(){
	//alert("applyFilters()");
	var ctxPath = $('#context_path').val().trim();
	var path = $("#action").val();
	
	subCat = $('#sub').text();
	cat = $('#cat').text();
	var data="";
	data = data + '&subCategory='+subCat+'&category='+cat;
	
	
	
	var str="";
	$("input[class^=check_]:checked").each(function()
	{		 
		var sub = $(this).attr('name');
		data = data + '&'+sub+'='+$(this).val();
		var check = $(this).parent().children('span.content').text();
		var div_Id = check.replace(/\s+/g, '').replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
		str = str+'<div style="margin-left:12px;" class="pull-left filters" id="'+div_Id+'">'+check+'<span style="margin-left:4px;" class="glyphicon glyphicon-remove form-control-show"id="'+div_Id+'">'+'</span>'+'</div >';
			});

	$('.selected_filters').html(str);

	if (typeof $("input[name=city]:checked", "#cityForm").val() != "undefined") {
		data = data + "&city=" + $("input[name=city]:checked", "#cityForm").val();
	}

	if($("#corpId").val() != "" && data.indexOf("corpId", 0)<0){
		data = data + "&corpId=" + $("#corpId").val();
	}

	if($("#item_search").val() != "" && data.indexOf("searchKeyword", 0)<0){
		data = data + "&searchKeyword=" + $("#item_search").val();
	}

	//Pagination
	if(typeof $("#currentPage") != undefined && $("#currentPage").val() != "" && $("#currentPage").val() != undefined){
		data = data + "&currentPage=" + $("#currentPage").val();
	}
	if(typeof $("#requestedPage") != undefined && $("#requestedPage").val() != "" && $("#requestedPage").val() != undefined){
		data = data + "&requestedPage=" + $("#requestedPage").val();
	}
	
	
	if($("#filterValueBar").text() == ""){
		$("#filterValueBar").hide();
	}

	$.ajax({
		type: 'POST',
		url: ctxPath+"/"+path, 
		data: data,
		success: function(data, status) {
			
			$('.data').html('');
			$('.data').replaceWith(data);

			var pC = parseInt($('#pagecount').val())/10;

			if(pC % 1 != 0){
				pC = (Math.floor(pC))+1;
			}

			$( ".pager li" ).eq(1).html( '<input class="hidden" id="page_info" type="text" readonly="readonly" value="Showing Page '+ (pC==0?pC:1) +' of '+pC+'" >' );


			if(pC<=1)
			{$( ".pager li" ).eq(2).addClass('hidden');
			$( ".pager li" ).eq(0).addClass('hidden');
			}
			else
			{$( ".pager li" ).eq(2).removeClass('hidden');
			$( ".pager li" ).eq(0).addClass('hidden');}
		}
	});
	

	
	
	//REAL ESTATE - Populating the items in Real Estate Filters (Approval Authority)
	if($("#approvalAuthorityFilter").length){ //That is, the filter element exists
		$("#approvalAuthorityFilter").html("");
		
		if (typeof $("input[name=city]:checked", "#cityForm").val() != "undefined") {
			city = $("input[name=city]:checked", "#cityForm").val();
		}
		
		
		var items = [];
		if(city == 'CHE'){
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='CMDA' /><span class='content'>CMDA</span>");
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='CCMP' /><span class='content'>CCMP</span>");
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='Others' /><span class='content'>Others</span>");
		}else if(city == 'BLR'){
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='DC' /><span class='content'>Dist. Commissioner</span>");
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='BDA' /><span class='content'>BDA</span>");
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='BMRDA' /><span class='content'>BMRDA</span>");
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='BBMP' /><span class='content'>BBMP</span>");
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='Others' /><span class='content'>Others</span>");
		}else{
			items.push("<li><input type='checkbox' class='check_approval' name='approvalAuthority' value='Others' /><span class='content'>Others</span>");
		}
		$('#approvalAuthorityFilter').append( items.join('') );
	}
}






	//if user clicks on Clear Filter in Location bar in Ad List page
	function resetLocationFilter() {
	
		//$("#filterValueBar").show();
		$('input[class^=check_location]').attr("checked", false);
	
		subCat = $('#sub').text();
		cat = $('#cat').text();
	
		//alert("common.js - 3");
		
		applyFilters();	
		
		clearLocations();
	}

	function clearLocations(){
		$("#locationListBar").html("");
		$("#horizontalSeparator").html("");
		$("#neighborhoodLocationBar").html("");
		
		$("#locSearch").val("-1");
	}
	
	function resetCorporateFilter() {
	
		//$("#filterValueBar").show();
		//$('input[class^=check_corpId]').attr("checked", false);
		$("#corpId").val("");
	
		subCat = $('#sub').text();
		cat = $('#cat').text();
	
		//alert("common.js - 4");
		
		applyFilters();	
	
		$("#corpSearchString").val("");
		$("#selectedCorporateDetails").hide();
	}

	function getSubCategory() {
		var category = $("#category").val();
		$("#subCategory").html("");
		if (category == "REAL") {
			var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8];
			var values = [ '0', '1', '2', '3', '4' ,'5', '6', '7'];
			var options = [ 'Select', 'Apartment for Sale', 'Apartment for Rent',
			                'Individual House for Sale', 'Individual House for Rent', 'PG Accommodation', 'Land For Sale', 'Roommate Required'];
		} else if (category == "AUTO") {
			var numbers = [ 1, 2, 3];
			var values = [ '0', '1', '2'];
			var options = [ 'Select', 'Cars', 'Bikes/Scooters'];
		} else if (category == "COMP") {
			var numbers = [ 1, 2, 3, 4];
			var values = [ '0', '1', '2', '3' ];
			var options = [ 'Select', 'Desktops', 'Laptops', 'Tablets' ];
		} else if (category == "MOBILE") {
			var numbers = [ 1, 2];
			var values = [ '0', '1'];
			var options = [ 'Select', 'Mobile Phones'];
		}else if (category == "ELEC") {
			var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8 ];
			var values = [ '0', '1', '2', '3', '4', '5', '6', '7' ];
			var options = [ 'Select', 'Television', 'DVD/Music Player/iPod', 'Digital Camera/Camcorder', 'Fridge', 'AC', 'Washing Machine', 'Others' ];
		}else if (category == "FURN") {
			var numbers = [ 1, 2 ];
			var values = [ '0', '1' ];
			var options = [ 'Select', 'All Furnitures' ];
		}
		var index = 0;
		$.each(numbers, function(val, text) {
			$('#subCategory').append(
					$('<option class="optionListItem"></option>').val(values[index]).html(options[index]));
			index = index + 1;
		});
	}

	function submitForm(){
		$("#categoryForm").submit();
	}

	
	function doubleToString(double_input){
		return  double_input.toString();
	}
	
	function getBaseUrl(){
		var url = document.URL;
		//url --> http://localhost:8080/Virat/realestate?category=REAL&subCategory=1
		var baseUrl = url.substring(0, url.lastIndexOf('/'));
	    var dot = baseUrl.lastIndexOf('.');
	    if(dot != -1){
			baseUrl = baseUrl.substring(0, dot);
	    }
	    baseUrl = baseUrl + "/";
	    return baseUrl;
	}