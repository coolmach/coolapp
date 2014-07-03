
$(document).ready(function(){
	var ctxPath = $('#context_path').text();

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
	var ctxPath = $('#context_path').text();

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
			applyFilters();
		},
		minLength: 2
	});

	$("#corpName").autocomplete({
		source: function(request, response) {
			$.ajax({
				url:ctxPath + "/autoSuggestCorp",
				type: "POST",
				dataType: "json",
				data: {corpSearchString:$("#corpName").val()},
				success: function(data) {
					response( $.map(data, function(item) {
						return {
							value: item.id,
							label: item.description
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
			$("#corpId").val(ui.item.value);
			$("#corpName").val(ui.item.label);
			$("#selectedCorpName").val(ui.item.label);
		},
		minLength: 2
	});

	function showRegistrationForm(){
		$("#signUpSection").show();
		$("#signInSection").hide();		
		$(".errorMessage").remove();
	}
	function showSignInForm(){
		$("#signUpSection").hide();
		$("#signInSection").show();	
		$(".errorMessage").remove();
	}
});

function applyFilters(){
	var ctxPath = $('#context_path').text();
	//var path = "realestateFilter";
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

	data = data + "&city=" + $("input[name=city]:checked", "#cityForm").val();

	if($("#corpId").val() != "" && data.indexOf("corpId", 0)<0){
		data = data + "&corpId=" + $("#corpId").val();
	}


	if($("#filterValueBar").text() == ""){
		$("#filterValueBar").hide();
	}

	$.ajax({
		type: 'POST',
		url: ctxPath+path, 
		data: data,
		success: function(data, status) {
			$('.data').html('');
			$('.data').html(data);

		}
	});
}


	//if user clicks on Clear Filter in Location bar in Ad List page
	function resetLocationFilter() {
	
		//$("#filterValueBar").show();
		$('input[class^=check_location]').attr("checked", false);
	
		var ctxPath = $('#context_path').text();
		var path = "realestateFilter";
	
		subCat = $('#sub').text();
		cat = $('#cat').text();
	
		applyFilters();	
	
		$("#locationListBar").html("");
		$("#horizontalSeparator").html("");
		$("#neighborhoodLocationBar").html("");
	}

	function resetCorporateFilter() {
	
		//$("#filterValueBar").show();
		//$('input[class^=check_corpId]').attr("checked", false);
		$("#corpId").val("");
	
		var ctxPath = $('#context_path').text();
		var path = "realestateFilter";
	
		subCat = $('#sub').text();
		cat = $('#cat').text();
	
		applyFilters();	
	
		$("#corpSearchString").val("");
		$("#selectedCorporateDetails").hide();
	}

	$("#userEnteredLocationStr").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "http://localhost:8080/Virat/getLocation?",
				//url:$('#contextPath').text() + "getLocation",
				type: "POST",
				dataType: "json",
				data: {city:$('input[name=city]:checked').val(),location:$("#userEnteredLocationStr").val()},
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
			$("#userEnteredLocationStr").val(ui.item.label);
			$("#selectedLocationCode").val(ui.item.value);
			$("#selectedLocationStr").val(ui.item.label);
		},
		minLength: 2
	});

	function getSubCategory() {
		var category = $("#category").val();
		$("#subCategory").html("");
		if (category == "REAL") {
			var numbers = [ 1, 2, 3, 4, 5, 6, 7];
			var values = [ '1', '2', '3', '4' ,'5', '6', '7'];
			var options = [ 'Apartment for Sale', 'Apartment for Rent',
			                'Individual House for Sale', 'Individual House for Rent', 'PG Accommodation', 'Land For Sale', 'Roommate Required'];
		} else if (category == "AUTO") {
			var numbers = [ 1, 2, 3];
			var values = [ '0', '1', '2'];
			var options = [ 'Select', 'Cars', 'Bikes/Scooters'];
		} else if (category == "COMP") {
			var numbers = [ 1, 2, 3];
			var values = [ '1', '2', '3' ];
			var options = [ 'Select', 'Desktops', 'Laptops', 'Tablets' ];
		} else if (category == "ELEC") {
			var numbers = [ 1, 2, 3 ];
			var values = [ 'TV', 'DVD', 'MUSIC', 'OTH' ];
			var options = [ 'TVs', 'Music Players', 'Others' ];
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
