<%@ taglib prefix="s" uri="/struts-tags"%>

<style>
	input[type="radio"]{margin-right:5px; margin-left:10px;}
</style>

	<div class="form-group">
		<label for="location" class="col-sm-3 control-label">City<span class="mandatory">*</span></label>
		<div class="col-sm-7" style="padding-top:7px;">
			<s:radio label="Choose City" theme="simple" name="city" id="city" list="#{'BLR':'Bangalore','CHE':'Chennai'}" value="postDetails.city" onclick="populateApprovalAuthority(this.value)" />
		</div>
	</div>			
	<div class="form-group">
		<label for="location" class="col-sm-3 control-label">Location<span class="mandatory">*</span></label>
		<div class="col-sm-5">
			<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="userEnteredLocationStr" id="userEnteredLocationStr" 
			value="<s:property value='postDetails.userEnteredLocationStr'/>" size="50" required onFocus="validateCity()" onBlur="hideToolTip('userEnteredLocationStrTip')" data-validate-type="location" >
			<div class="fieldTip" id="userEnteredLocationStrTip"></div>
			<div class="fieldTip" id="userEnteredLocationStr_Error"></div>
		</div>
	</div>
	<input type="hidden" name="selectedCityCode" id="selectedCityCode" value="<s:property value='postDetails.selectedCityCode'/>">
	<input type="hidden" name="selectedLocationCode" id="selectedLocationCode" value="<s:property value='postDetails.selectedLocationCode'/>">
	<input type="hidden" name="selectedLocationStr" id="selectedLocationStr" value="<s:property value='postDetails.selectedLocationStr'/>">
	<input type="hidden" id="contextPath" value='<%=request.getContextPath()%>' />


<script>
function validateCity(){
	if($("#cityBLR").attr("checked") != "checked" && $("#cityCHE").attr("checked") != "checked"){$("#userEnteredLocationStrTip").text("Please choose the City"); }
	else{$("#userEnteredLocationStrTip").text("Type the first 3 characters");}
	showToolTip('userEnteredLocationStrTip');
}
</script>