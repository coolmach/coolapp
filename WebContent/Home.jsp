<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
	body{margin:0px;padding:0px;}

	* {
	  -webkit-border-radius: 0 !important;
		 -moz-border-radius: 0 !important;
			  border-radius: 0 !important;
	}

	#mainHeading{
		font-family:'Open Sans Condensed', 'Arial Narrow', Arial, sans-serif;
		color: #999999;
		font-size: 46px;
		line-height: 1.1em;
		margin: 0 0 50px 0;
		padding: 0;
		position: relative;
	}

	#subHeading{
		font-family:'Open Sans Condensed', 'Arial Narrow', Arial, sans-serif;
		color: #aaaaaa;
		font-size: 35px;
		line-height: 1.1em;
		margin: 0 0 50px 0;
		padding: 0;
		position: relative;
	}

	.smallIcon img{width:15px;height:15px;}
	.smallIcon{font-size:12px;margin-right:5px;}
	.smallIcon{
		display: block;
		height: 14px;
		float: left;
		font: normal 10px 'Oswald',Arial,sans-serif;
		text-transform: uppercase;
		color: #BBBBBB;
		text-decoration: none;
		margin-right: 12px;
		padding: 0 0 0 17px;
	}

		#headerRow{background-color:#FFFFFF;}
		#headerRow img{padding-left:24px;}
	#messageRow{padding-top:25px;width:96.5%;}

	#searchBoxRow{padding-top:5px; height:12%;padding-bottom:48px;margin-left:1%;}
		#searchBox{height:45px; border:1px solid #0099CC; padding-left:15px;font-size:18px; width:315px;} 
		
		#searchBox:focus{
		  box-shadow: 0 0 5px rgba(81, 203, 238, 1);
		  border: 1px solid rgba(81, 203, 238, 1);
		}	
		
	#iconsRow{padding-left:1%;margin-left:2.2%;width:88%;border-top:1px solid #CCCCCC;padding-bottom:15px;overflow:hidden; padding-top:15px;}

	#tilesStrip{margin-top:15px; border-top:1px solid rgb(238,226,176); padding:25px;}
		.tile{padding:10px;}
		.tile_image{max-width:64px; max-height:64px;width:64px;height:64px;background-size:64px 64px;}
		.tile_caption{text-align:center;width:95px;color:#777776;text-transform:uppercase;padding-top:10px;font-size:12px;font-family:'Arial';}
		.tile a{text-decoration:none;}

		.mainButton{width:150px; height:40px; background-color:#0099CC; color:#FFFFFF;border:0px solid;font-size:16px;}
		.searchPosts{border:1px solid #0099CC;height:30px;width:240px;}
		
	#image1_black{background-image:url("./images/common/icons/home_1.png");position:relative;}
	#image2_black{background-image:url("./images/common/icons/car_2.png");}
	#image3_black{background-image:url("./images/common/icons/tv_3.png");}
	#image4_black{background-image:url("./images/common/icons/mobile_4.png");}
	#image5_black{background-image:url("./images/common/icons/computer_5.png");}
	#image6_black{background-image:url("./images/common/icons/sofa_1.png");}

	#image1_color{background-image:url("./images/common/icons/home_g.png");position:relative;}
	#image2_color{background-image:url("./images/common/icons/car_g.png");}
	#image3_color{background-image:url("./images/common/icons/tv_g.png");}
	#image4_color{background-image:url("./images/common/icons/mobile_g.png");}
	#image5_color{background-image:url("./images/common/icons/computer_g.png");}
	#image6_color{background-image:url("./images/common/icons/sofa_g.png");}

	
	
	#postAdCategoriesList li{height:30px; color:#FF6666; padding:5px; list-style-type:none;font-size:15px;}
	
	#contentRow{max-height:20%; overflow:hidden; margin-top:-8px;}
	
</style>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" />
<script src="js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#searchBox").focus();
		$( "#tile1" ).hover(function() {
			$("#image1_black").hide();
			$("#image1_color").show();
			$("#tile_caption1").css("color", "#0099cc");
		},function() {
			$("#image1_black").show();
			$("#image1_color").hide();
			$("#tile_caption1").css("color", "#777776");
		});
		$( "#tile2" ).hover(function() {
			$("#image2_black").hide();
			$("#image2_color").show();
			$("#tile_caption2").css("color", "#0099cc");
		},function() {
			$("#image2_black").show();
			$("#image2_color").hide();
			$("#tile_caption2").css("color", "#777776");
		});
		$( "#tile3" ).hover(function() {
			$("#image3_black").hide();
			$("#image3_color").show();
			$("#tile_caption3").css("color", "#0099cc");
		},function() {
			$("#image3_black").show();
			$("#image3_color").hide();
			$("#tile_caption3").css("color", "#777776");
		});
		$( "#tile4" ).hover(function() {
			$("#image4_black").hide();
			$("#image4_color").show();
			$("#tile_caption4").css("color", "#0099cc");
		},function() {
			$("#image4_black").show();
			$("#image4_color").hide();
			$("#tile_caption4").css("color", "#777776");
		});
		$( "#tile5" ).hover(function() {
			$("#image5_black").hide();
			$("#image5_color").show();
			$("#tile_caption5").css("color", "#0099cc");
		},function() {
			$("#image5_black").show();
			$("#image5_color").hide();
			$("#tile_caption5").css("color", "#777776");
		});
		$( "#tile6" ).hover(function() {
			$("#image6_black").hide();
			$("#image6_color").show();
			$("#tile_caption6").css("color", "#0099cc");
		},function() {
			$("#image6_black").show();
			$("#image6_color").hide();
			$("#tile_caption6").css("color", "#777776");
		});
		
		$("#postAdBtn").mouseenter(function(){
			$("#postAdCategories").show();
		});
		$("#postAdBtn").mouseleave(function(){
			if( $("#postAdCategories").is(":visible") ){
				$("#postAdCategories").hide();
			}
		});
		$("#postAdCategories").mouseenter(function(){
			$("#postAdCategories").show();
		});
		$("#postAdCategories").mouseleave(function(){
			$("#postAdCategories").hide();
		});
	});
	
</script>
<body>
<div id="contentRow">
	<div class="header_responseMessage">
		<s:property value="responseMsg" />
	</div>
	<div id="messageRow" class="row" style="margin-top:20px;">
		<div class="col-sm-9">
			<div id="mainHeading" class="col-sm-12">
				An <span style="color:#222;">Exclusive</span> Buy Sell Portal For <span style="color:#222;">Professionals</span>!
			</div>
			<div id="subHeading" class="col-sm-12">
				"Say No To Brokers, Yes To Fellow IT Community"
			</div>
		</div>
		<div class="col-sm-3" style="padding-left:40px;">
			<div id="postAdBtn"><button class="mainButton">Post Free Ad</button></div>
			<div id="postAdCategories" style="display:none; position:absolute; padding-top:5px;">
				<s:url action="post_RealEstate" var="url_REAL_POST" escapeAmp="false"></s:url>
				<s:url action="post_Automobile" var="url_AUTO_POST" escapeAmp="false"></s:url>
				<s:url action="post_Computers" var="url_COMP_POST" escapeAmp="false"></s:url>
				<s:url action="post_Electronics" var="url_ELEC_POST" escapeAmp="false"></s:url>
				<s:url action="post_Mobiles" var="url_MOBILE_POST" escapeAmp="false"></s:url>
				<s:url action="post_Furniture" var="url_FURNITURE_POST" escapeAmp="false"></s:url>			
				<ul id="postAdCategoriesList" style="margin-left:0px;">
				    <li><span style="margin-right:10px;"><img src="./images/common/icons/home_1.png" width="16" height="16"></span><a href='<s:property value="#url_REAL_POST"/>'>Real Estate</a></li>
				    <li><span style="margin-right:10px;"><img src="./images/common/icons/car_2.png" width="16" height="16"></span><a href='<s:property value="#url_AUTO_POST"/>'>Automobiles</a></li>
				    <li><span style="margin-right:10px;"><img src="./images/common/icons/computer_5.png" width="16" height="16"></span><a href='<s:property value="#url_COMP_POST"/>'>Computers</a></li>
				    <li><span style="margin-right:10px;"><img src="./images/common/icons/tv_3.png" width="16" height="16"></span><a href='<s:property value="#url_ELEC_POST"/>'>Home Appliances</a></li>
				    <li><span style="margin-right:10px;"><img src="./images/common/icons/mobile_4.png" width="16" height="16"></span><a href='<s:property value="#url_MOBILE_POST"/>'>Mobiles</a></li>
				    <li><span style="margin-right:10px;"><img src="./images/common/icons/sofa_1.png" width="16" height="16"></span><a href='<s:property value="#url_FURNITURE_POST"/>'>Furniture</a></li>
				</ul>
			</div>
		</div>		
	</div>
	<div id="searchBoxRow" class="row">
		<div id="searchBoxArea" style="margin-left:0px;">
			<input id="searchBox" type="text" class="" placeholder="Search For Items" style="margin-left:20px;width:500px;">
		</div>
	</div>
	<div id="iconsRow">
		<s:url action="realestate" var="url_REAL" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">1</s:param></s:url>
		<s:url action="automobile" var="url_AUTO" escapeAmp="false"><s:param name="category">AUTO</s:param><s:param name="subCategory">1</s:param></s:url>
		<s:url action="computers" var="url_COMP" escapeAmp="false"><s:param name="category">COMP</s:param><s:param name="subCategory">1</s:param></s:url>
		<s:url action="electronics" var="url_ELEC" escapeAmp="false"><s:param name="category">ELEC</s:param><s:param name="subCategory">0</s:param></s:url>
		<s:url action="mobiles" var="url_MOBILE" escapeAmp="false"><s:param name="category">MOBILE</s:param><s:param name="subCategory">1</s:param></s:url>
		<s:url action="furniture" var="url_FURN" escapeAmp="false"><s:param name="category">FURN</s:param><s:param name="subCategory">1</s:param></s:url>	
		<div class="col-sm-2 tile" id="tile1">
			<a href="<s:property value="url_REAL" />">
			<div class="tile_image" id="image1_black"></div>
			<div class="tile_image" id="image1_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption1">Real Estate</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile2">
			<a href="<s:property value="url_AUTO" />">
			<div class="tile_image" id="image2_black"></div>
			<div class="tile_image" id="image2_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption2">Automobiles</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile3">
			<a href="<s:property value="url_ELEC" />">
			<div class="tile_image" id="image3_black"></div>
			<div class="tile_image" id="image3_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption3">Home Appliances</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile4">
			<a href="<s:property value="url_MOBILE" />">
			<div class="tile_image" id="image4_black"></div>
			<div class="tile_image" id="image4_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption4">Mobiles</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile5">
			<a href="<s:property value="url_COMP" />">
			<div class="tile_image" id="image5_black"></div>
			<div class="tile_image" id="image5_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption5">Computers</div>
			</a>
		</div>
		<div class="col-sm-2 tile" id="tile6">
			<a href="<s:property value="url_FURNITURE" />">
			<div class="tile_image" id="image6_black"></div>
			<div class="tile_image" id="image6_color" style="display:none"></div>
			<div class="tile_caption" id="tile_caption6">Furniture</div>
			</a>
		</div>
	</div>
</div>
</body>
