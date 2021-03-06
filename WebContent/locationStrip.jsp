<%@ taglib prefix="s" uri="/struts-tags"%>

<style>
	input[type="radio"]{margin-right:5px; margin-left:10px;}
</style>

	<div class="form-group">
		<label for="location" class="col-sm-3 control-label">City<span class="mandatory">*</span></label>
		<div class="col-sm-7" style="padding-top:7px;">
			<s:radio label="Choose City" theme="simple" name="city" id="city" list="#{'BLR':'Bangalore','CHE':'Chennai'}" value="city" onclick="cityChangeNotification(this.value)" />
			<div class="fieldTip" id="cityTip"></div>
			<div class="fieldTip" id="city_Error"></div>
		</div>
	</div>			
	<!--div class="form-group">
		<label for="location" class="col-sm-3 control-label">Location<span class="mandatory">*</span></label>
		<div class="col-sm-5">
			<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="userEnteredLocationStr" id="userEnteredLocationStr" 
			value="<s:property value='userEnteredLocationStr'/>" size="50" required onFocus="validateCity()" onBlur="hideToolTip('userEnteredLocationStrTip')" data-validate-type="location" >
			<div class="fieldTip" id="userEnteredLocationStrTip"></div>
			<div class="fieldTip" id="userEnteredLocationStr_Error"></div>
		</div>
	</div-->
	<div class="form-group">
		<label class="col-sm-3 control-label">Location<span class="mandatory">*</span></label>
		<div class="col-sm-3">
			<select class="dropDown" name="location" id="location" onChange="clear_Info_Error_Messages('location')">
				<option value='-1'>Select</option>
			</select>
			<div class="fieldTip" id="locationTip"></div>
			<div class="fieldTip" id="location_Error"></div>
		</div>
	</div>	

	<input type="hidden" id="contextPath" value='<%=request.getContextPath()%>' />


<script>
function validateCity(){
	if($("#cityBLR").attr("checked") != "checked" && $("#cityCHE").attr("checked") != "checked"){$("#userEnteredLocationStrTip").text("Please choose the City"); }
	else{$("#userEnteredLocationStrTip").text("Type the first 3 characters");}
	showToolTip('userEnteredLocationStrTip');
}

function getLocations(city){
	
	//Clearing any info/error messages for Model
	clear_Info_Error_Messages("location");
	
	$.ajax({
		url:"getLocations",
		data:{city:city},
		dataType:'json',
		type:'POST',
		success:function(res){
			$("#location").html("");
			$("#location").append("<option value='-1'>Select</option>");
			for(var key in res.locationMap){
				if (res.locationMap.hasOwnProperty(key)) {
					optionStr = "<option value='" + key + "'>" + res.locationMap[key] + "</option>";
					$("#location").append(optionStr);
	            }
			}
		}
	});
}

$(document).ready(function(){
	$("#cityBLR").bind("click",function(){
		getLocations("BLR");
	});
	$("#cityCHE").bind("click",function(){
		getLocations("CHE");
	});
});
</script>