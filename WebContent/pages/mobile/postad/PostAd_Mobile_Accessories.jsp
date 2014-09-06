<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>
<div class=" header_2">
	<div class=""></div>
</div>
<div class="col-md-8" id="my">
	<s:form cssClass="form-horizontal post" action="mobile_postAd" enctype="multipart/form-data">
		<input type="hidden" name="category" value="MOBILE"/>
		<input type="hidden" name="subCategory" value="1"/>
		<div class="col-md-12 post_title">
			<div style="float:left;">
				Mobile for Sale
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg"/></span>
		</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="title" class="col-sm-4 control-label">Title<span class="mandatory">*</span></label>
				<div class="col-sm-8">
					<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="Samsung Accessories available for sale" required>
				</div>
			</div>
			
			<%@include file="/locationStrip.jsp" %>
					
			<div class="form-group">
				<label for="brand" class="col-sm-4 control-label">Brand <span class="mandatory">*</span></label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="brand" id="brand">
						<option value="NOK">Nokia</option>
						<option value="SON">Sony</option>
						<option value="SAM">Samsung</option>
						<option value="APP">Apple</option>
						<option value="OTH">Others</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">Model<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" maxlength="30" class="form-control" name="modelSearchStr" id="modelSearchStr" value="N700" required>
					<input type="hidden" name="model" id="model">
					<input type="hidden" name="selectedModelStr" id="selectedModelStr">
				</div>
			</div>			
			<div class="form-group">
				<label for="year" class="col-sm-4 control-label">Year of purchase<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="4" class="form-control" name="year" id="year" value="2007" required>
				</div>
			</div>
			<div class="form-group">
				<label for="color" class="col-sm-4 control-label">Color<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="16" class="form-control" name="color" id="color" value="Black" required>
				</div>
			</div>			
			<div class="form-group">
				<label for="price" class="col-sm-4 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="6" class="form-control" name="price" id="price" value="30000" required>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-4 control-label">Other Specifications</label>
				<div class="col-sm-8">
					<textarea class="form-control" maxlength="256" rows="3" name="Description" id="Description" placeholder="Please enter other specifications of your laptop"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="submit" class="btn btn-primary pull-right" onClick="history.go(-1);">Back</button>
				</div>
				<div class="col-sm-offset-0 col-sm-3">
					<button type="submit" class="btn btn-primary pull-right">Post Ad</button>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="fileinput fileinput-new" data-provides="fileinput">
			  <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
			  <div>
			    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
			    <input type="file" name="upload" id="upload"></span>
			    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
			  </div>
			</div>
			<div class="form-group">
				<div class="col-sm-8">
					<label for="" class="col-sm-6 control-label" style="text-align:left;">Contact Details<span class="mandatory">*</span></label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" placeholder="Contact Person Name" value="MGR" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="11" name="ContactNo" placeholder="Contact Number" value="77777766666" required>
				</div>
			</div>
		</div>
	</s:form>

</div>
<div class="col-md-5"></div>


<script>
$("#modelSearchStr").autocomplete({
	source: function(request, response) {
		$.ajax({
			url:ctxPath + "/autoSuggestMobile",
			type: "POST",
			dataType: "json",
			data: {brand:$("#brand").val()},
			success: function(data) {
				response( $.map(data, function(item) {
					return {
						value: item.model,
						label: item.modelName
					};
				}));
			},
			error: function (error) {
				alert('error: ' + error.responseText);
			}
		});
	},
	select:function(event, ui){
		alert("Mother");
		event.preventDefault();
		$("#model").val(ui.item.value);
		$("#modelSearchStr").val(ui.item.label);
		$("#selectedModelStr").val(ui.item.label);
	},
	minLength: 2
});
</script>

