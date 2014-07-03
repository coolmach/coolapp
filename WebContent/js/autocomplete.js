	$("#userEnteredLocationStr").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "http://localhost:8080/Virat/getLocation?",
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
		},
		minLength: 2
	});