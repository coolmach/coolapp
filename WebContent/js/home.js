$(document).ready(function() {
	$("#cat").click(function(){
		alert("---");
		$.ajax({
			type: 'GET',
			url: "/cbuddy/ad", 
			success: function(data, status) {
				
			alert(data);
			}
		});
	});
	
	/*$("#login").validate({
		rules: {
		userName: {
		required: true,
		password: {
		required: true
		}
		}
		},
		messages:{
			userName: "Email Id is required",
			password: "Password is required"
		}
		});*/
	
     if($('#validate').val()=="false"){
    	 $("#myuser").hide();
    	 $("#nav_user").hide();
		$('#loginModal').modal('show');
	}else if($('#validate').val()=="true"){
		$('#myuser').html($('#user').val());
	}else{
		$("#nav_user").hide();
		$("#myuser").hide();
	}
     
     $("#myuser").hover(function(){

 	});
     
     
     $("#nav_user").click(function(){
    	  
         $("#nav_user").hide();
         $("#myuser").hide();
 	});
     
     
	});
	
	

	/*jQuery(function($) {
		$('form').live('submit', function(event) {
		var $form = $(this);
		var $target = $($form.attr('data-target'));
		 
		$.ajax({
		type: $form.attr('method'),
		url: $form.attr('action'),
		data: $form.serialize(),
		 
		success: function(data, status) {
			
		//$target.html(data);
			 $('#loginModal').modal('show');
		}
		});
		 
		event.preventDefault();
		});
		});*/
    
				