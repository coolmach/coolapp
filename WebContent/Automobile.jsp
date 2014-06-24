<%@ taglib prefix="s" uri="/struts-tags"%>

<div class=" header_2">
	<div class="col-md-12 filter_cat" style="margin-top:3.86%;">
		<div class="form-group pull-left searchFilter" id="sub-main" style="margin-left:4.5%;">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Type</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck" style="display: none;">
				<ul class="list-unstyled">
					<li value="1"><span class="content">Cars</span></li>
					<li value="2"><span class="content">Bikes/Scooters</span></li>
				</ul>
				<!-- <a href="#" class="clear blue_link">clear filters</a> -->
			</div>
		</div>
		
	 <form class="form-inline" id="cars"> 
			<div class=" pull-left hidden-subcat searchFilter" id="make-main">
				<div id="make" class="inputstyle pointer form-control">
					Make <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_make" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_make" name="make" value="MAR"/><span class="content">Maruti Suzuki</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="HYU"/><span class="content">Ford</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="FORD"/><span class="content">Fiat</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="HON"/><span class="content">Honda</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="HYU"/><span class="content">Hyundai</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="MAH"/><span class="content">Mahindra</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="CHE"/><span class="content">Chevrolet</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="NIS"/><span class="content">Nissan</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="REN"/><span class="content">Renault</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="SKO"/><span class="content">Skoda</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="TATA"/><span class="content">Tata</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="TOY"/><span class="content">Toyota</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="VOL"/><span class="content">Volkswagen</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="OTH"/><span class="content">Others</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="makeBikes-main">
				<div id="makeBikes" class="inputstyle pointer form-control">
					<span class="content">Make</span> <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_makeBikes" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="BAJ" /><span class="content">Bajaj</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="HER" /><span class="content">Hero Honda</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="HON" /><span class="content">Honda</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="ROY" /><span class="content">Royal Enfield</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="TVS" /><span class="content">TVS</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="YAM" /><span class="content">Yamaha</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="LML" /><span class="content">LML</span></li>
					<li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="SUZ" /><span class="content">Suzuki</span></li>
			        <li><input type="checkbox" class="check_brandBikes" name="brandBikes" value="Others" /><span class="content">Others</span></li>													
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="rent-main">
				<div id="rent" class="inputstyle pointer form-control">
					Rent <span
						class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_rent" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_rent" name="rent" value="<10,000" /><span class="content"><10,000</span>
						</li>
						<li><input type="checkbox" class="check_rent" name="rent" value="10,000-14,000" /><span class="content">10,000-14,000</span>
						</li>
						<li><input type="checkbox" class="check_rent" name="rent" value=">14,000" /><span class="content">>14,000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat" id="amt-main">
				<div id="amt" class="inputstyle pointer form-control">
					<span class="content">Price</span> <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_amt" class="subCategory_hidden_bck"
					style="display: none;">
					<ul class="list-unstyled">
					    <li><input type="checkbox" class="check_amt" name="amt" value="<15000" /><span class="content"><15,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="15000-30000" /><span class="content"><30,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="30000-40000" /><span class="content">30,000-40,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value="40000-50000" /><span class="content">40,000-50,000</span>
						</li>
						<li><input type="checkbox" class="check_amt" name="amt" value=">50000" /><span class="content">>50,000</span>
						</li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
		 </form> 
	</div>
	<div class="col-md-12 selected_filters" style="display:none;" id="filterValueBar"></div>
	
	<div class="col-md-12" id="breadCrumb">
	   <span id="cat" style="display:none"><s:property value="category" /></span>
	   <span id="sub" style="display:none"><s:property value="subCategory" /></span>
	
	<a class="grey_link" href="<s:url action=""  />">Home</a> >
		<span id="breadCrumb_Category"><s:property value="categoryStr" /></span> > 
		<span id="breadCrumb_SubCategory"><s:property value="subCategoryStr" /></span>
	</div>
</div>

<!-- <div class="col-md-4"></div> -->

<%@include file="AdList_Automobile.jsp" %>

<div id="right_LocationFilterSection">
	<div id="cityBar">
		<input type="radio" class="radioButton" name="city" id="city" value="BLR" checked><span class="radioCaption">Bangalore</span>
		<input type="radio" class="radioButton" name="city" id="city" value="CHE"><span class="radioCaption_RightAlign">Chennai</span>
	</div>
	<div id="locationSearchBar">
		<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="locSearch" id="locSearch">
		<img class="searchIcon" src="images/search_green_resized.png">	
	</div>
	<div id="locationDetails" style="display:none;">
		<div id="locationListBar">
			<div id="locationResultSection">
				<input type="checkbox" class="checkBox" name="location" id="location" value="23"><span class="radioCaption">Electronics City</span>
			</div>
			<div id="clearSection">
				<a class="smallLink" onClick="resetLocationFilter()">Clear Filter</a>
			</div>
		</div>
		<div id="horizontalSeparator">
			<hr>
		</div>
		<div id="neighborhoodLocationBar">
			<div id="heading">Nearby Areas</div>
			<div id="neighborAreaList">
				<table>
					<tr>
						<td><input type="checkbox" class="checkBox" name="location" id="location" value="23"><span class="radioCaption">Location 1</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" class="checkBox" name="location" id="location" value="23"><span class="radioCaption">Location 2</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" class="checkBox" name="location" id="location" value="23"><span class="radioCaption">Location 3</span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="companySearchBar">
		<input type="text" class="locationTextBox" placeholder="Enter Company (e.g. Infosys)" name="companySearch" id="companySearch">
		<img class="searchIcon" src="images/search_orange_resized.png">	
	</div>
			
</div>

<script>
	$("#breadCrumb_Category").html("Real Estate");
	if($("#breadCrumb_SubCategory").html() == ""){
		$("#breadCrumb_SubCategory").html("Apartment for Rent");
	}
</script>

<link rel="stylesheet" type="text/css" href="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.css"/>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>

<script>
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
					},
					error:function(data){
						alert(data.responseText);
					}
				});
			},
		    minLength: 2
		 });
	});
</script>

<script>
//if user clicks on Clear Filter in Location bar in Ad List page
function resetLocationFilter(event) {
	var ctxPath = $('#context_path').text();
	var path = "automobileFilter";
	$('input[class^=check_location]').attr("checked", false);
	
	subCat = $('#sub').text();
	cat = $('#cat').text();
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
		str = str+'<div style="margin-left:12px;" class="pull-left filters" id="'+div_Id+'">'+check+'<span style="margin-left:4px;" class="glyphicon glyphicon-remove form-control-show"id="'+div_Id+'">'+'</span>'+'</div >';
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
			$('.data').html('');
			$('.data').html(data);

		}
	});

	$("#locationListBar").html("")
	$("#horizontalSeparator").html("")
	$("#neighborhoodLocationBar").html("")
}
</script>