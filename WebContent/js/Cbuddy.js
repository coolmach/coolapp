$(document).ready(function() {
	
	var ctxPath = $('#context_path').text();
	var subCat = "";
	var path="";
	var cat = $('#cat').text();

	if(cat == 'REAL'){
		path="realestateFilter";
		//subCat="Apartment/House For Rent";
		subCat = "2"; //SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT
		$("#loc-main").show();
		$("#bhk-main").show();
		$("#area-main").show();
		$("#rent-main").show();
		$("#dir-main").show();
		$("#pref-main").show();
		$("#park-main").show();
	}else if(cat == 'CARS'){
		path="cars";
		subCat="Cars";
		$("#brand-main").show();
		$("#loc-main").show();
		$("#amt-main").show();
		$("#used-main").show();
	}else if(cat == 'HOUSEHOLD'){
		path="adListForHouseHoldItems";
		subCat="Air Conditioners & Coolers";
		$("#loc-main").show();
		$("#amt-main").show();
		$("#used-main").show();
	}else if(cat == 'LAPTOPS'){
		path="laptops";
		subCat="LAPTOPS";
		$("#brand-main").show();
		$("#used-main").show();
		$("#amt-main").show();
		$("#loc-main").show();
		$("#screen-main").show();
		$("#ram-main").show();
	}else if(cat == 'MOBILES'){
		path="mobiles";
		subCat="Mobile Phones";
		$("#brand-main").show();
		$("#used-main").show();
		$("#amt-main").show();
		$("#loc-main").show();
		$("#os-main").show();
		$("#sims-main").show();
	}else if(cat == 'DVD'){
		path="books";
	}

	//if user click to cancel a selected filter
	$('.selected_filters').bind('click', function(event) {
		var data="";
		var child = event.target;
		//alert(child);
		var id = child.id;
		//alert(id);
		var text = $(this).find('#'+id);
		//alert(text.text());
		$("input[class^=check_]:checked").each(function(){
			var sub = $(this).attr('name');
			//if(text.text() == $(this).val()){
				if(text.text() == $(this).parent().children('span.content').text()){
				$(this).attr("checked",false);
				//return false;
			}else{
				data = data + '&'+sub+'='+$(this).val();
			}
		});
		//alert(data);
		$.ajax({
			type: 'POST',
			url: ctxPath+path, 
			data: data,
			success: function(data, status) {

				$('.data').html('');
				$('.data').html(data);

			}
		});

		$(this).find('#'+id).remove();
		
		if($("#filterValueBar").text() == ""){
			$("#filterValueBar").hide();
		}
		
	});

	//if user clicks on checkboxes
	$('input[class^=check_]').click(function(event) {
		$("#filterValueBar").show();
		
		var data="";
		data = data + '&subCategory='+subCat;
		var str="";
		$("input[class^=check_]:checked").each(function()
				{		 
			var sub = $(this).attr('name');
			data = data + '&'+sub+'='+$(this).val();
			//var check = $(this).val();
			var check = $(this).parent().children('span.content').text();
			var div_Id = check.replace(/\s+/g, '').replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
			str = str+'<div style="margin-left:12px;" class="pull-left filters" id="'+div_Id+'">'+check+'<span class="glyphicon glyphicon-remove form-control-show"id="'+div_Id+'">'+'</span>'+'</div >';
				});

		$('.selected_filters').html(str);

		if($("#filterValueBar").text() == ""){
			$("#filterValueBar").hide();
		}
		
		$.ajax({
			type: 'POST',
			url: ctxPath+path, 
			data: data,
			success: function(data, status) {
				//alert(data.trim());
				$('.data').html('');
				$('.data').html(data);

			}
		});
	
	});

	//if user clicks on subcaregory
	var lastVal="";
	$("#sub-main li").click(function(){
		var defaultSubCat = $(this).parent().children().first('.content').text();
		//alert(lastVal);
		//alert($(this).text()); 
		//alert(defaultSubCat);
		if(lastVal!=$(this).text() ){

			//if($(this).text()!=defaultSubCat){
			if(lastVal!=""){
				$('.filters').remove();
				//}
				$("input[class^=check_]:checked").each(function()
						{	
					$(this).attr("checked",false);
						});
			}
			lastVal = $(this).text();
		}

		$(this).parent().hide();
		//subCat = $(this).text();
		subCat = $(this).val();
		var data = "";
		var data = data + '&subCategory='+subCat;
		//alert(data);
		$.ajax({
			type: 'POST',
			url: ctxPath+path, 
			data: data,
			success: function(data, status) {

				$('.data').html('');
				$('.data').html(data);
				$('#sub').text(subCat);
			}
		});

		//$(this).parent().parent().parent().first().children().first().html('<span class="content">'+$(this).text()+'</span>'+'<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>');
		if($(this).text()== 'Apartment/House For Rent'){
			$("#loc-main").show();
			$("#bhk-main").show();
			$("#area-main").show();
			$("#rent-main").show();
			$("#dir-main").show();
			$("#pref-main").show();
			$("#park-main").show();
			$("#amt-main").hide();
			$("#approval-main").hide();
			$("#ownership-main").hide();
			$("#amenities-main").hide();
			$("#share-main").hide();
			$("#furnished-main").hide();
			$("#gender-main").hide();
			$("#region-main").hide();

		}
		if($(this).text()== 'Apartment/House For Sale'){
			$("#rent-main").hide();
			$("#dir-main").hide();
			$("#pref-main").hide();
			$("#park-main").hide();
			$("#amenitiesPg-main").hide();
			$("#food-main").hide();
			$("#share-main").hide();
			$("#furnished-main").hide();
			$("#gender-main").hide();
			$("#region-main").hide();
			$("#amt-main").show();
			$("#approval-main").show();
			$("#ownership-main").show();
			$("#amenities-main").show();
		}
		if($(this).text()== 'Plot For Sale'){
			$('#ownership-main').hide();
			$('#bhk-main').hide();
			$('#park-main').hide();
			$("#rent-main").hide();
			$("#dir-main").hide();
			$("#pref-main").hide();
			$("#amenities-main").hide();
			$("#amenitiesPg-main").hide();
			$("#food-main").hide();
			$("#share-main").hide();
			$("#furnished-main").hide();
			$("#gender-main").hide();
			$("#region-main").hide();
			$("#amt-main").show();
			$("#approval-main").show();
			$("#loc-main").show();
			$("#area-main").show();
		}
		if($(this).text()== 'PG Accommodation'){
			$('#ownership-main').hide();
			$('#bhk-main').hide();
			$('#park-main').hide();
			$("#rent-main").hide();
			$("#dir-main").hide();
			$("#pref-main").hide();
			$("#amenities-main").hide();
			$("#approval-main").hide();
			$("#area-main").hide();
			$("#share-main").hide();
			$("#furnished-main").hide();
			$("#gender-main").hide();
			$("#region-main").hide();
			$("#loc-main").show();
			$("#amt-main").show();
			$("#amenitiesPg-main").show();
			$("#food-main").show();
		}
		if($(this).text()== 'Roommate Required'){
			$('#ownership-main').hide();
			$('#bhk-main').hide();
			$('#park-main').hide();
			$("#rent-main").hide();
			$("#dir-main").hide();
			$("#pref-main").hide();
			$("#amenities-main").hide();
			$("#approval-main").hide();
			$("#amt-main").hide();
			$("#amenitiesPg-main").hide();
			$("#food-main").hide();
			$("#area-main").show();
			$("#loc-main").show();
			$("#share-main").show();
			$("#furnished-main").show();
			$("#gender-main").show();
			$("#region-main").show();
		}

		if($(this).text()== 'Mobile Phones'){
			$("#brand-main").show();
			$("#used-main").show();
			$("#amt-main").show();
			$("#loc-main").show();
			$("#os-main").show();
			$("#sims-main").show();
			$("#type-main").hide();
		}

		if($(this).text()== 'Mobile Accessories'){
			$("#type-main").show();
			$("#brand-main").show();
			$("#used-main").show();
			$("#amt-main").show();
			$("#loc-main").show();
			$("#os-main").hide();
			$("#sims-main").hide();

		}

		if($(this).text()!= 'Cars' && subCat=="Cars"){
			if($(this).text()== 'Motorcycles' || $(this).text()== 'Scooters'){
				$("#brandBikes-main").show();
				$("#brand-main").hide();
			}else{
				$("#brand-main").hide();
				$("#brandBikes-main").hide();
			}

		}else if($(this).text()== 'Cars' && subCat=="Cars"){
			$("#brand-main").show();
			$("#brandBikes-main").hide();
		}

		if( cat == 'HOUSEHOLD'){
			if($(this).text()=='Air Conditioners & Coolers'){
				$("#brand-main").show();
			}else{
				$("#brand-main").hide();
			}
		}
	});

	//if hover on any filters category shown([id*=-main] pattern where it ends with -main)
	$("div[id*=-main]").hover(function(){
		var divId = $(this).attr('id').split('-')[0];
		if($("#subCategory_hidden_"+divId).is(':visible')){
			$("#subCategory_hidden_"+divId).css("display","none");
		}else{
			$("#subCategory_hidden_"+divId).css("display","block");
		}
		$("#subCategory_hidden_"+divId+ " ul").css("display","block");
	});

	$("li").mouseenter(function(){
		$(this).addClass("highlight_subcat");

	});

	$("li").mouseleave(function(){
		$(this).removeClass("highlight_subcat");
	});


	/*$("subCategory-main li").click(function(){
		//alert("000");
		//$(this).parent().hide();
		//alert($(this).parent().parent().parent().first().children().first().html());
		//$(this).parent().parent().parent().first().children().first().html('<span class="content">'+$(this).text()+'</span>'+'<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>');

	});*/

});
