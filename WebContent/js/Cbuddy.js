
$(document).ready(function() {

	var ctxPath = $('#context_path').val().trim();
	var subCat = "";
	var path="";
	var cat = $('#cat').text();
	var filterData = "";

	if(cat == 'REAL'){
		path="/realestateFilter";
		$("#subCategory-right li").eq(1).addClass("highlight_subcat");
		$("#loc-main").show();
		$("#bhk-main").show();
		$("#area-main").show();
		$("#amt-main").show();
		$("#approval-main").show();
		$("#ownership-main").show();
		$("#amenities-main").show();

	}else if(cat == 'AUTO'){
		path="/automobileFilter";
		$("#subCategory-right li").eq(0).addClass("highlight_subcat");
		$("#make-main").show();
		$("#year-main").show();
		$("#amt-main").show();
		$("#model-main").show();
		$("#fuelType-main").show();

	}else if(cat == 'ELEC'){
		$("#brand-main").show();
		$("#make-main").show();
		$("#year-main").show();
		$("#amt-main").show();

		var sub = $('#sub').text();

		if($("#electronics_right li").hasClass('highlight_subcat')){
			$("#electronics_right li").remove();
		}
		if(sub=="0"){
			path="/commonFilter";
			$("#screenType-main").show();
			$("#electronics_right li").eq(0).addClass("highlight_subcat");
		}
		else if(sub=="1"){
			path="/televisionFilter";
			$("#screenType-main").show();
			$("#electronics_right li").eq(1).addClass("highlight_subcat");
		}else if(sub=="2"){
			path="/dvdFilter";
			$("#electronics_right li").eq(6).addClass("highlight_subcat");
		}else if(sub=="3"){
			path="/cameraFilter";
			$("#electronics_right li").eq(2).addClass("highlight_subcat");
		}
		else if(sub=="4"){
			path="/fridgeFilter";
			$("#electronics_right li").eq(3).addClass("highlight_subcat");
		}
		else if(sub=="5"){
			path="/washingMachineFilter";
			$("#electronics_right li").eq(5).addClass("highlight_subcat");
		}
		else if(sub=="6"){
			path="/airCoolerFilter";
			$("#acType-main").show();
			$("#electronics_right li").eq(4).addClass("highlight_subcat");
		}

	}else if(cat == 'COMP'){
		path = "/computersFilter";
		$("#subCategory-right li").eq(0).addClass("highlight_subcat");
		$("#make-main").show();
		$("#year-main").show();
		$("#amt-main").show();
		$("#processorSize-main").show();
		$("#hddSize-main").show();

	}else if(cat == 'MOBILE'){
		path="/mobileFilter";
		$("#subCategory-right li").eq(0).addClass("highlight_subcat");
		$("#brand-main").show();
		$("#year-main").show();
		$("#amt-main").show();
		$("#os-main").show();
		$("#sims-main").show();

	}else if(cat == 'FURN'){
		path="/furnitureFilter";
		$("#subCategory-right li").eq(0).addClass("highlight_subcat");
		$("#year-main").show();
		$("#amt-main").show();
	}

	//********************************if user clicks on CLEAR ALL*****************************************************
	$('#clear_all_f').off().on('click', function(event) {

		$("input[class^=check_]:checked").each(function(){
			$(this).attr("checked",false);
		});
		$("#filterValueBar").html('');
		$("#filterValueBar").hide();
		location.reload(true);

	});

	// *******************************if user clicks on PREVIOUS*******************************************************
	$('#page_prev').off().on('click', function(event) {
		subCat = $('#sub').text();
		cat = $('#cat').text();

		var pageNo = $('#page_info').val();
		var page = parseInt(pageNo.split(" ")[2]);
		var pageCount = parseInt(pageNo.split(" ")[4]);
		var limit = 10;
		var offset = limit * (page-2);
		var data="";
		if(filterData == ""){
			data = data + '&subCategory='+subCat+'&category='+cat;
		}
		if (typeof $("input[name=city]:checked", "#cityForm").val() != "undefined") {
			data = data + "&city=" + $("input[name=city]:checked", "#cityForm").val();
		}

		if($("#corpId").val() != "" && data.indexOf("corpId", 0)<0){
			data = data + "&corpId=" + $("#corpId").val();
		}
		data = data+filterData +'&limit='+limit+'&offset='+offset+'&page='+(page+1);

		$.ajax({
			type: 'POST',
			url: ctxPath+path, 
			data: data,
			success: function(data, status) {

				$('.data').html('');
				$('.data').html(data);
				$('#page_info').remove();
				$( ".pager li" ).eq(1).html( '<input id="page_info" type="text" readonly="readonly" value="Showing Page '+(page-1) +' of '+pageCount+'" >' );

				if(offset == 0){
					$( ".pager li" ).eq(0).addClass('hidden');
					$( ".pager li" ).eq(2).removeClass('hidden');
				}else{
					$( ".pager li" ).eq(2).removeClass('hidden');
				}
			}
		});
	});

	//**********************************if user clicks on NEXT************************************************
	$('#page_next').off().on('click', function(event) {
		subCat = $('#sub').text();
		cat = $('#cat').text();

		var pageNo = $('#page_info').val();
		var page = parseInt(pageNo.split(" ")[2]);
		var pageCount = parseInt(pageNo.split(" ")[4]);
		var limit = 10;
		var offset = limit * page;

		var data="";
		if(filterData == ""){
			data = data + '&subCategory='+subCat+'&category='+cat;
		}

		if (typeof $("input[name=city]:checked", "#cityForm").val() != "undefined") {
			data = data + "&city=" + $("input[name=city]:checked", "#cityForm").val();
		}

		if($("#corpId").val() != "" && data.indexOf("corpId", 0)<0){
			data = data + "&corpId=" + $("#corpId").val();
		}

		data = data+filterData +'&limit='+limit+'&offset='+offset+'&page='+(page+1);

		$.ajax({
			type: 'POST',
			url: ctxPath+path, 
			data: data,
			success: function(data, status) {

				$('.data').html('');
				$('.data').html(data);
				$('#page_info').remove();
				$( ".pager li" ).eq(1).html( '<input id="page_info" type="text" readonly="readonly" value="Showing Page '+(page+1) +' of '+pageCount+'" >' );
				var pC = parseInt($('#pagecount').val())/10;
				if(pC % 1 != 0){
					pC = ((Math.floor(pC))+1)*10;
				}else{
					pC = (Math.floor(pC))*10;
				}

				if((offset+10)==pC){
					$( ".pager li" ).eq(2).addClass('hidden');
					$( ".pager li" ).eq(0).removeClass('hidden');
				}else{
					$( ".pager li" ).eq(0).removeClass('hidden');
				}
			}
		});
	});

	//*************************if user click to cancel a selected filter****************************************
	$('.selected_filters').off().on('click', function(event) {
		var pageNo = $('#page_info').val();
		var page = parseInt(pageNo.split(" ")[2]);
		var pageCount = parseInt(pageNo.split(" ")[4]);

		subCat = $('#sub').text();
		cat = $('#cat').text();
		var data="";
		var child = event.target;
		var id = child.id;
		var text = $(this).find('#'+id);
		data = data + '&subCategory='+subCat+'&category='+cat;

		$("input[class^=check_]:checked").each(function(){
			var sub = $(this).attr('name');
			if(text.text() == $(this).parent().children('span.content').text()){
				$(this).attr("checked",false);
			}else{
				data = data + '&'+sub+'='+$(this).val();
			}
		});

		if (typeof $("input[name=city]:checked", "#cityForm").val() != "undefined") {
			data = data + "&city=" + $("input[name=city]:checked", "#cityForm").val();
		}

		if($("#corpId").val() != "" && data.indexOf("corpId", 0)<0){
			data = data + "&corpId=" + $("#corpId").val();
		}

		filterData = data;
		$.ajax({
			type: 'POST',
			url: ctxPath+path, 
			data: data,
			success: function(data, status) {
				$('.data').html('');
				$('.data').html(data);
				$('#page_info').remove();

				var pC = parseInt($('#pagecount').val())/10;

				if(pC % 1 != 0){
					pC = (Math.floor(pC))+1;
				}
				$( ".pager li" ).eq(1).html( '<input id="page_info" type="text" readonly="readonly" value="Showing Page '+ (pC==0?pC:1) +' of '+pC+'" >' );

				if(pC<=1)
				{
					$( ".pager li" ).eq(2).addClass('hidden');
					$( ".pager li" ).eq(0).addClass('hidden');
				}else{
					$( ".pager li" ).eq(2).removeClass('hidden');
					$( ".pager li" ).eq(0).addClass('hidden');
				}
			}
		});

		$(this).find('#'+id).remove();

		if($("#filterValueBar").text() == ""){
			$("#filterValueBar").hide();
			$('#clear_all_f').hide();
		}
	});

	//*****************************if user clicks on checkboxes******************************************
	$('input[class^=check_]').off().on('click',function(event) {

		subCat = $('#sub').text();
		cat = $('#cat').text();
		$('#clear_all_f').show();
		$("#filterValueBar").show();

		var data="";
		data = data + '&subCategory='+subCat+'&category='+cat;
		var str="";
		$("input[class^=check_]:checked").each(function()
				{	
			var sub = $(this).attr('name');
			data = data + '&'+sub+'='+$(this).val();
			var check = $(this).parent().children('span.content').text();
			var div_Id = check.replace(/\s+/g, '').replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
			if(sub!="location")
				str = str+'<div style="margin-left:12px;" class="pull-left filters" id="'+div_Id+'">'+check+'<span style="margin-left:4px;" class="glyphicon glyphicon-remove form-control-show"id="'+div_Id+'">'+'</span>'+'</div >';
				});

		$('.selected_filters').html(str);

		if (typeof $("input[name=city]:checked", "#cityForm").val() != "undefined") {
			data = data + "&city=" + $("input[name=city]:checked", "#cityForm").val();
		}

		if($("#corpId").val() != "" && data.indexOf("corpId", 0)<0){
			data = data + "&corpId=" + $("#corpId").val();
		}

		if($("#filterValueBar").text() == ""){
			$("#filterValueBar").hide();
			$('#clear_all_f').hide();
		}

		filterData = data;

		$.ajax({
			type: 'POST',
			url: ctxPath+path, 
			data: data,
			success: function(data, status) {
				$('.data').html('');
				$('.data').html(data);

				var pC = parseInt($('#pagecount').val())/10;

				if(pC % 1 != 0){
					pC = (Math.floor(pC))+1;
				}

				$( ".pager li" ).eq(1).html( '<input id="page_info" type="text" readonly="readonly" value="Showing Page '+ (pC==0?pC:1) +' of '+pC+'" >' );


				if(pC<=1)
				{$( ".pager li" ).eq(2).addClass('hidden');
				$( ".pager li" ).eq(0).addClass('hidden');
				}
				else
				{$( ".pager li" ).eq(2).removeClass('hidden');
				$( ".pager li" ).eq(0).addClass('hidden');}
			}
		});
	});

	//***********************************if user clicks on subcaregory****************************************
	var lastVal="";
	$("#subCategory-right li").off().on('click',function(){
		subCat = $('#sub').text();
		cat = $('#cat').text();
		var defaultSubCat = $(this).parent().children().first('.content').text();

		if(lastVal!=$(this).text() ){

			//if(lastVal!=""){
			$('.filters').remove();
			//}
			$("input[class^=check_]:checked").each(function()
					{	
				$(this).attr("checked",false);
					});
			//}
			lastVal = $(this).text();
		}

		if($("#filterValueBar").text() == ""){
			$("#filterValueBar").hide();
		}

		//$(this).parent().hide();
		subCat = $(this).val();
		var data = "";
		if (typeof $("input[name=city]:checked", "#cityForm").val() != "undefined") {
			data = data + "&city=" + $("input[name=city]:checked", "#cityForm").val();
		}

		if($("#corpId").val() != "" && data.indexOf("corpId", 0)<0){
			data = data + "&corpId=" + $("#corpId").val();
		}
		data = data + '&subCategory='+subCat+'&category='+cat;

		$.ajax({
			type: 'POST',
			url: ctxPath+path, 
			data: data,
			success: function(data, status) {

				$('.data').html('');
				$('.data').html(data);
				$('#sub').text(subCat);
				$('#page_info').remove();

				var pC = parseInt($('#pagecount').val())/10;

				if(pC % 1 != 0){
					pC = (Math.floor(pC))+1;
				}
				$( ".pager li" ).eq(1).html( '<input id="page_info" type="text" readonly="readonly" value="Showing Page '+ (pC==0?pC:1) +' of '+pC+'" >' );

				if(pC<=1)
				{
					$( ".pager li" ).eq(2).addClass('hidden');
					$( ".pager li" ).eq(0).addClass('hidden');
				}else{
					$( ".pager li" ).eq(2).removeClass('hidden');
					$( ".pager li" ).eq(0).addClass('hidden');
				}
			}
		});

		if(cat=="REAL")
		{
			if($(this).text()== 'Apartment For Rent' || $(this).text() == 'Independent House For Rent'){
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

			if($(this).text()== 'Apartment For Sale' || $(this).text()== 'Independent House For Sale'){
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
			$("#breadCrumb_Category").html("Real Estate");
			$("#breadCrumb_SubCategory").html($(this).text());
		}
		else if(cat == "MOBILE")
		{
			if($(this).text()== 'Handsets'){
				$("#brand-main").show();
				$("#amt-main").show();
				$("#os-main").show();
				$("#sims-main").show();
				$("#type-main").hide();
			}

			if($(this).text()== 'Accessories'){
				$("#type-main").show();
				$("#brand-main").show();
				$("#amt-main").show();
				$("#os-main").hide();
				$("#sims-main").hide();

			}
			$("#breadCrumb_Category").html("Mobiles And Accessories");
			$("#breadCrumb_SubCategory").html($(this).text());
		}
		else if (cat == "AUTO")
		{
			if($(this).text()!= 'Cars' /*&& subCat=="1"*/){
				if($(this).text()== 'Bikes/Scooters' || $(this).text()== 'Scooters'){
					$("#makeBikes-main").show();
					$("#fuelType-main").hide();
					$("#make-main").hide();
				}else{
					$("#make-main").hide();
					$("#fuelType-main").show();
					$("#makeBikes-main").hide();
				}
			}else if($(this).text()== 'Cars' /*&& subCat=="Cars"*/){
				$("#make-main").show();
				$("#brandBikes-main").hide();
			}
			$("#breadCrumb_Category").html("AutoMobiles");
			$("#breadCrumb_SubCategory").html($(this).text());
		}
		else if(cat == "COMP")
		{
			if($(this).text()== 'Tabs'){
				$("#model-main").show();
			}else {
				$("#model-main").hide();	
			}
			$("#breadCrumb_Category").html("Computers and Laptops");
			$("#breadCrumb_SubCategory").html($(this).text());
		}
		else if(cat == 'FURN'){
			$("#breadCrumb_Category").html("Furniture");
			$("#breadCrumb_SubCategory").html($(this).text());
		}
		/*else if( cat == 'ELEC'){
			if($(this).text()== 'Televisions'){
				$("#make-main").show();
				$("#year-main").show();
				$("#amt-main").show();
				$("#screenType-main").show();
			}else if($(this).text()== 'Digital Cameras, Camcorders') {
				$("#model-main").hide();	
			}
			else if($(this).text()== 'Refrigerators') {
				$("#model-main").hide();	
			}
			else if($(this).text()== 'Air Coolers, Air Conditioners') {
				$("#model-main").hide();	
			}
			else if($(this).text()== 'Washing Machines') {
				$("#model-main").hide();	
			}
			else if($(this).text()== 'DVD Players, Music Players, iPods') {
				$("#model-main").hide();	
			}
			$("#breadCrumb_Category").html("Electronics");
			$("#breadCrumb_SubCategory").html($(this).text());
		}*/
		if($(this).parent().children().hasClass('highlight_subcat')){
			$(this).parent().children().removeClass('highlight_subcat');
		}
		$(this).addClass("highlight_subcat");
	});

	//**********if hover on any filters category shown([id*=-main] pattern where it ends with -main)************

	$("div[id*=-main]").mouseenter(function() {   
		var divId = $(this).attr('id').split('-')[0];
		$("#subCategory_hidden_"+divId).css("display","block");
		$("#subCategory_hidden_"+divId+ " ul").css("display","block");   
	}).mouseleave(function () {  
		var divId = $(this).attr('id').split('-')[0];
		$("#subCategory_hidden_"+divId).css("display","none");
		$("#subCategory_hidden_"+divId+ " ul").css("display","none");
	});

	$(".searchFilter li").mouseenter(function(){
		$(this).addClass("highlight_subcat");
	});

	$(".searchFilter li").mouseleave(function(){
		$(this).removeClass("highlight_subcat");
	});

	$("#Pwd1").keyup(checkPasswordMatch);

	function checkPasswordMatch() {

		var password = $("#Pwd").val();
		var confirmPassword = $("#Pwd1").val();

		if (password != confirmPassword)
		{  $("#divCheckPasswordMatch").html("<span style='font-weight:bold;color:red'>Passwords do not match!</span>");
		$("#btnSignUp").attr("disabled", "disabled");

		}else{
			$("#divCheckPasswordMatch").html("<span style='font-weight:bold;color:green'>Passwords match.</span>");
			$("#btnSignUp").removeAttr('disabled');
		}
		$("#btnSignUp").css("opacity", "unset");
	}

	$("#post_cmt").off().on('click',function(){
		var postId = $("#postId").text();
		if($("#comments").val()!=""){
			var data = "&postId="+postId+"&comment="+$("#comments").val();
			$.ajax({
				type: 'POST',
				url: ctxPath+"/comments", 
				data: data,
				success: function(data, status) {
//					alert(data);
					$("#comments").val('');
					$('#comments-div').html('');
					$('#comments-div').html(data);

				}
			});
		}
	});

	$(document).on('click', "a[id^=post_childCmt]", function(e) {
		//alert("cvv");
		e.preventDefault();
		$(this).parent().children("div#childCmt-div").show();

	});

	$(document).on('click', "button[id^=cmt_close]", function(e) {
		//	alert("cvv");
		$(this).parent().hide();
		$(this).parent().children('textarea').val('');

	});

	$(document).on('click', "button[id^=post_child_cmt_]", function(e) {
		var id = $(this).attr('id');
		var postId = $("#postId").text();
		var comment = $(this).parent().children('textarea').val();
		if(comment!=""){
			var data = "&postId="+postId+"&comment="+comment+"&commentId="+id.split('_')[3];
			//alert(data);
			$.ajax({
				type: 'POST',
				url: ctxPath+"/childcomments", 
				data: data,
				success: function(data, status) {
//					alert(data);
					$("#comments").val('');
					$('#comments-div').html('');
					$('#comments-div').html(data);

				}
			});
		}
	});

});
