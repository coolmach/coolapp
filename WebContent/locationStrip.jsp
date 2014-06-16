

	<div class="form-group">
		<label for="location" class="col-sm-4 control-label">City</label>
		<div class="col-sm-6">
			<input type="radio" class="radioButton" name="city" id="city" value="BLR" checked><span class="radioCaption">Bangalore</span>
			<input type="radio" class="radioButton" name="city" id="city" value="CHE"><span class="radioCaption_RightAlign">Chennai</span>
		</div>
	</div>			
	<div class="form-group">
		<label for="location" class="col-sm-4 control-label">Location</label>
		<div class="col-sm-6">
			<input type="text" class="locationTextBox" placeholder="Enter Area (e.g. JP Nagar)" name="userEnteredLocationStr" id="userEnteredLocationStr">
		</div>
	</div>
	
	<input type="hidden" name="selectedLocationCode" id="selectedLocationCode">
	<input type="hidden" name="selectedLocationStr" id="selectedLocationStr">
	<input type="hidden" id="contextPath" value='<%=request.getContextPath()%>' />

<link rel="stylesheet" type="text/css" href="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.css"/>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="thirdparty/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>	
<script>
	$(document).ready(function(){
		$("#userEnteredLocationStr").autocomplete({
		    source: function(request, response) {
			    $.ajax({
				    //url: "http://localhost:8080/Virat/getLocation?",
				    url:$('#contextPath').text() + "getLocation",
				    type: "POST",
				    dataType: "json",
				    data: {city:$('input[name=city]:checked').val(),location:$("#userEnteredLocationStr").val()},
				    success: function(data) {
				        response( $.map(data, function(item) {
					        return {
					            label: item.value,
					            value: item.id,
					        };
				        }));
				    },
				    error: function (error) {
				       alert('error: ' + error.responseText);
				    }
			    });
			},
			select:function(event, ui){
				event.preventDefault();
				$("#userEnteredLocationStr").val(ui.item.label);
				$("#selectedLocationCode").val(ui.item.value);
				$("#selectedLocationStr").val(ui.item.label);
			},
		    minLength: 2
		 });
	});
</script>