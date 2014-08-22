
	$("#userEnteredLocationStr").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "Virat" + "/getLocation?",
				//url:$('#contextPath').text() + "getLocation",
				type: "POST",
				dataType: "json",
				data: {city:$('input[name=city]:checked').val(),location:$("#userEnteredLocationStr").val()},
				success: function(data) {
					response( $.map(data, function(item) {
						return {
							label: item.value,
							value: item.id
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
			$("#selectedCityCode").val($("input[name=city]:checked").val());
		},
		minLength: 1
	});
	
	$("#userEnteredModelStr").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "Virat" + "/autoSuggestMobile?",
				//url:$('#contextPath').text() + "getLocation",
				type: "POST",
				dataType: "json",
				data: {brandNew:$("#brand :selected").text(),modelSearchStr:$("#userEnteredModelStr").val()},
				success: function(data) {
					response( $.map(data, function(item) {
						return {
							label: item.modelName,
							value: item.model
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
			$("#userEnteredModelStr").val(ui.item.label);
			$("#model").val(ui.item.value);
			$("#selectedModelStr").val(ui.item.label);
			$("#selectedBrand").val($("#brand").val());
		},
		minLength: 1
	});