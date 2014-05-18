$(document).ready(function() {
	var subCat = "Apartment/House For Rent";
	var path="";
	var cat = $('#cat').text();
	if(cat == 'REAL ESTATE'){
		path="realestate";
	}else if(cat == 'CARS'){
		path="cars";
	}else if(cat == 'HOUSEHOLD'){
		path="household";
	}else if(cat == 'LAPTOPS'){
		path="laptops";
	}else if(cat == 'MOBILES'){
		path="mobiles";
	}else if(cat == 'DVD'){
		path="books";
	}

	$('.selected_filters').bind('click', function(event) {
		var child = event.target;
		var id = child.id;
		var text = $(this).find('#'+id);
		$("input[class^=check_]:checked").each(function(){
			if(text.text() == $(this).val()){
				$(this).attr("checked",false);
				return false;
			}
		});
		$(this).find('#'+id).remove();
	});

	$('input[class^=check_]').click(function() {


		var data="";
		data = data + '&subCategory='+subCat;
		var str="";
		$("input[class^=check_]:checked").each(function()
				{		 
			var sub = $(this).attr('name');
			data = data + '&'+sub+'='+$(this).val();
			var check = $(this).val();
			var div_Id = check.replace(/\s+/g, '').replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
			str = str+'<div style="margin-left:12px;" class="pull-left filters" id="'+div_Id+'">'+check+'<span class="glyphicon glyphicon-remove form-control-show"id="'+div_Id+'">'+'</span>'+'</div >';
				});

		$('.selected_filters').html(str);
		//alert(check);
		$.ajax({
			type: 'POST',
			url: "/cbuddy/"+path, 
			data: data,
			success: function(data, status) {
				$('.data').html('');
				$('.data').html($(data).find('.data').html());

			}
		});
	});

	/*$("li").click(function(){
		if($(this).parent().parent().parent().attr("id")=="subCategory-main"){
			var subCat=$(this).text();
			$('#sub').text(subCat);
			var data = 'subCategory='+ subCat;
		}
		$.ajax({
			type: 'POST',
			url: "/cbuddy/adlist", 
			data: data,
			success: function(data, status) {

				//alert(data);
			}
		});
	});*/
	$("#loc-main").show();
	$("#bhk-main").show();
	$("#area-main").show();
	$("#rent-main").show();
	$("#dir-main").show();
	$("#pref-main").show();
	$("#park-main").show();

	$("#subCategory-main li").click(function(){

		$("input[class^=check_]:checked").each(function()
				{	
			$(this).attr("checked",false);
				});
		$(this).parent().hide();
		subCat = $(this).text();
		var data = "";
		var data = data + '&subCategory='+subCat;
		$.ajax({
			type: 'POST',
			url: "/cbuddy/adlist", 
			data: data,
			success: function(data, status) {

				//alert(data);
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
			$("#price-main").hide();
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
			$("#amenities-pg-main").hide();
			$("#food-main").hide();
			$("#share-main").hide();
			$("#furnished-main").hide();
			$("#gender-main").hide();
			$("#region-main").hide();
			$("#price-main").show();
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
			$("#amenities-pg-main").hide();
			$("#food-main").hide();
			$("#share-main").hide();
			$("#furnished-main").hide();
			$("#gender-main").hide();
			$("#region-main").hide();
			$("#price-main").show();
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
			$("#price-main").show();
			$("#amenities-pg-main").show();
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
			$("#price-main").hide();
			$("#amenities-pg-main").hide();
			$("#food-main").hide();
			$("#area-main").show();
			$("#loc-main").show();
			$("#share-main").show();
			$("#furnished-main").show();
			$("#gender-main").show();
			$("#region-main").show();
		}
	});

	$("#subCategory-main").hover(function(){

		if($("#subCategory_hidden_sub").is(':visible')){
			$("#subCategory_hidden_sub").css("display","none");
		}else{
			$("#subCategory_hidden_sub").css("display","block");
		}
		$("#subCategory_hidden_sub ul").css("display","block");
	});
	$("#loc-main").hover(function(){

		if($("#subCategory_hidden_loc").is(':visible')){
			$("#subCategory_hidden_loc").css("display","none");
		}else{
			$("#subCategory_hidden_loc").css("display","block");
		}
		$("#subCategory_hidden_loc ul").css("display","block");

	});
	$("#bhk-main").hover(function(){

		if($("#subCategory_hidden_bhk").is(':visible')){
			$("#subCategory_hidden_bhk").css("display","none");
		}else{
			$("#subCategory_hidden_bhk").css("display","block");
		}
		$("#subCategory_hidden_bhk ul").css("display","block");
	});
	$("#area-main").hover(function(){

		if($("#subCategory_hidden_area").is(':visible')){
			$("#subCategory_hidden_area").css("display","none");
		}else{
			$("#subCategory_hidden_area").css("display","block");
		}
		$("#subCategory_hidden_area ul").css("display","block");
	});
	$("#rent-main").hover(function(){

		if($("#subCategory_hidden_rent").is(':visible')){
			$("#subCategory_hidden_rent").css("display","none");
		}else{
			$("#subCategory_hidden_rent").css("display","block");
		}
		$("#subCategory_hidden_rent ul").css("display","block");
	});
	$("#dir-main").hover(function(){

		if($("#subCategory_hidden_dir").is(':visible')){
			$("#subCategory_hidden_dir").css("display","none");
		}else{
			$("#subCategory_hidden_dir").css("display","block");
		}
		$("#subCategory_hidden_dir ul").css("display","block");
	});
	$("#pref-main").hover(function(){

		if($("#subCategory_hidden_pref").is(':visible')){
			$("#subCategory_hidden_pref").css("display","none");
		}else{
			$("#subCategory_hidden_pref").css("display","block");
		}
		$("#subCategory_hidden_pref ul").css("display","block");
	});
	$("#park-main").hover(function(){

		if($("#subCategory_hidden_park").is(':visible')){
			$("#subCategory_hidden_park").css("display","none");
		}else{
			$("#subCategory_hidden_park").css("display","block");
		}
		$("#subCategory_hidden_park ul").css("display","block");
	});
	$("#price-main").hover(function(){

		if($("#subCategory_hidden_price").is(':visible')){
			$("#subCategory_hidden_price").css("display","none");
		}else{
			$("#subCategory_hidden_price").css("display","block");
		}
		$("#subCategory_hidden_price ul").css("display","block");
	});
	$("#approval-main").hover(function(){

		if($("#subCategory_hidden_approval").is(':visible')){
			$("#subCategory_hidden_approval").css("display","none");
		}else{
			$("#subCategory_hidden_approval").css("display","block");
		}
		$("#subCategory_hidden_approval ul").css("display","block");
	});
	$("#ownership-main").hover(function(){

		if($("#subCategory_hidden_ownership").is(':visible')){
			$("#subCategory_hidden_ownership").css("display","none");
		}else{
			$("#subCategory_hidden_ownership").css("display","block");
		}
		$("#subCategory_hidden_ownership ul").css("display","block");
	});
	$("#amenities-main").hover(function(){

		if($("#subCategory_hidden_amenities").is(':visible')){
			$("#subCategory_hidden_amenities").css("display","none");
		}else{
			$("#subCategory_hidden_amenities").css("display","block");
		}
		$("#subCategory_hidden_amenities ul").css("display","block");
	});
	$("#amenities-pg-main").hover(function(){

		if($("#subCategory_hidden_amenities_pg").is(':visible')){
			$("#subCategory_hidden_amenities_pg").css("display","none");
		}else{
			$("#subCategory_hidden_amenities_pg").css("display","block");
		}
		$("#subCategory_hidden_amenities_pg ul").css("display","block");
	});
	$("#food-main").hover(function(){

		if($("#subCategory_hidden_amenities_food").is(':visible')){
			$("#subCategory_hidden_amenities_food").css("display","none");
		}else{
			$("#subCategory_hidden_amenities_food").css("display","block");
		}
		$("#subCategory_hidden_food ul").css("display","block");
	});
	$("#share-main").hover(function(){

		if($("#subCategory_hidden_share").is(':visible')){
			$("#subCategory_hidden_share").css("display","none");
		}else{
			$("#subCategory_hidden_share").css("display","block");
		}
		$("#subCategory_hidden_share ul").css("display","block");
	});
	$("#furnished-main").hover(function(){

		if($("#subCategory_hidden_furnished").is(':visible')){
			$("#subCategory_hidden_furnished").css("display","none");
		}else{
			$("#subCategory_hidden_furnished").css("display","block");
		}
		$("#subCategory_hidden_furnished ul").css("display","block");
	});
	$("#gender-main").hover(function(){

		if($("#subCategory_hidden_gender").is(':visible')){
			$("#subCategory_hidden_gender").css("display","none");
		}else{
			$("#subCategory_hidden_gender").css("display","block");
		}
		$("#subCategory_hidden_gender ul").css("display","block");
	});
	$("#region-main").hover(function(){

		if($("#subCategory_hidden_region").is(':visible')){
			$("#subCategory_hidden_region").css("display","none");
		}else{
			$("#subCategory_hidden_region").css("display","block");
		}
		$("#subCategory_hidden_region ul").css("display","block");
	});


	$("subCategory-main li").click(function(){
		//alert("000");
		//$(this).parent().hide();
		//alert($(this).parent().parent().parent().first().children().first().html());
		//$(this).parent().parent().parent().first().children().first().html('<span class="content">'+$(this).text()+'</span>'+'<span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>');

	});

	$("li").mouseenter(function(){
		$(this).addClass("highlight_subcat");

	});

	$("li").mouseleave(function(){
		$(this).removeClass("highlight_subcat");
	});

});
