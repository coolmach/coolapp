
function showToolTip(toolTipName){
	$("#" + toolTipName).show();
}
function hideToolTip(toolTipName){
	$("#" + toolTipName).hide();
}
function validateForm(){
	result = true;
	$('input[data-validate-type="numeric"]').each(function(){
		fieldName = $(this).attr("id");
		errorDetail = $(this).attr("data-validate-errMessage");
		if(validateNumericField(fieldName, errorDetail) == false){
			return false;
		}
	});
	$('input[data-validate-type="amount"]').each(function(){
		fieldName = $(this).attr("id");
		errorDetail = $(this).attr("data-validate-errMessage");
		if(validateAmountField(fieldName, errorDetail) == false){
			return false;
		}
	});
	$('input[data-validate-type="phoneNumber"]').each(function(){
		fieldName = $(this).attr("id");
		errorResponse = $(this).attr("data-validate-errMessage");
		if(validatePhoneNumber(fieldName, errorDetail) == false){
			return false;
		}
	});
	$('input[data-validate-type="personName"]').each(function(){
		fieldName = $(this).attr("id");
		errorResponse = $(this).attr("data-validate-errMessage");
		if(validatePersonName(fieldName, errorDetail) == false){
			return false;
		}
	});	
	return result;
}

function attachEventHandlers(){
	//Attaching Event Handlers
	$('input[data-validate-type="numeric"]').each(function(){
		$(this).on("blur", function(){
			fieldName = $(this).attr("id");
			toolTipValue = $(this).attr("data-validate-errMessage");
			validateNumericField(fieldName, toolTipValue);
		});
	});
	
	$('input[data-validate-type="amount"]').each(function(){
		$(this).on("blur", function(){
			fieldName = $(this).attr("id");
			toolTipValue = $(this).attr("data-validate-errMessage");
			validateAmountField(fieldName, toolTipValue);
		});
	});
	
	$('input[data-validate-type="postTitle"]').each(function(){
		$(this).on("blur", function(){
			fieldName = $(this).attr("id");
			toolTipValue = $(this).attr("data-validate-errMessage");
			validateTitleField(fieldName, toolTipValue);
		});
	});
	
	$('input[data-validate-type="phoneNumber"]').each(function(){
		$(this).on("blur", function(){
			fieldName = $(this).attr("id");
			toolTipValue = $(this).attr("data-validate-errMessage");			
			validatePhoneNumber(fieldName, toolTipValue);
		});
	});
	
	$('input[data-validate-type="personName"]').each(function(){
		$(this).on("blur", function(){
			fieldName = $(this).attr("id");
			toolTipValue = $(this).attr("data-validate-errMessage");			
			validatePersonName(fieldName, toolTipValue);
		});
	});
	
	$('input[data-infoTip]').each(function(){
		$(this).on("focus", function(){
			fieldName = $(this).attr("id");
			infoTipName = "#" + fieldName + "Tip";
			infoDetail = $(this).attr("data-infoTip");
			$(infoTipName).text(infoDetail);
			$(infoTipName).show();
		});
		$(this).on("blur", function(){
			fieldName = $(this).attr("id");
			infoTipName = "#" + fieldName + "Tip";
			$(infoTipName).hide();
		});
	});
}

function validateNumericField(fieldName, errorDetail){
	fieldValue = $("#" + fieldName).val();
	result = isValidNumber(fieldValue); 
	showOrHideErrorTip(result, fieldName, errorDetail);
	return result;
}
function validateAmountField(fieldName, errorDetail){
	fieldValue = $("#" + fieldName).val();
	result = isValidAmount(fieldValue); 
	showOrHideErrorTip(result, fieldName, errorDetail);
	return result;
}
function validateTitleField(fieldName, errorDetail){
	fieldValue = $("#" + fieldName).val();
	result = isValidTitle(fieldValue); 
	showOrHideErrorTip(result, fieldName, errorDetail);
	return result;
}
function validatePhoneNumber(fieldName, errorDetail){
	fieldValue = $("#" + fieldName).val();
	fieldValue = fieldValue.replace(" ", "");
	result = isValidPhoneNumber(fieldValue); 
	showOrHideErrorTip(result, fieldName, errorDetail);
	return result;
}
function validatePersonName(fieldName, errorDetail){
	fieldValue = $("#" + fieldName).val();
	fieldValue = fieldValue.replace(" ", "");
	result = isValidPersonName(fieldValue); 
	showOrHideErrorTip(result, fieldName, errorDetail);
	return result;
}
function showOrHideErrorTip(isFieldProper, fieldName, errorDetail){
	errorTipName = "#" + fieldName + "_Error";
	infoTipName = "#" + fieldName + "Tip";
	fieldName = "#" + fieldName;
	if(isFieldProper == false){
		result = false;
		$(fieldName).focus();
		$(infoTipName).hide();
		$(errorTipName).text(errorDetail);
		$(errorTipName).show();
	}else{
		$(errorTipName).text("");
		$(errorTipName).hide();
	}
}
function isValidNumber(numericInput){
	pattern = new RegExp("[^0123456789]");
	isNotANumber = pattern.test(numericInput); //Check if input contains any other characters other than 0-9
	if(isNotANumber == true){
		return false; //Not a valid number
	}else{
		return true; //Valid number
	}
}
function isValidAmount(amountInput){
	//Check for non-numeric values
	var pattern = /[^0-9,]/g;
	isInvalidNumber = pattern.test(amountInput);
	if(isInvalidNumber == true){
		return false;
	}
	
	/* Check location of commas, E.g. 1,50,000.45
	 * The last comma in the string should have 3 digits after it.
	 * All other commas should have max 3 digits between it and the next comma.
	 */
	if(amountInput.indexOf(",") > -1){
		amountTokens = amountInput.split(",");
		lastToken = amountTokens[amountTokens.length - 1];
		if(lastToken.length != 3){
			return false;
		};
		var index;
		for(index=0; index<amountTokens.length-1; index++){
			token = amountTokens[index];
			if(token.length > 3){
				
				
				return false;
			};
		};
	}
	
	// Only 2 digits allowed beyond decimal point
	if(amountInput.indexOf(".") > -1){
		amountTokens = amountInput.split(".");
		lastToken = amountTokens[amountTokens.length - 1];
		if(lastToken.length > 2){
			return false;
		}
	};
	
	return true;
}

function convertToAmountFormat(amountInput){
	//Remove all commas
	amountInput = amountInput.replace(/,/g, "");
	indexOfDecimalPoint = amountInput.indexOf(".");
	stringBeforeDecimalPoint = amountInput;
	stringAfterDecimalPoint = "";
	if(indexOfDecimalPoint > -1){
		stringBeforeDecimalPoint = amountInput.substring(0, indexOfDecimalPoint);
		stringAfterDecimalPoint = amountInput.substring(indexOfDecimalPoint, amountInput.length);
	}
	
	if(amountInput.length == 4){
		stringBeforeDecimalPoint = amountInput[0] + "," + amountInput.substring(1,amountInput.length);
	}else if(amountInput.length == 5){
		stringBeforeDecimalPoint = amountInput.substring(0,2) + "," + amountInput.substring(2, amountInput.length + 1);
	}else if(amountInput.length == 6){
		stringBeforeDecimalPoint = amountInput[0] + "," + amountInput.substring(1,3) + "," + amountInput.substring(3,amountInput.length + 1);
	}else if(amountInput.length == 7){
		stringBeforeDecimalPoint = amountInput.substring(0,2) + "," + amountInput.substring(2,4) + "," + amountInput.substring(4, amountInput.length + 1);
	}else if(amountInput.length == 8){
		stringBeforeDecimalPoint = amountInput[0] + "," + amountInput.substring(1,3) + "," + amountInput.substring(3,5) + "," + amountInput.substring(5, amountInput.length + 1);
	}
	
	if(indexOfDecimalPoint > -1){
		output = stringBeforeDecimalPoint + "." + stringAfterDecimalPoint;
	}else{
		output = stringBeforeDecimalPoint;
	}
	
	return output;
}


function isValidPhoneNumber(phoneNumber){
	if(phoneNumber == ""){
		return true;
	}
	pattern = new RegExp("[^0123456789-]");
	//Check if any non-numeric value (apart from hyphen) is present
	isPhoneNumberNotValid = pattern.test(phoneNumber);
	//Length should be 10 digits
	if(isPhoneNumberNotValid == false){
		fieldValue = fieldValue.replace("-", "");
		if(fieldValue[0] == "0"){
			fieldValue = fieldValue.substring(1, fieldValue.substring(1, fieldValue.length - 2));
		}
		if(fieldValue.length != 10){
			isPhoneNumberNotValid = true;
		}
	}
	if(isPhoneNumberNotValid == true){
		return false;
	}else{
		return true;
	}
}
function isValidPersonName(personName){
	if(personName == ""){
		return true;
	}
	var pattern = /[!@#~`$%^*_+=;'?]/g;
	isPersonNameNotValid = pattern.test(personName);
	if(isPersonNameNotValid == true){
		return false;
	}else{
		return true;
	}
}
function isValidTitle(titleText){
	if(titleText == ""){
		return true;
	}
	if(titleText.length < 10){
		return false;
	}
	return true;
}


$(document).ready(function(){
	attachEventHandlers();
});

function expandOrCollapseAdditionalSection(){
	if(isAnyAdditionalDetailPopulated()){
		//Some details are present in additional details section. Hence EXPAND this section
		$("#collapse_section_1").addClass("in");
	}else{
		//No details are present in additional details section. Hence COLLAPSE this section
		$("#collapse_section_1").removeClass("in");
	}
}







