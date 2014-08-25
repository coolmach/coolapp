<%@ taglib prefix="s" uri="/struts-tags"%>
	<!-- Independent House for Sale - START -->
	<div id="INDEPENDENT_HOUSE_FOR_RENT">
		<input type="hidden" id="subCategory" name="subCategory" value="4">
		<div>
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
					<input type="text" class="form-control" maxlength="5" name="Area" id="Area" value='<s:property value="Area"/>' required> 
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Rent<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="6" name="PriceValue" id="PriceValue" value='<s:property value="PriceValue"/>' required>
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Contact Person Name<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" value='<s:property value="ContactPersonName"/>' required>
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Contact Number<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="15" name="ContactNo" value='<s:property value="ContactNo"/>' required>
				</div>
			</div>						
		</div>
		
		<div class="row col-md-12" style="background-color:rgb(240,230,175); margin-left:0px; margin-bottom:10px; padding:10px; text-align:center;">
			<h5 style="color:rgb(127,127,127); font-size:14px;">
				<!-- a href="javascript:animatedcollapse.toggle('accordion_1')"></a-->
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_3">
          			Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_3" class="collapse" style="border:1px solid rgb(240,230,175);">			
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Maintenance</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="5" name="Maintenance" id="Maintenance" value='<s:property value="Maintenance"/>'>
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
					<input type="text" class="form-control" maxlength="2" name="FloorNumber" id="FloorNumber" value='<s:property value="FloorNumber"/>'>
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
		<div style="margin-top:15px;"></div>
		<div class="form-group" style="margin-top:25px;">
			<div class="col-sm-offset-2 col-sm-5">
				<button type="submit" class="btn btn-primary pull-right" onClick="history.go(-1);">Back</button>
			</div>
			<div class="col-sm-offset-1 col-sm-3">
				<button type="submit" class="btn btn-primary pull-right">Post Ad</button>
			</div>
		</div>		
	</div>
	<!-- Independent House for Rent - END -->	