
$(document).ready(function() {

	var ctxPath = $('#context_path').val().trim();
	var subCat = "";
	var path="";
	var cat = $('#cat').text();
	
	var subCategory = $("#subCategory").val();
	if(subCategory == ""){
		subCategory = "1";
	}
	
	var subCategory_str = $("#subCategory").val();
	if(subCategory_str == ""){
		subCategory_str = "1";
	}
	var subCat_Index_In_Li_Tag = parseInt(subCategory);
	
	var filterData = "";

	if(cat == 'REAL'){path="/realestateFilter";}
	else if(cat == 'AUTO'){path="/automobileFilter";}
	else if(cat == 'ELEC'){
		var sub = $('#sub').text();
		path="/commonElectronicsFilter";
		if($("#electronics_right li").hasClass('highlight_subcat')){
			$("#electronics_right li").remove();
		}
		if(sub=="0"){path="/commonElectronicsFilter";}
		else if(sub=="1"){path="/televisionFilter";}
		else if(sub=="2"){path="/dvdFilter";}
		else if(sub=="3"){path="/cameraFilter";}
		else if(sub=="4"){path="/fridgeFilter";}
		else if(sub=="5"){path="/washingMachineFilter";}
		else if(sub=="6"){path="/airCoolerFilter";}
	}
	else if(cat == 'COMP'){path = "/computersFilter";}
	else if(cat == 'MOBILE'){path="/mobilesFilter";}
	else if(cat == 'FURN'){path="/furnitureFilter";}
	
	$("#subCategory-right li").removeClass("highlight_subcat");
	$("#subCategory-right li[value='" + subCat_Index_In_Li_Tag + "']").addClass("highlight_subcat");
	showHideFilters(cat, subCategory);

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
				$('.data').replaceWith(data);
				$('#page_info').remove();
				$( ".pager li" ).eq(1).html( '<input class="hidden" id="page_info" type="text" readonly="readonly" value="Showing Page '+(page-1) +' of '+pageCount+'" >' );

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
				$('.data').replaceWith(data);
				$('#page_info').remove();
				$( ".pager li" ).eq(1).html( '<input class="hidden" id="page_info" type="text" readonly="readonly" value="Showing Page '+(page+1) +' of '+pageCount+'" >' );
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

	
	var checkedBoxCount =1;

	//*************************if user click to cancel a selected filter****************************************
	$('.selected_filters').off().on('click', function(event) {
		var pageNo = $('#page_info').val();
		//var page = parseInt(pageNo.split(" ")[2]);
		//var pageCount = parseInt(pageNo.split(" ")[4]);

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
		
		var c=0;
		//if only one brand is selected reload models
		var brand = "";
		$("input[class^=check_]:checked").each(function(){
			brand=$(this).val();
			c++;
		});

		updateMobileModels();
		updateTabModels();
		updateAutomobileModels();


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
				$('.data').replaceWith(data);
				$('#page_info').remove();

				var pC = parseInt($('#pagecount').val())/10;

				if(pC % 1 != 0){
					pC = (Math.floor(pC))+1;
				}
				$( ".pager li" ).eq(1).html( '<input class="hidden" id="page_info" type="text" readonly="readonly" value="Showing Page '+ (pC==0?pC:1) +' of '+pC+'" >' );

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

		if($(this).attr('name')=='brand'){
			updateMobileModels();
		}else if($(this).attr('name')=='make'){
			if(cat == "AUTO"){
				updateAutomobileModels();
			}else if(cat == "COMP"){
				updateTabModels();
			}
		}
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
	});

	//***********************************if user clicks on subcategory****************************************
	
	
	$("#subCategory-right li").off().on('click',function(){
		updateDataWithSelectedSubCategory(this, path);
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

	$(".searchFilter").on("mouseover", "li", function() {
		$(this).addClass("highlight_subcat");
	});

	$(".searchFilter").on("mouseleave", "li",function(){
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
			//alert(data);
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

function showFilters(filterNames){
	var index;
	for(index=0; index<filterNames.length; index++){
		$("#" + filterNames[index] + "-main").show();
	}
}

function hideFilters(filterNames){
	var index;
	for(index=0; index<filterNames.length; index++){
		$("#" + filterNames[index] + "-main").hide();
	}
}


// Used in Ad List screens, to update the list when the user selects different sub category
function updateDataWithSelectedSubCategory(element, path){
	var lastVal="";
	var ctxPath = $('#context_path').val().trim();
	var cat = $('#cat').text();
	var filterData = "";
	
	
	//Clear all filters currently selected
	$("input[class^=check_]").prop("checked", false);
	
	subCat = $('#sub').text();
	cat = $('#cat').text();
	
	var defaultSubCat = $(this).parent().children().first('.content').text();

	if(lastVal!=$(element).text() ){

		//if(lastVal!=""){
		$('.filters').remove();
		//}
		$("input[class^=check_]:checked").each(function()
				{	
			$(element).attr("checked",false);
				});
		//}
		lastVal = $(element).text();
	}

	if($("#filterValueBar").text() == ""){
		$("#filterValueBar").hide();
	}

	//$(this).parent().hide();
	subCat = $(element).val();
	var data = "";
	if (typeof $("input[name=city]:checked", "#cityForm").val() != "undefined") {
		data = data + "&city=" + $("input[name=city]:checked", "#cityForm").val();
	}

	if($("#corpId").val() != "" && data.indexOf("corpId", 0)<0){
		data = data + "&corpId=" + $("#corpId").val();
	}
	data = data + '&subCategory='+subCat+'&category='+cat;

	clearLocations();
	
	$.ajax({
		type: 'POST',
		url: ctxPath+path, 
		data: data,
		success: function(data, status) {

			$('.data').html('');
			$('.data').replaceWith(data);
			$('#sub').text(subCat);
			$('#page_info').remove();

			var pC = parseInt($('#pagecount').val())/10;

			if(pC % 1 != 0){
				pC = (Math.floor(pC))+1;
			}

			if(pC==0){
				$('.filter_cat').addClass('hidden');
			}else{
				$('.filter_cat').removeClass('hidden');
			}
			$( ".pager li" ).eq(1).html( '<input class="hidden" id="page_info" type="text" readonly="readonly" value="Showing Page '+ (pC==0?pC:1) +' of '+pC+'" >' );

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

	
	var breadCrumbCategory = "";
	var subCat = "";
	if(cat=="REAL")
	{
		if($(element).text() == 'Apartment For Sale'){subCat = "1";}
		else if($(element).text()== 'Apartment For Rent'){subCat = "2";}
		else if($(element).text() == 'Independent House For Sale'){subCat = "3";}
		else if($(element).text() == 'Independent House For Rent'){subCat = "4";}
		else if($(element).text() == 'PG Accommodation'){subCat = "5";}
		else if($(element).text() == 'Plot For Sale'){subCat = "6";}
		else if($(element).text() == 'Roommate Required'){subCat = "7";}
		
		breadCrumbCategory = "Real Estate";
	}
	else if(cat == "MOBILE")
	{
		if($(element).text()== 'Mobile Phones'){subCat = "1";}
		else if($(element).text()== 'Accessories'){subCat = "2";}

		breadCrumbCategory = "Mobile Phones & Accessories";
	}
	else if (cat == "AUTO")
	{
		if($(element).text()== 'Cars'){subCat = "1";}
		else if($(element).text()== 'Bikes'){subCat = "2";}
		else if($(element).text()== 'Cycles'){subCat = "3";}	

		breadCrumbCategory = "Cars & Bikes";
	}
	else if(cat == "COMP")
	{
		var subCategoryDesc = $(element).text();
		
		if(subCategoryDesc == "Desktops"){subcat = "1";}
		else if(subCategoryDesc == "Laptops"){subCat = "2";}
		else if(subCategoryDesc == "Tablets"){subCat = "3";}
		else if(subCategoryDesc == "Accessories"){subCat = "4";}

		breadCrumbCategory = "Computers & Accessories";
	}
	else if(cat == 'FURN'){
		breadCrumbCategory = "Furniture";
	}
	else if( cat == 'ELEC'){
		if($(this).text()== 'Televisions'){subCat = "1";}
		else if($(this).text()== 'DVD Players, Music Players, iPods') {subCat = "2";}
		else if($(this).text()== 'Digital Cameras, Camcorders') {subCat = "3";}
		else if($(this).text()== 'Refrigerators') {subCat = "4";}
		else if($(this).text()== 'Air Coolers, Air Conditioners') {subCat = "5";}
		else if($(this).text()== 'Washing Machines') {subCat = "6";}
		
		breadCrumbCategory = "Electronics & Home Appliances";
	}
	
	showHideFilters(cat, subCat);
	
	$("#breadCrumb_Category").html(breadCrumbCategory);
	$("#breadCrumb_SubCategory").html($(element).text());
	
	if($(element).parent().children().hasClass('highlight_subcat')){
		$(element).parent().children().removeClass('highlight_subcat');
	}
	$(element).addClass("highlight_subcat");
}

function showHideFilters(category, subCategory){
	if(category == "REAL"){
		hideFilters(["amt", "approval", "ownership", "amenities", "share", "furnished", "gender", "region"]);
		hideFilters(["loc", "bhk", "area", "rent", "dir", "pref",  "park", "amenitiesPg", "food"]);
		if(subCategory == "1"){
			//Apartment for Sale
			showFilters(["area", "dir", "amt", "approval", "ownership", "amenities", "dir"]);
		}
		else if(subCategory == "2"){
			//Apartment for Rent
			showFilters(["loc", "bhk", "area", "rent", "dir", "pref",  "park", "amenities"]);
		}
		else if(subCategory == "3"){
			//Independent House for Sale
			showFilters(["area", "amt", "approval", "ownership", "amenities", "dir"]);
		}
		else if(subCategory == "4"){
			//Independent House for Rent
			showFilters(["loc", "bhk", "area", "rent", "dir", "pref",  "park"]);
		}
		else if(subCategory == "5"){
			//PG Accommodation
			showFilters(["rent", "food", "loc", "amenitiesPg", "park"]);
		}
		else if(subCategory == "6"){
			//Land for Sale
			showFilters(["amt", "approval", "loc", "area"]);
		}
		else if(subCategory == "7"){
			//Room mate required
			showFilters(["share", "loc", "furnished", "gender", "region"]);
		}
	}
	else if(category == "MOBILE")
	{
		hideFilters(["amt", "brand", "operatingSystem", "sims", "accessoryType", "touchScreen", "model"]);
		if(subCategory == "1"){
			//Mobile Phones
			showFilters(["brand", "model", "amt", "operatingSystem", "sims", "touchScreen"]);
		}
		else if(subCategory == "2"){
			//Accessories
			showFilters(["accessoryType", "amt"]);
		}
	}
	else if (category == "AUTO")
	{
		hideFilters(['make','amt_car','amt_bike','amt_cycle','year','age','model','fuelType','regState','bike_make']);
		if(subCategory == "1"){
			//Cars
			showFilters(['make','amt_car','year','model','fuelType','regState']);
		}
		else if(subCategory == "2"){
			//Bikes
			showFilters(['bike_make','amt_bike','age','model','regState']);
		}
		else if(subCategory == "3"){
			//Cycleess
			showFilters(['amt_cycle','age']);
		}
	}
	else if(category == "COMP")
	{
		hideFilters(['make','tab_make','model','amt','accessory_amt','accessoryType','year','processorSize','hddSize']);
		if(subCategory == "1"){
			//Desktops
			showFilters(['make','amt','year','processorSize','hddSize']);
		}else if(subCategory == "2"){
			//Laptops
			showFilters(['make','amt','year','processorSize','hddSize']);
		}else if(subCategory == "3"){
			//Tablets
			showFilters(['tab_make','model','amt','year']);
		}else if(subCategory == "4"){
			//Accessories
			showFilters(['accessoryType','accessory_amt']);
		}
	}
	else if(category == 'FURN'){
		showFilters(['amt','year']);
	}
	else if( category == 'ELEC'){
		hideFilters(['brand','amt','screenType', 'year']);
		if(subCategory == "1"){
			//Television
			showFilters(['brand','amt','screenType','year']);
		}
		else if(subCategory == "2") {
			//DVD
			$("#model-main").hide();	
		}
		else if(subCategory == "3") {
			//Camera
			$("#model-main").hide();	
		}
		else if(subCategory == "4") {
			//Fridge
			$("#model-main").hide();	
		}
		else if(subCategory == "5") {
			//Air Cooler
			$("#model-main").hide();	
		}
		else if(subCategory == "6") {
			//Washing Machine
			$("#model-main").hide();	
		}
		
	}
}

function updateMobileModels(){
	//Get Selected Make. Also in case more than one Make is selected, don't update anything in the Model
	noOfBrandsSelected = 0;
	selectedBrand = "";
	$(".check_brand").each(function(){
		if($(this).is(':checked')){
			noOfBrandsSelected ++;
			selectedBrand = $(this).val();
		}
	});
	
	//Fetch Models if only one Make is selected
	if(noOfBrandsSelected == 1 && selectedBrand != ""){
		$("#model_List_In_Filter_Screen").html("");
		$.ajax({
			url:"getMobileModels",
			data:{brand:selectedBrand},
			dataType:'json',
			type:'POST',
			success:function(res){
				for(var i=0; i<res.mobileModels.length; i++){
					mobileModelFromServer = res.mobileModels[i];
					//Format: <li><input type="checkbox" class="check_year" name="yearStr" value="2005" /><span class="content">2005</span></li>
					optionStr = "<li><input type='checkbox' class='check_model' name='model' value='" + mobileModelFromServer + "' /><span class='content'>" + mobileModelFromServer + "</span></li>";
					$("#model_List_In_Filter_Screen").append(optionStr);		
				}
			}
		});
	}else{
		//If more than one Make is selected then remove all items in Model
		$("#model_List_In_Filter_Screen").html("");
		$("#model_List_In_Filter_Screen").append("<li>Select one Make</li>");
	}
}


function updateAutomobileModels(){
	//Get Selected Make. Also in case more than one Make is selected, don't update anything in the Model
	noOfBrandsSelected = 0;
	selectedBrand = "";
	$(".check_make").each(function(){
		if($(this).is(':checked')){
			noOfBrandsSelected ++;
			selectedBrand = $(this).val();
		}
	});
	//Fetch Models if only one Make is selected
	if(noOfBrandsSelected == 1 && selectedBrand != ""){
		$("#model_List_In_Filter_Screen").html("");
		$.ajax({
			url:"getAutomobileModels",
			data:{make:selectedBrand, vehicleType:$("#subCategory").val()},
			dataType:'json',
			type:'POST',
			success:function(res){
				for(var i=0; i<res.automobileModels.length; i++){
					automobileModelFromServer = res.automobileModels[i];
					//Format: <li><input type="checkbox" class="check_year" name="yearStr" value="2005" /><span class="content">2005</span></li>
					optionStr = "<li><input type='checkbox' class='check_model' name='model' value='" + automobileModelFromServer + "' /><span class='content'>" + automobileModelFromServer + "</span></li>";
					$("#model_List_In_Filter_Screen").append(optionStr);		
				}
			}
		});
	}else{
		//If more than one Make is selected then remove all items in Model
		$("#model_List_In_Filter_Screen").html("");
		$("#model_List_In_Filter_Screen").append("<li>Select one Make</li>");
	}
}

function updateTabModels(){
	//Get Selected Make. Also in case more than one Make is selected, don't update anything in the Model
	noOfBrandsSelected = 0;
	selectedBrand = "";
	$(".check_make").each(function(){
		if($(this).is(':checked')){
			noOfBrandsSelected ++;
			selectedBrand = $(this).val();
		}
	});
	
	//Fetch Models if only one Make is selected
	if(noOfBrandsSelected == 1 && selectedBrand != ""){
		$("#model_List_In_Filter_Screen").html("");
		$.ajax({
			url:"getTabModels",
			data:{make:selectedBrand},
			dataType:'json',
			type:'POST',
			success:function(res){
				for(var i=0; i<res.tabModels.length; i++){
					modelFromServer = res.tabModels[i];
					//Format: <li><input type="checkbox" class="check_year" name="yearStr" value="2005" /><span class="content">2005</span></li>
					optionStr = "<li><input type='checkbox' class='check_model' name='model' value='" + modelFromServer + "' /><span class='content'>" + modelFromServer + "</span></li>";
					$("#model_List_In_Filter_Screen").append(optionStr);		
				}
			}
		});
	}else{
		//If more than one Make is selected then remove all items in Model
		$("#model_List_In_Filter_Screen").html("");
		$("#model_List_In_Filter_Screen").append("<li>Select one Make</li>");
	}
}

