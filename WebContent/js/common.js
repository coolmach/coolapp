

	$(document).ready(function(){
		$("#locSearch").autocomplete({
		    source: function(request, response) {
			    $.ajax({
				    //url: "http://localhost:8080/Virat/getLocation?city=BLR",
				    //url:$('#context_path').text() + "/getLocation",
				    url:"/Virat" + "/getLocation",
				    type: "POST",
				    dataType: "json",
				    //data: {location:$("#locSearch").val()},
				    data: {city:$('input[name=city]:checked').val(),location:$("#locSearch").val()},
				    success: function(data) {
				        response( $.map(data, function(item) {
					        return {
					            label: item.value,
					            value: item.id,
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
					url:"/Virat" + "/getNeighbor",
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
		$("#corpSearchString").autocomplete({
		    source: function(request, response) {
			    $.ajax({
				    //url: "http://localhost:8080/Virat/getLocation?city=BLR",
				    //url:$('#context_path').text() + "/getLocation",
				    url:"/Virat" + "/autoSuggestCorp",
				    type: "POST",
				    dataType: "json",
				    //data: {location:$("#locSearch").val()},
				    data: {corpSearchString:$("#corpSearchString").val()},
				    success: function(data) {
				        response( $.map(data, function(item) {
					        return {
					            label: item.description,
					            value: item.id,
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
