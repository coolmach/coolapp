<%@ taglib prefix="s" uri="/struts-tags"%>
	<div>
		<input type="hidden" id="subCategory" name="subCategory" value="4">
		<div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Make<span class="mandatory">*</span></label>
				<div class="col-sm-3" style="padding-top:6px;">
					<s:select class="dropDown" style="height:30px;width:120px;" id="brand" name="brand" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'Godrej':'Godrej','LG':'LG','Onida':'Onida','Samsung':'Samsung','Videocon':'Videocon','Whirlpool':'Whirlpool','Others':'Others'}"  
						value="brand" />				
					<div class="fieldTip" id="brandTip"></div>
					<div class="fieldTip" id="brand_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">No. of Doors<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<s:select class="dropDown" style="height:30px;width:120px;" id="doubleDoor" name="doubleDoor" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'N':'Single', 'Y':'Double'}"
						value="doubleDoor" />
					<div class="fieldTip" id="doubleDoorTip"></div>
					<div class="fieldTip" id="doubleDoor_Error"></div>
				</div>
			</div>			
			<div class="form-group">
				<label class="col-sm-3 control-label">Age in Years<span class="mandatory">*</span></label>
				<div class="col-sm-3" style="padding-top:6px;">
					<s:select class="dropDown" style="height:30px;width:120px;" id="year" name="year" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'0.5':'< 1 year old','1.5':'1-2 years old','2.5':'2-3 years old','3.5':'3-4 years old','4.5':'4-5 years old','5.5':'> 5 years old'}"
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
					data-minVal="500" data-maxVal="100000">
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
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_1">
          			<span class="glyphicon glyphicon-info-sign" style="color:rgb(255,201,14); font-size:16px; margin-right:10px;"></span>Click here to fill Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_1" class="collapse">
			<div class="form-group">
				<label class="col-sm-3 control-label">Model</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="20" name="model" id="model" value='<s:property value="model"/>' 
					 data-infoTip="Please enter the Model"> 
					<div class="fieldTip" id="modelTip"></div>
					<div class="fieldTip" id="model_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Capacity (litres)</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="4" name="capacity" id="capacity" value='<s:property value="capacity"/>' 
					 data-validate-type="floatingPoint" data-validate-errMessage="Please specify the Capacity" data-infoTip="Please enter Capacity"> 
					<div class="fieldTip" id="capacityTip"></div>
					<div class="fieldTip" id="capacity_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Color</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="10" name="color" id="color" value='<s:property value="color"/>' 
					 data-validate-errMessage="Please specify the Color" data-infoTip="Please enter Color"> 
					<div class="fieldTip" id="colorTip"></div>
					<div class="fieldTip" id="color_Error"></div>
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
			$("#collapse_section_1").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_1").removeClass("in");
		}
	});
	
	function isAnyAdditionalDetailPopulated(){
		output = false;
		if(isTextFieldPopulated("model", "Description")){
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

function localValidations(){
	//City
	if($("#cityBLR").attr("checked") != "checked" && $("#cityCHE").attr("checked") != "checked"){
		showOrHideErrorTip(false, "city", "Please select a City");
		$("#cityBLR").focus();
		return false;
	}
	if($("#brand").val() == "-1"){
		showOrHideErrorTip(false, "brand", "Please choose the Make");
		return false;
	}
	if($("#doubleDoor").val() == "-1"){
		showOrHideErrorTip(false, "playerType", "Please choose the number of doors");
		return false;
	}
	if($("#year").val() == "-1"){
		showOrHideErrorTip(false, "year", "Please choose the Age");
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
	selectedBrand = "${action.postDetails.brand}";
	
	if(selectedBrand != null && selectedBrand.length > 1){
		$("#brand").val(selectedBrand);
		
	}
	
	//To reset error/info messages of SELECT elements, on change event.
	attachClearEventsToDropDown();
});

</script>