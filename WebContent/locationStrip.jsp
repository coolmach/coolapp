	<div class="form-group">
		<label for="location" class="col-sm-5 control-label">City</label>
		<div class="col-sm-7" style="padding-top:7px;">
			<input type="radio" class="radioButton" name="city" id="city" value="BLR" checked><span class="radioCaption">Bangalore</span>
			<input type="radio" class="radioButton" name="city" id="city" value="CHE"><span class="radioCaption_RightAlign">Chennai</span>
		</div>
	</div>			
	<div class="form-group">
		<label for="location" class="col-sm-5 control-label">Location<span class="mandatory">*</span></label>
		<div class="col-sm-7">
			<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="userEnteredLocationStr" id="userEnteredLocationStr" required>
		</div>
	</div>
	<input type="hidden" name="selectedCityCode" id="selectedCityCode">
	<input type="hidden" name="selectedLocationCode" id="selectedLocationCode">
	<input type="hidden" name="selectedLocationStr" id="selectedLocationStr">
	<input type="hidden" id="contextPath" value='<%=request.getContextPath()%>' />

	
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>	