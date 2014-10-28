<%@ taglib prefix="s" uri="/struts-tags"%>

	<div>
		<input type="hidden" id="subCategory" name="subCategory" value="1">
		<div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Make<span class="mandatory">*</span></label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="make" id="make" onchange="getModels(false)">
						<option value="-1">Select</option>
						<option value="Maruti Suzuki">Maruti Suzuki</option> 
						<option value="Hyundai">Hyundai</option>  
						<option value="Honda">Honda</option> 
						<option value="Toyota">Toyota</option>
						<option value="Renault">Renault</option> 
						<option value="Ford">Ford</option>
					</select>
					<div class="fieldTip" id="makeTip"></div>
					<div class="fieldTip" id="make_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Model<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<select class="dropDown" name="model" id="model" onChange="clear_Info_Error_Messages('model')">
						<option value='-1'>Select</option>
					</select>
					<div class="fieldTip" id="modelTip"></div>
					<div class="fieldTip" id="model_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">Fuel Type<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<s:select class="dropDown" style="height:30px;width:120px;" id="fuelType" name="fuelType" theme="simple"
					headerKey="-1" headerValue="Select" 
					list="#{'Petrol':'Petrol','Diesel':'Diesel','Gas':'Gas'}" value="fuelType" />
					<div class="fieldTip" id="fuelTypeTip"></div>
					<div class="fieldTip" id="fuelType_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">Year<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<s:select class="dropDown" style="height:30px;width:120px;" id="year" name="year" theme="simple"
					headerKey="-1" headerValue="Select"
					list="#{'1':'Not Known','2014':'2014','2013':'2013','2012':'2012','2011':'2011','2010':'2010','2009':'2009','2008':'2008','2007':'2007','2006':'2006','2005':'2005','2004':'2004','2003':'2003','2002':'2002','2001':'2001','2000':'2000','2':'Older than 2000'}" 
					value="year" />
					<div class="fieldTip" id="yearTip"></div>
					<div class="fieldTip" id="year_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="12" name="sprice" id="sprice" value='<s:property value="sprice"/>' 
					required data-validate-type="amount" data-validate-errMessage="Please enter valid Price" data-infoTip="Please enter Price"
					data-minVal="10000" data-maxVal="1500000">
					<s:checkbox id="negotiable" name="negotiable" fieldValue="true" value="negotiable" label="Negotiable" theme="simple"/><span class="checkBoxText">Negotiable</span><BR>
					<div class="fieldTip" id="spriceTip"></div>
					<div class="fieldTip" id="sprice_Error"></div>
				</div>
			</div>			
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">Registration State<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<s:select class="dropDown" style="height:30px;width:150px;" id="regState" name="regState" theme="simple"
					headerKey="-1" headerValue="Select"
					list="#{'Andhra Pradesh':'Andhra Pradesh','Arunachal Pradesh':'Arunachal Pradesh','Assam':'Assam','Bihar':'Bihar','Chandigarh':'Chandigarh','Chhattisgarh':'Chhattisgarh','Delhi':'Delhi','Goa':'Goa','Gujarat':'Gujarat','Haryana':'Haryana','Himachal Pradesh':'Himachal Pradesh','Jammu and Kashmir':'Jammu and Kashmir','Jharkhand':'Jharkhand','Karnataka':'Karnataka','Kerala':'Kerala','Madhya Pradesh':'Madhya Pradesh','Maharashtra':'Maharashtra','Manipur':'Manipur','Meghalaya':'Meghalaya','Mizoram':'Mizoram','Nagaland':'Nagaland','Odisha':'Odisha','Puducherry':'Puducherry','Punjab':'Punjab','Rajasthan':'Rajasthan','Sikkim':'Sikkim','Tamil Nadu':'Tamil Nadu','Telangana':'Telangana','Tripura':'Tripura','Uttar Pradesh':'Uttar Pradesh','Uttarakhand':'Uttarakhand','West Bengal':'West Bengal'}" 
					value="regState" />
					<div class="fieldTip" id="regStateTip"></div>
					<div class="fieldTip" id="regState_Error"></div>
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
				<label class="col-sm-3 control-label">Color</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" maxlength="30" name="color" id="color" value='<s:property value="color"/>' 
					data-validate-type="color" data-validate-errMessage="Please enter valid Color" data-infoTip="Please enter Color">
					<div class="fieldTip" id="colorTip"></div>
					<div class="fieldTip" id="color_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">No. of Owners (including me)</label>
				<div class="col-sm-6">
					<s:select class="dropDown" style="height:30px;width:80px;" id="noOfOwners" name="noOfOwners" theme="simple"
					headerKey="-1" headerValue="Select" 
					list="#{'1':'1','2':'2','3':'3','4':'4','5':'5'}" value="noOfOwners" />
					<div class="fieldTip" id="noOfOwnersTip"></div>
					<div class="fieldTip" id="noOfOwners_Error"></div>
				</div>
			</div>			
			<div class="form-group">
				<label class="col-sm-3 control-label">Insurance Renewed</label>
				<div class="col-sm-6">
					<s:radio label="Specify Insurance Availability" theme="simple" name="insuranceAvailable" id="insuranceAvailable" list="#{'Y':'Yes','N':'No'}" value="insuranceAvailable" />
					<div class="fieldTip" id="insuranceAvailableTip"></div>
					<div class="fieldTip" id="insuranceAvailable_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-3 control-label">Other Features</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="4" maxlength="250" name="Description" id="Description"><s:property value="Description"/></textarea>
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
		if(isTextFieldPopulated("color", "Description")){
			output = true;
		}
	
		if(isDropDownSelected("noOfOwners")){
			output = true;
		}

		if(isRadioButtonSelected("insuranceAvailable")){
			output = true;
		}
		
		return output;
	}
	
	$(document).ready(function(){
		$("#sprice").on("blur", function(){
			amtStr = $("#sprice").val();
			$("#sprice").val(convertToAmountFormat(amtStr));
		});
	});
</script>
<script>



function getModels(shouldAnyModelGetHighlighted){
	
	//Clearing any info/error messages for Model
	clear_Info_Error_Messages("make");
	
	//Get Models for the selected Brand
	brand = $("#make").val();
	$("#model").html("");
	$("#model").append("<option value='-1'>Select</option>");
	$.ajax({
		url:"getAutomobileModels",
		data:{make:brand, vehicleType:'1'},
		dataType:'json',
		type:'POST',
		success:function(res){
			for(var i=0; i<res.automobileModels.length; i++){
				automobileModel = res.automobileModels[i];
				optionStr = "<option value='" + automobileModel + "'>" + automobileModel + "</option>";
				$("#model").append(optionStr);		
			}
			$("#model").append("<option value='Others'>Others</option>");
			
			//After populating the models, one of them should be selected (use case: Form is reloaded when user enters some incorrect data. In this case, the model chosen by the user earlier should be selected) 
			if(shouldAnyModelGetHighlighted == true){
				selectedModel = "${action.postDetails.model}";
				if(selectedModel != null && selectedModel.length > 1){
					$("#model").val(selectedModel);
				}
			}
		}
	});

}
function localValidations(){
	if($("#cityBLR").attr("checked") != "checked" && $("#cityCHE").attr("checked") != "checked"){
		showOrHideErrorTip(false, "city", "Please select a City");
		$("#cityBLR").focus();
		return false;
	}
	if($("#make").val() == "-1"){
		showOrHideErrorTip(false, "make", "Please choose a Make");
		return false;
	}
	if($("#model").val() == "-1"){
		showOrHideErrorTip(false, "model", "Please choose a Model");
		return false;
	}
	if($("#fuelType").val() == "-1"){
		showOrHideErrorTip(false, "fuelType", "Please choose Petrol/Diesel");
		return false;
	}
	if($("#year").val() == "-1"){
		showOrHideErrorTip(false, "year", "Please choose the Year(Model)");
		return false;
	}
	if($("#regState").val() == "-1"){
		showOrHideErrorTip(false, "regState", "Please specify the Registration State");
		return false;
	}
	return validateForm();
	
	
}

function attachClearEventsToDropDown(){
	$("select").each(function(){
		//HTML to JQuery Element
		var jqueryElement = $(this);
		var elementId = $(jqueryElement).attr("id");
		var infoTipDivTagName = "#" + elementId + "Tip";
		var errorDivTagName = "#" + elementId + "_Error";
		var third = "Hello";
		
		$(jqueryElement).change({elementId:elementId}, function (event){
			info = "#" + event.data.elementId + "Tip";
			err = "#" + event.data.elementId + "_Error";

			$(info).html("");
			$(err).html("");
		});
	});
}

$(document).ready(function(){
	//Populate drop down value to that selected by user before form submission
	selectedBrand = "${action.postDetails.make}";
	
	if(selectedBrand != null && selectedBrand.length > 1){
		$("#make").val(selectedBrand);
		
		//Populate the Models Drop down
		getModels(true);
	}
	
	//To reset error/info messages of SELECT elements, on change event.
	attachClearEventsToDropDown();
});

</script>
