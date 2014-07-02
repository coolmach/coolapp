

	<div class="form-group">
		<label for="location" class="col-sm-4 control-label">City</label>
		<div class="col-sm-6">
			<input type="radio" class="radioButton" name="city" id="city" value="BLR" checked><span class="radioCaption">Bangalore</span>
			<input type="radio" class="radioButton" name="city" id="city" value="CHE"><span class="radioCaption_RightAlign">Chennai</span>
		</div>
	</div>			
	<div class="form-group">
		<label for="location" class="col-sm-4 control-label">Location<span class="mandatory">*</span></label>
		<div class="col-sm-6">
			<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="userEnteredLocationStr" id="userEnteredLocationStr" required>
		</div>
	</div>
	<input type="hidden" name="selectedCityCode" id="selectedCityCode">
	<input type="hidden" name="selectedLocationCode" id="selectedLocationCode">
	<input type="hidden" name="selectedLocationStr" id="selectedLocationStr">
	<input type="hidden" id="contextPath" value='<%=request.getContextPath()%>' />

