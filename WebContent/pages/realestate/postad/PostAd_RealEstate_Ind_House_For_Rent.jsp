<%@ taglib prefix="s" uri="/struts-tags"%>

<script>

	$(document).ready(function(){
		if(isAnyAdditionalDetailPopulated()){
			//Some details are present in additional details section. Hence EXPAND this section
			$("#collapse_section_4").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_4").removeClass("in");
		}
	});
	
	function isAnyAdditionalDetailPopulated(){
		output = false;
		if(isTextFieldPopulated("Deposit") || isTextFieldPopulated("FloorNumber") || isTextFieldPopulated("Maintenance")){
			output = true;
		}
		//alert("1 - " + output);
		if(isRadioButtonSelected()){
			output = true;
		}
		//alert("2 - : " + output);
		if(isDropDownSelected("FacingDirection")){
			output = true;
		}

		//alert("4 - " + output);
		//alert("Returning " + output);
		return output;
	}
	
	function isTextFieldPopulated(fieldName){
		if($("#" + fieldName).val().length === 0){
			return false;
		}else{
			return true;
		}
	}
	
	function isDropDownSelected(fieldName){
		if($("#" + fieldName).val() === "-1"){
			return false;
		}else{
			return true;
		}
	}
	
	function isRadioButtonSelected(){
		if($('#furnishedN').is(':checked') || $('#furnishedP').is(':checked') || $('#furnishedF').is(':checked')
				|| $('#maritalPreferenceF').is(':checked') || $('#maritalPreferenceB').is(':checked') || $('#maritalPreferenceN').is(':checked')) {
			return true;
		}else{
			return false;
		}
	}
	
</script>

	<!-- Apartment for Rent - START -->
	<div id="APARTMENT_FOR_RENT">
		<input type="hidden" id="subCategory" name="subCategory" value="4">
		<div>
			<div class="form-group">
				<label class="col-sm-5 control-label">No. of Bedrooms<span class="mandatory">*</span></label>
				<div class="col-sm-2">
					<s:select class="dropDown" style="height:30px;width:80px;" id="Bedrooms" name="Bedrooms" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'1':'1', '2':'2', '2.5':'2.5', '3':'3', '4':'4'}"
						value="Bedrooms" />			
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Total Area (sq. ft)<span class="mandatory">*</span></label>
				<div class="col-sm-4">
					<s:if test="Area == ''">
						<input type="text" class="form-control" maxlength="5" name="Area" id="Area" required>
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="5" name="Area" id="Area" value='<s:property value="Area"/>' required>
					</s:else> 
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Rent<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<s:if test="PriceValue == ''">
						<input type="text" class="form-control" maxlength="6" name="PriceValue" id="PriceValue" required>
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="6" name="PriceValue" id="PriceValue" value='<s:property value="PriceValue"/>' required>
					</s:else>
					
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Contact Person Name<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" value='<s:property value="ContactPersonName"/>' required>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Contact Number<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="15" name="ContactNo" value='<s:property value="ContactNo"/>' required>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-5 control-label">Other Features</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" maxlength="256" name="Description" id="Description"> <s:property value="Description"/> </textarea>
				</div>
			</div>										
		</div>
		
		<div class="row col-md-12" style="background-color:rgb(240,230,175); margin-left:0px; margin-bottom:10px; padding:10px; text-align:center;">
			<h5 style="color:rgb(127,127,127); font-size:14px;">
				<!-- a href="javascript:animatedcollapse.toggle('accordion_1')"></a-->
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_4">
          			Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_4" class="collapse" style="border:1px solid rgb(240,230,175);">
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Maintenance</label>
				<div class="col-sm-3">
					<s:if test="Maintenance== ''">
						<input type="text" class="form-control" maxlength="5" name="Maintenance" id="Maintenance" value=''>
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="5" name="Maintenance" id="Maintenance" value='<s:property value="Maintenance"/>'>
					</s:else>
				</div>
			</div>		
			<div class="form-group">
				<label for="priceValue" class="col-sm-5 control-label">Security Deposit</label>
				<div class="col-sm-3">
					<s:if test="Deposit== ''">
						<input type="text" class="form-control" maxlength="6" name="Deposit" id="Deposit" value=''>
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="6" name="Deposit" id="Deposit" value='<s:property value="Deposit"/>'>
					</s:else>
				</div>
			</div>		
			<div class="form-group">
				<label class="col-sm-5 control-label">Floor No (G-Ground Floor)</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" maxlength="2" name="FloorNumber" id="FloorNumber" value='<s:property value="FloorNumber"/>'>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-5 control-label">Furnished</label>
				<div class="col-sm-6">
					<s:radio label="Choose Furnishing Type" theme="simple" name="furnished" id="furnished" list="#{'N':'No','P':'Partial','F':'Full'}" value="postDetails.furnished" />
				</div>
			</div>
			<div class="form-group">
				<label for="maritalPreference" class="col-sm-5 control-label">Preference</label>
				<div class="col-sm-7">
					<s:radio label="Choose Preference" theme="simple" name="maritalPreference" id="maritalPreference" list="#{'B':'Bachelors','F':'Family','N':'Any'}" value="postDetails.maritalPreference" />
				</div>
			</div>				
			<div class="form-group">
				<label class="col-sm-5 control-label">Facing Direction</label>
				<div class="col-sm-2">
					<s:select class="dropDown" style="height:30px;width:100px;" id="FacingDirection" name="FacingDirection" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'E':'East', 'W':'West', 'N':'North', 'S':'South'}"
						value="FacingDirection" />
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
	<!-- Apartment for Rent - END -->