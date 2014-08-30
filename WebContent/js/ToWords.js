function amountToWords(s){
	s = s.toString();
	if (s != parseFloat(s)) return 'Not a number';
	x = s.indexOf('.');
	if(x > 0){
		s = s.substring(0,x);
	}
	length = s.length;
	if(length == 1){
		s = translate_Ones(s);
	}else if(length == 2){
		s = translate_Tens(s);
	}else if(length == 3){
		s = translate_Hundreds(s);
	}else if(length == 4){
		s = translate_Thousands(s);
	}else if(length == 5){
		s = translate_10_Thousands(s);
	}else if(length == 6){
		s = translate_Lakh(s);
	}else if(length == 7){
		s = translate_10_Lakh(s);
	}else if(length == 8){
		s = translate_Crore(s);
	}else if(length == 9){
		s = translate_10_Crore(s);
	}
	return s;
}

function get_Ones(s){
	if(s == "0"){ return "";}
	else if(s == "1"){ return "One";}
	else if(s == "2"){ return "Two";}
	else if(s == "3"){ return "Three";}
	else if(s == "4"){ return "Four";}
	else if(s == "5"){ return "Five";}
	else if(s == "6"){ return "Six";}
	else if(s == "7"){ return "Seven";}
	else if(s == "8"){ return "Eight";}
	else if(s == "9"){ return "Nine";}
	else{ return s;}
}

function get_Tens(s){
	if(s == "2"){ return "Twenty";}
	else if(s == "3"){ return "Thirty";}
	else if(s == "4"){ return "Forty";}
	else if(s == "5"){ return "Fifty";}
	else if(s == "6"){ return "Sixty";}
	else if(s == "7"){ return "Seventy";}
	else if(s == "8"){ return "Eighty";}
	else if(s == "9"){ return "Ninety";}
	else{ return s;}
}

//1 digit (rupee)
function translate_Ones(s){
	if(s == "0"){
		return "";
	}
	return get_Ones(s);
}

//2 digits (tens)
function translate_Tens(s){
	if(s == "00"){
		return "";
	}
	var tensDigit = s.substring(0,1);
	var onesDigit = s.substring(1,2);
	var onesDescription = "";
	var tensDescription = "";
	if(tensDigit == "1"){
		if(onesDigit == "0"){ tensDescription = "Ten";}
		else if(onesDigit == "1"){ tensDescription =  "Eleven";}
		else if(onesDigit == "2"){ tensDescription = "Twelve";}
		else if(onesDigit == "3"){ tensDescription = "Thirteen";}
		else if(onesDigit == "4"){ tensDescription = "Fourteen";}
		else if(onesDigit == "5"){ tensDescription = "Fifteen";}
		else if(onesDigit == "6"){ tensDescription = "Sixteen";}
		else if(onesDigit == "7"){ tensDescription = "Seventeen";}
		else if(onesDigit == "8"){ tensDescription = "Eighteen";}
		else if(onesDigit == "9"){ tensDescription = "Nineteen";}
	}else{
		if(tensDigit != "0"){
			tensDescription = get_Tens(tensDigit);
		}
		if(onesDigit != "0"){
			onesDescription = get_Ones(onesDigit);
		}
	}
	
	var output = "";
	if(tensDescription != ""){
		output = output + tensDescription;
	}
	output = output + onesDescription;
	return tensDescription + " " + onesDescription;
}

//3 digits (hundreds)
function translate_Hundreds(s){
	if(s == "000"){
		return "";
	}
	var hundredsDigit = s.substring(0,1);
	var remaining_2_Digits = s.substring(1,3);
	var hundredsDescription = translate_Ones(hundredsDigit);
	var remainingDescription = translate_Tens(remaining_2_Digits);
	var output = "";
	if(hundredsDescription != ""){
		output = output + hundredsDescription + " " + "Hundred";
		if(remainingDescription != ""){
			output = output + " And " + remainingDescription;
		}
	}else{
		if(remainingDescription != ""){
			output = remainingDescription;
		}
	}
	return output;
}

//4 digits (thousands)
function translate_Thousands(s){

	if(s == "0000"){
		return "";
	}
	var firstDigit = s.substring(0,1);
	var remainingDigits = s.substring(1,4);
	var firstDescription = translate_Ones(firstDigit);
	var remainingDescription = translate_Hundreds(remainingDigits);
	var output = "";
	if(firstDescription != ""){
		output = output + firstDescription + " " + "Thousand";
		if(remainingDescription != ""){
			output = output + " And " + remainingDescription;
		}
	}else{
		if(remainingDescription != ""){
			output = remainingDescription;
		}
	}

	return output;
}

//5 digits (ten thousands)
function translate_10_Thousands(s){
	if(s == "00000"){
		return "";
	}
	var firstDigit = s.substring(0,2);
	var remainingDigits = s.substring(2,5);
	var firstDescription = translate_Tens(firstDigit);
	var remainingDescription = translate_Hundreds(remainingDigits);
	var output = "";
	if(firstDescription != ""){
		output = output + firstDescription + " " + "Thousand";
		if(remainingDescription != ""){
			output = output + " " + remainingDescription;
		}
	}else{
		if(remainingDescription != ""){
			output = remainingDescription;
		}
	}
	return output; 
}

//6 digits (lakh)
function translate_Lakh(s){
	if(s == "000000"){
		return "";
	}
	var firstDigit = s.substring(0,1);
	var remainingDigits = s.substring(1,6);
	var firstDescription = translate_Ones(firstDigit);
	var remainingDescription = translate_10_Thousands(remainingDigits);
	var output = "";
	if(firstDescription != ""){
		output = output + firstDescription + " " + "Lakh";
		if(remainingDescription != ""){
			output = output + " " + remainingDescription;
		}
	}else{
		if(remainingDescription != ""){
			output = remainingDescription;
		}
	}

	return output;
}

//7 digits (ten lakh)
function translate_10_Lakh(s){
	if(s == "0000000"){
		return "";
	}
	var firstDigit = s.substring(0,2);
	var remainingDigits = s.substring(2,7);
	var firstDescription = translate_Tens(firstDigit);
	var remainingDescription = translate_10_Thousands(remainingDigits);
	var output = "";
	if(firstDescription != ""){
		output = output + firstDescription + " " + "Lakh";
		if(remainingDescription != ""){
			output = output + " " + remainingDescription;
		}
	}else{
		if(remainingDescription != ""){
			output = remainingDescription;
		}
	}
	return output; 	
}

//8 digits (crore)
function translate_Crore(s){
	if(s == "00000000"){
		return "";
	}
	var firstDigit = s.substring(0,1);
	var remainingDigits = s.substring(1,8);
	var firstDescription = translate_Ones(firstDigit);
	var remainingDescription = translate_10_Lakh(remainingDigits);
	var output = "";
	if(firstDescription != ""){
		output = output + firstDescription + " " + "Crore";
		if(remainingDescription != ""){
			output = output + " " + remainingDescription;
		}
	}else{
		if(remainingDescription != ""){
			output = remainingDescription;
		}
	}

	return output;	
}

//9 digits (ten crore)
function translate_10_Crore(s){
	if(s == "000000000"){
		return "";
	}
	var firstDigit = s.substring(0,2);
	var remainingDigits = s.substring(2,9);
	var firstDescription = translate_Tens(firstDigit);
	var remainingDescription = translate_10_Lakh(remainingDigits);
	var output = "";
	if(firstDescription != ""){
		output = output + firstDescription + " " + "Crore";
		if(remainingDescription != ""){
			output = output + " " + remainingDescription;
		}
	}else{
		if(remainingDescription != ""){
			output = remainingDescription;
		}
	}
	return output;	
}