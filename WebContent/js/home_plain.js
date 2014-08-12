
	var tips = [
		"\"Say No To Brokers, Yes To Fellow IT Community!\"",
		"\"Genuine Buyers And Sellers!\"",
		"\"Font Size Font Family Font Color\""
	];

	// get a random index, get the value from array and
	// change the div content
	var counter = 0;
	setInterval(function() {
		//var i = Math.round((Math.random()) * tips.length);
		//if (i == tips.length) --i;
		counter++;
		if(counter > 2){
			counter = 0;
		}
		
		$("#subHeading").animate({opacity:0},function(){
			$(this).text(tips[counter]).animate({opacity:1});  
		});	
		
		//$("#subHeading").fadeOut("slow");
		//$("#subHeading").html(tips[i]);
		//$("#subHeading").fadeIn("slow");
		
	}, 5 * 500);

	$(document).ready(function(){
		
		$("#searchBox").focus();
	
		$( "#tile1" ).hover(function() {
			$("#image1_black").hide();
			$("#image1_color").show();
			$("#tile_caption1").css("color", "#0099cc");
		//	$("#tile1").css("background-color", "rgb(250,250,250)");
		},function() {
			$("#image1_black").show();
			$("#image1_color").hide();
			$("#tile_caption1").css("color", "#777776");
			//$("#tile1").css("background-color", "#FFFFFF");
		});
		$( "#tile2" ).hover(function() {
			$("#image2_black").hide();
			$("#image2_color").show();
			$("#tile_caption2").css("color", "#0099cc");
		//	$("#tile2").css("background-color", "rgb(250,250,250)");
		},function() {
			$("#image2_black").show();
			$("#image2_color").hide();
			$("#tile_caption2").css("color", "#777776");
			//$("#tile2").css("background-color", "#FFFFFF");
		});
		$( "#tile3" ).hover(function() {
			$("#image3_black").hide();
			$("#image3_color").show();
			$("#tile_caption3").css("color", "#0099cc");
			//$("#tile3").css("background-color", "rgb(250,250,250)");
		},function() {
			$("#image3_black").show();
			$("#image3_color").hide();
			$("#tile_caption3").css("color", "#777776");
			//$("#tile3").css("background-color", "#FFFFFF");
		});
		$( "#tile4" ).hover(function() {
			$("#image4_black").hide();
			$("#image4_color").show();
			$("#tile_caption4").css("color", "#0099cc");
			//$("#tile4").css("background-color", "rgb(250,250,250)");
		},function() {
			$("#image4_black").show();
			$("#image4_color").hide();
			$("#tile_caption4").css("color", "#777776");
			//$("#tile4").css("background-color", "#FFFFFF");
		});
		$( "#tile5" ).hover(function() {
			$("#image5_black").hide();
			$("#image5_color").show();
			$("#tile_caption5").css("color", "#0099cc");
			//$("#tile5").css("background-color", "rgb(250,250,250)");
		},function() {
			$("#image5_black").show();
			$("#image5_color").hide();
			$("#tile_caption5").css("color", "#777776");
			//$("#tile5").css("background-color", "#FFFFFF");
		});
		$( "#tile6" ).hover(function() {
			$("#image6_black").hide();
			$("#image6_color").show();
			$("#tile_caption6").css("color", "#0099cc");
			//$("#tile6").css("background-color", "rgb(250,250,250)");
		},function() {
			$("#image6_black").show();
			$("#image6_color").hide();
			$("#tile_caption6").css("color", "#777776");
			//$("#tile6").css("background-color", "#FFFFFF");
		});
	});
	