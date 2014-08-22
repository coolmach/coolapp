<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>
<script type="text/javascript" src="js/autocomplete.js"></script>
<script src="thirdparty/animatedcollapse/animatedcollapse.js"></script>
<script>
	//animatedcollapse.addDiv('accordion_1', 'fade=1');
	animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted
		
	}
	animatedcollapse.init();
</script>

<script>
	function toggle(newOrResale){
		if(newOrResale == "New"){
			$("#ageBlock").hide();
			$("#completionBlock").hide();
			$("#readyToOccupyParametersBlock").show();
			$("#readyToOccupy_Y").attr("checked", true);
			$("#readyToOccupy_N").attr("checked", false);
			
		}else{
			$("#readyToOccupyParametersBlock").hide();
			$("#completionDateBlock").hide();
			$("#ageBlock").show();
		}
	}
	function toggleNew(isReadyToOccupy){
		if(isReadyToOccupy == "No"){
			$("#completionDateBlock").show();
		}else{
			$("#completionDateBlock").hide();
		}
	}
</script>
<div class=" header_2">
	<div class=""></div>
	<!--div class="col-md-11">
		<a class="grey_link" href="<s:url action=""  />"></a>
		<s:property value="category" />
	</div-->
</div>
<s:form cssClass="form-horizontal post" action="real_estate_postAd.action" enctype="multipart/form-data">
<div class="row col-md-10" id="my">
	<input type="hidden" name="category" value="REAL"/>
	<input type="hidden" name="subCategory" value="1"/>
	<div class="col-md-8">
		<div class="form-group">
			<label for="title" class="col-sm-5 control-label">Title<span class="mandatory">*</span></label>
			<div class="col-sm-7">
				<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="<s:property value='title'/>" required>
			</div>
		</div>
		<%@include file="/locationStrip.jsp" %>
		<div class="form-group">
			<label class="col-sm-5 control-label">Property Type</label>
			<div class="col-sm-7" style="padding-top:6px;">
				<select class="dropDown" name="propertyType" id="propertyType">
					<option value="2">Apartment For Rent</option>
					<option value="3">Independent House For Rent</option>
					<option value="6">Roommate Required</option>
					<option value="1">Apartment For Sale</option>
					<option value="4">Independent House For Sale</option>
					<option value="5">PG Accommodation</option>
				</select>
			</div>
		</div>
		
		<!-- Apartment for Rent - START -->
		<div id="APARTMENT_FOR_RENT">
			<div class="form-group">
				<label for="Bedrooms" class="col-sm-5 control-label">No. of Bedrooms<span class="mandatory">*</span></label>
				<div class="col-sm-2">
					<select class="dropDownSmall" name="Bedrooms" id="Bedroom">
						<option value="">Select</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="2.5">2.5</option>
						<option value="3">3</option>
						<option value="3.5">3.5</option>
						<option value="4">4</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="area" class="col-sm-5 control-label">Total Area (sq. ft)<span class="mandatory">*</span></label>
				<div class="col-sm-4">
					<input type="text" class="form-control" maxlength="5" name="Area" id="Area" value="" required> 
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Rent<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="6" name="PriceValue" id="PriceValue" value="20000" required>
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Contact Person Name<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" value="" required>
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Contact Number<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="15" name="ContactNo" value="" required>
				</div>
			</div>						
		</div>
		
		<div class="row col-md-12" style="background-color:rgb(240,230,175); margin-left:0px; margin-bottom:10px; padding:10px; text-align:center;">
			<h5 style="color:rgb(127,127,127); font-size:14px;">
				<a href="javascript:animatedcollapse.toggle('accordion_1')">Additional Details</a>
			</h5>
		</div>
		<div id="accordion_1" style="border:1px solid rgb(240,230,175);">			
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Maintenance</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="5" name="Maintenance" id="Maintenance" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Preference</label>
				<div class="col-sm-7" style="padding-top:7px;">
					<input type="radio" class="form-control-radio" name="maritalPreference" id="maritalPreference" value="N" checked> <span class="form-control-radio-label">None</span>
					<input type="radio" class="form-control-radio" name="maritalPreference" id="maritalPreference" value="B"> <span class="form-control-radio-label">Bachelors</span>
					<input type="radio" class="form-control-radio" name="maritalPreference" id="maritalPreference" value="F"> <span class="form-control-radio-label">Family</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Furnished</label>
				<div class="col-sm-7" style="padding-top:7px;">
					<input type="radio" class="form-control-radio" name="furnished" id="furnished" value="N" checked> <span class="form-control-radio-label">No </span>
					<input type="radio" class="form-control-radio" name="furnished" id="furnished" value="S"> <span class="form-control-radio-label">Semi</span>
					<input type="radio" class="form-control-radio" name="furnished" id="furnished" value="F"> <span class="form-control-radio-label">Full</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Floor No (G-Ground Floor)</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" maxlength="2" name="FloorNumber" id="FloorNumber" value="G" required>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Facing Direction</label>
				<div class="col-sm-2">
					<select class="dropDown" name="FacingDirection" id="FacingDirection">
						<option value="N">North</option>
						<option value="S">South</option>
						<option value="E">East</option>
						<option value="W">West</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Amenities</label>
				<div class="col-sm-6" style="padding-top:10px;">
					<input type="checkbox" name="powerBackup" value="Y"><span class="checkBoxText">Power Backup</span><BR>
					<input type="checkbox" name="gym" value="Y"><span class="checkBoxText">Gym </span><BR>
					<input type="checkbox" name="carParking" value="Y"><span class="checkBoxText">Car Parking</span><BR>
					<input type="checkbox" name="childrenPlayArea" value="Y"><span class="checkBoxText">Children Park</span><BR>
					<input type="checkbox" name="clubHouse" value="Y"><span class="checkBoxText">Club House</span><BR>
					<input type="checkbox" name="swimmingPool" value="Y"><span class="checkBoxText">Swimming Pool </span><BR>
				</div>
			</div>									
		</div>
		<div class="form-group" style="margin-top:25px;">
			<div class="col-sm-offset-2 col-sm-5">
				<button type="submit" class="btn btn-primary pull-right" onClick="history.go(-1);">Back</button>
			</div>
			<div class="col-sm-offset-1 col-sm-3">
				<button type="submit" class="btn btn-primary pull-right">Post Ad</button>
			</div>
		</div>		
		<!-- Apartment for Rent - END -->
	</div>
	<div class="col-md-4">
		<div class="fileinput fileinput-new" data-provides="fileinput">
			<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 162px; height: 120px;"></div>
			<div>
				<span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
				<input type="file" name="upload" id="upload"></span>
				<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
		  	</div>
		</div>	
	</div>
</div>
</s:form>
 
<div class="col-md-5"></div>
