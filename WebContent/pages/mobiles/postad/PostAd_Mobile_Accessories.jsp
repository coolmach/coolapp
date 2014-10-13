<%@ taglib prefix="s" uri="/struts-tags"%>

	<div>
		<input type="hidden" id="subCategory" name="subCategory" value="2">
		<div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Make<span class="mandatory">*</span></label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="brand" id="brand">
						<option value="Sony">Sony</option> 
						<option value="Nokia">Nokia</option>  
						<option value="Samsung">Samsung</option> 
						<option value="Micromax">Micromax</option>
						<option value="LG">LG</option> 
						<option value="Apple">Apple</option>
						<option value="Blackberry">Blackberry</option>
						<option value="HTC">HTC</option> 
						<option value="Karbonn">Karbonn</option> 
						<option value="Xolo">Xolo</option> 
						<optgroup label="Other Brands">
							<option value="Maxx">Maxx</option> 
	 						<option value="Motorola">Motorola</option> 
							<option value="Tata">Tata</option> 
							<option value="Spice">Spice</option> 
							<option value="iBall">iBall</option> 
							<option value="Lenovo">Lenovo</option> 
							<option value="Intex">Intex</option> 
							<option value="Fly">Fly</option> 
							<option value="Videocon">Videocon</option> 
							<option value="Lava">Lava</option> 
							<option value="MTS">MTS</option>
						</optgroup> 
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Model<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="locationTextBox" maxlength="16" placeholder="Enter Area (e.g. JP Nagar)" name="userEnteredModelStr" id="userEnteredModelStr" required>
					<input type="hidden" name="model" id="model">
					<input type="hidden" name="selectedModelStr" id="selectedModelStr">
					<input type="hidden" name="selectedBrand" id="selectedBrand">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Year of Purchase<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="4" name="year" id="year" value='<s:property value="year"/>' 
					required data-validate-type="amount" data-validate-errMessage="Please enter a valid year" data-infoTip="Please enter year of purchase"
					data-minVal="2000" data-maxVal="2015">
					<div class="fieldTip" id="yearTip"></div>
					<div class="fieldTip" id="year_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">Touch Screen</label>
				<div class="col-sm-6">
					<s:radio label="Choose Screen" theme="simple" name="touchScreen" id="touchScreen" list="#{'Y':'Yes','N':'No'}" value="postDetails.touchScreen" />
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">Dual Sim</label>
				<div class="col-sm-6">
					<s:radio label="Choose No of Sims" theme="simple" name="dualSim" id="dualSim" list="#{'Y':'Yes','N':'No'}" value="postDetails.dualSim" />
				</div>
			</div>				
			<div class="form-group">
				<label class="col-sm-3 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="12" name="sprice" id="sprice" value='<s:property value="sprice"/>' 
					required data-validate-type="amount" data-validate-errMessage="Please enter valid Price" data-infoTip="Please enter Price"
					data-minVal="1" data-maxVal="50000">
					<s:checkbox id="negotiable" name="negotiable" fieldValue="true" value="negotiable" label="Negotiable" theme="simple"/><span class="checkBoxText">Negotiable</span><BR>
					<div class="fieldTip" id="spriceTip"></div>
					<div class="fieldTip" id="sprice_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Contact Person Name<span class="mandatory">*</span></label>
				<div class="col-sm-4">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" id="ContactPersonName" value='<s:property value="ContactPersonName"/>' required data-validate-type="personName" data-validate-errMessage="Please enter valid Name" data-infoTip="Please enter Contact Person Name">
					<div class="fieldTip" id="ContactPersonNameTip"></div>
					<div class="fieldTip" id="ContactPersonName_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Contact Number<span class="mandatory">*</span></label>
				<div class="col-sm-4">
					<input type="text" class="form-control" maxlength="15" name="ContactNo" id="ContactNo" value='<s:property value="ContactNo"/>' required data-validate-type="phoneNumber" data-validate-errMessage="Please enter valid Phone Number" data-infoTip="Please enter Phone number">
					<div class="fieldTip" id="ContactNoTip"></div>
					<div class="fieldTip" id="ContactNo_Error"></div>
				</div>
			</div>										
		</div>
		
		<div class="row col-md-12" style="margin-left:0px; margin-bottom:10px; padding:10px;">
			<h5 style="color:rgb(127,127,127); font-size:14px;">
				<!-- a href="javascript:animatedcollapse.toggle('accordion_1')"></a-->
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_2">
          			<span class="glyphicon glyphicon-info-sign" style="color:rgb(255,201,14); font-size:16px; margin-right:10px;"></span>Click here to fill Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_2" class="collapse">
			<div class="form-group">
				<label class="col-sm-3 control-label">Operating System</label>
				<div class="col-sm-3">
					<s:select class="dropDown" style="height:30px;width:150px;" id="operatingSystem" name="operatingSystem" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'Android':'Android', 'Symbian(Nokia)':'Symbian(Nokia)', 'Windows':'Windows', 'Apple-iOS':'Apple-iOS', 'Blackberry':'Blackberry', 'Others':'Others'}"
						value="operatingSystem" />	
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Color</label>
				<div class="col-sm-3">
					<input type="text" maxlength="16" class="form-control" name="color" id="color" required data-infoTip="Please enter the color of mobile">
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-3 control-label">Other Features</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="4" maxlength="256" name="Description" id="Description"> <s:property value="Description"/> </textarea>
				</div>
			</div>										
		</div>
		<div style="margin-top:15px;"></div>
		<div class="form-group" style="margin-top:25px;">
			<div class="col-sm-5">
				<button type="submit" class="btn btn-primary pull-right" onClick="history.go(-1);">Back</button>
			</div>
			<div class="col-sm-3">
				<button type="submit" class="btn btn-primary pull-right">Post Ad</button>
			</div>
		</div>		
	</div>
	<!-- Apartment for Rent - END -->
	
	<script>
	$(document).ready(function(){
		if(isAnyAdditionalDetailPopulated()){
			//Some details are present in additional details section. Hence EXPAND this section
			$("#collapse_section_2").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_2").removeClass("in");
		}
	});
	
	function isAnyAdditionalDetailPopulated(){
		output = false;
		if(isTextFieldPopulated("color") || isTextFieldPopulated("Description")){
			output = true;
		}
		//alert("1 - " + output);
		if(isRadioButtonSelected()){
			output = true;
		}
		//alert("2 - : " + output);
		if(isDropDownSelected("operatingSystem")){
			output = true;
		}

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
	
	$(document).ready(function(){
		$("#sprice").on("blur", function(){
			amtStr = $("#sprice").val();
			$("#sprice").val(convertToAmountFormat(amtStr));
		});
	});
</script>