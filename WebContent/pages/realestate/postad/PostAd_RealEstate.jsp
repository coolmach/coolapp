<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">
	<div class=""></div>
</div>
<script>
	function displayPostAdSection(){
		var selectedOption = $("#propertyType").val();
		$("#subCategory").val(selectedOption);
		var returnedData = '';
		$.ajax({
			url: "Virat" + "/getDetailsSection?",
			//url:$('#contextPath').text() + "getLocation",
			type: "POST",
			data: {subCategory:$("#propertyType").val()},
			success: function(data) {
				returnedData = data;
				if(returnedData.indexOf("Password") >= 0){
					window.location.assign("http://www.w3schools.com")
				}
				$("#postContent").html(data);
			},
			error: function (error) {
				alert('error: ' + error.responseText);
			}
		});

	}
</script>

<span class="error" style="margin-left:15%;margin-top:1%;"><s:fielderror fieldName="errorMsg"/></span>

<s:form cssClass="form-horizontal post" action="real_estate_postAd.action" enctype="multipart/form-data">
<div class="row col-md-10" id="my">
	<input type="hidden" name="category" value="REAL"/>
	<div class="col-md-8">
		<div class="form-group">
			<label for="title" class="col-sm-5 control-label">Title<span class="mandatory">*</span></label>
			<div class="col-sm-7">
				<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="<s:property value='title'/>" required>
			</div>
		</div>
		<%@include file="/locationStrip.jsp" %>
		<div class="form-group">
			<label class="col-sm-5 control-label">Property Type</label>
			<div class="col-sm-7" style="padding-top:6px;">
				<s:select class="dropDown" style="height:30px;width:190px;" id="propertyType" name="propertyType" theme="simple" onChange="displayPostAdSection()"
						headerKey="-1" headerValue="Select"
						list="#{'2':'Apartment For Rent', '3':'Independent House For Rent', '6':'Roommate Required', '1':'Apartment For Sale', '4':'Independent House For Sale', '5':'PG Accommodation'}"
						value="propertyType" />
			</div>
		</div>
		<div id="postContent">
			<s:if test="#action.postDetails.subCategory == 1">
				<%@ include file="PostAd_RealEstate_Apartment_For_Sale.jsp" %>
			</s:if>
			<s:elseif test="#action.postDetails.subCategory == 2">
				<%@ include file="PostAd_RealEstate_Apartment_For_Rent.jsp" %>
			</s:elseif>
			<s:elseif test="#action.postDetails.subCategory == 3">
				<%@ include file="PostAd_RealEstate_Ind_House_For_Sale.jsp" %>
			</s:elseif>
			<s:elseif test="#action.postDetails.subCategory == 4">
				<%@ include file="PostAd_RealEstate_Ind_House_For_Rent.jsp" %>
			</s:elseif>
			<s:elseif test="#action.postDetails.subCategory == 5">
				<%@ include file="PostAd_RealEstate_PG_Accommodation.jsp" %>
			</s:elseif>
			<s:elseif test="#action.postDetails.subCategory == 6">
				<%@ include file="PostAd_RealEstate_Land_For_Sale.jsp" %>
			</s:elseif>
			<s:elseif test="#action.postDetails.subCategory == 7">
				<%@ include file="PostAd_RealEstate_Roommate_Required.jsp" %>
			</s:elseif>
		</div>
	</div>
	<div class="col-md-4">
		<div class="fileinput fileinput-new" data-provides="fileinput">
			<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 162px; height: 120px;"></div>
			<div>
				<span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
				<input type="file" name="upload" id="upload"></span>
				<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
		  	</div>
		</div>	
	</div>
</div>
</s:form>
 
<div class="col-md-5"></div>
