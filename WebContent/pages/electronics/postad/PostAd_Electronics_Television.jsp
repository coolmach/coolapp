<%@ taglib prefix="s" uri="/struts-tags"%>
	<div>
		<input type="hidden" id="subCategory" name="subCategory" value="1">
		<div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Make<span class="mandatory">*</span></label>
				<div class="col-sm-3" style="padding-top:6px;">
					<s:select class="dropDown" style="height:30px;width:120px;" id="brand" name="brand" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'Akai':'Akai','LG':'LG','Onida':'Onida','Panasonic':'Panasonic','Philips':'Philips','Samsung':'Samsung','Sansui':'Sansui','Sharp':'Sharp','Sony':'Sony','Toshiba':'Toshiba','Videocon':'Videocon','Others':'Others'}"
						value="brand" />				
					<div class="fieldTip" id="brandTip"></div>
					<div class="fieldTip" id="brand_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">Screen Type<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<s:select class="dropDown" style="height:30px;width:80px;" id="screenType" name="screenType" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'CRT':'CRT', 'LCD':'LCD', 'LED':'LED', 'Plasma':'Plasma', '4K':'4K','3D':'3D'}"
						value="screenType" />
					<div class="fieldTip" id="screenTypeTip"></div>
					<div class="fieldTip" id="screenType_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="12" name="sprice" id="sprice" value='<s:property value="sprice"/>' 
					required data-validate-type="amount" data-validate-errMessage="Please enter valid Price" data-infoTip="Please enter Price"
					data-minVal="1" data-maxVal="100000">
					<s:checkbox id="negotiable" name="negotiable" fieldValue="true" value="negotiable" label="Negotiable" theme="simple"/><span class="checkBoxText">Negotiable</span><BR>
					<div class="fieldTip" id="spriceTip"></div>
					<div class="fieldTip" id="sprice_Error"></div>
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
				<label class="col-sm-3 control-label">Model</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="20" name="model" id="model" value='<s:property value="model"/>' 
					 data-infoTip="e.g. Bravia/Plano/etc."> 
					<div class="fieldTip" id="modelTip"></div>
					<div class="fieldTip" id="model_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Screen Size (inches)</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="4" name="screenSize" id="screenSize" value='<s:property value="screenSize"/>' 
					 data-validate-type="numeric" data-validate-errMessage="Please enter valid Screen Size" data-infoTip="Please enter Screen Size in inches"> 
					<div class="fieldTip" id="screenSizeTip"></div>
					<div class="fieldTip" id="screenSize_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">Stabilizer Available</label>
				<div class="col-sm-6">
					<s:radio label="Do you have Stabilizer too" theme="simple" name="stabilizer" id="stabilizer" list="#{'Y':'Yes','N':'No'}" value="stabilizer" />
					<div class="fieldTip" id="stabilizerTip"></div>
					<div class="fieldTip" id="stabilizer_Error"></div>
				</div>
			</div>
			<!--div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">USB Support</label>
				<div class="col-sm-6">
					<s:radio label="USB Port Availability" theme="simple" name="usb" id="usb" list="#{'Y':'Yes','N':'No'}" value="usb" />
					<div class="fieldTip" id="usbTip"></div>
					<div class="fieldTip" id="usb_Error"></div>
				</div>
			</div>			
			<div class="form-group">
				<label for="furnished" class="col-sm-3 control-label">HDMI Support</label>
				<div class="col-sm-6">
					<s:radio label="HDMI Port Availability" theme="simple" name="hdmi" id="hdmi" list="#{'Y':'Yes','N':'No'}" value="hdmi" />
					<div class="fieldTip" id="hdmiTip"></div>
					<div class="fieldTip" id="hdmi_Error"></div>
				</div>
			</div-->
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
		if(isTextFieldPopulated("screenSize") || isTextFieldPopulated("model")){
			output = true;
		}
	
		//alert("2 - : " + output);
		if(isRadioButtonSelected("stabilizerY") || isRadioButtonSelected("stabilizerN")){
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
	
	//Make
	if($("#screenType").val() == "-1"){
		showOrHideErrorTip(false, "screenType", "Please choose the Screen Type");
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