<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	jQuery(function($) {
		// Load dialog on page load
		//$('#basic-modal-content').modal();

		// Load dialog on click
		$('#basic-modal .basic').click(function(e) {
			$('#basic-modal-content').modal();
			return false;
		});
	});
</script>
<script>
	function login() {
		$("#loginForm").submit(
				function f(data) {
					var postData = $(this).serializeArray();
					var formURL = $(this).attr("action");
					$.ajax({
						url : formURL,
						type : "POST",
						data : postData,
						success : function(data, textStatus, jqXHR) {
							var modalDiv = document
									.getElementById("basic-modal-content");
							modalDiv.innerHTML = data;
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert(errorThrown);
						}
					});
					data.preventDefault(); //STOP default action
				});
		$("#loginForm").submit();
	}
</script>

<script>
	function getSubCategory() {
		var category = $("#category").val();
		$("#subCategory").html("");
		if (category == "REAL") {
			var numbers = [ 1, 2, 3, 4, 5, 6, 7];
			var values = [ '1', '2', '3', '4' ,'5', '6', '7'];
			var options = [ 'Apartment for Sale', 'Apartment for Rent',
					'Individual House for Sale', 'Individual House for Rent', 'PG Accommodation', 'Land For Sale', 'Roommate Required'];
		} else if (category == "AUTO") {
			var numbers = [ 1, 2, 3 ];
			var values = [ 'CAR', 'BIKE', 'CYCLE' ];
			var options = [ 'Cars', 'Bikes', 'Cycles' ];
		} else if (category == "LAP") {
			var numbers = [ 1, 2 ];
			var values = [ 'LAPTOP', 'DESKTOP', 'ACC', 'OTH' ];
			var options = [ 'Laptops', 'Desktops', 'Accessories', 'Others' ];
		} else if (category == "ELEC") {
			var numbers = [ 1, 2, 3 ];
			var values = [ 'TV', 'DVD', 'MUSIC', 'OTH' ];
			var options = [ 'TVs', 'Music Players', 'Others' ];
		}
		var index = 0;
		$.each(numbers, function(val, text) {
			$('#subCategory').append(
					$('<option class="optionListItem"></option>').val(values[index]).html(options[index]));
			index = index + 1;
		});
	}
</script>

<script>
	$('#modalLoginBtn').click(function() {
		login();
		return false;
	});
</script>
<div class="header_2"></div>
<div class="header_responseMessage"><s:property value="responseMsg"/></div>
<div class="col-md-6 pull-left" style="margin-top:5%;">
	<div class="col-md-3">
		<img id="guy-img" src="images/Guy.png">
	</div>
	<div class="col-md-9">
		<div class="col-md-12 cbuddy_intro">
			<div style="font-family:Tw Cen MT Condensed;font-size:30px;float:left;">An exclusive Classifieds portal for Techies</div>
		</div>
		<div class="col-md-12 cbuddy_intro">
			<h5 style="margin: 10px; color:#808080;font-family:Tw Cen MT Condensed;font-size:26px;">"Say no to brokers, yes to fellow IT Community"</h5>
		</div>
		<div class="col-md-12 cbuddy_intro">
			<div style="margin: 15px;">
				<img class="star-img" src="images/star.png"><b>Verified Posts</b>
			</div>
			<div style="margin: 15px;">
				<img class="star-img" src="images/star.png"><b>Authenticated Users</b>
			</div>
		</div>
		
	</div>
	<!-- <div class="col-md-2">
	</div> -->
	<div class="col-md-10" style="float:right;">
			<img src="images/arrow.png" id="arr_img"> <input
				type="text" class="form-control" id="category_search" name="category" 
				placeholder="I am looking for...">
		</div>
</div>
<div class="col-md-4" style="margin-top:5%;">
	<table class="table mygrid">
		<tr>
			<td>
				<s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">REAL</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> 
				<a href="<s:property value="#urlTag" />"><img class="images_ad" src="images/real_estate.png"> </a>
			</td>
			<td><s:url action="cars" var="urlTag1">
					<s:param name="category">CARS</s:param>
				</s:url> <a href="<s:property value="#urlTag1" />"><img
					class="images_ad" src="images/cars.png"> </a>
			</td>
			<td><s:url action="household" var="urlTag2">
					<s:param name="category">HOUSEHOLD</s:param>
				</s:url> <a href="<s:property value="#urlTag2" />"><img
					class="images_ad" src="images/household.png"> </a>
			</td>
		</tr>
		<tr>
			<td><s:url action="laptops" var="urlTag3">
					<s:param name="category">LAPTOPS</s:param>
				</s:url> <a href="<s:property value="#urlTag3" />"><img
					class="images_ad" src="images/laptops.png"> </a>
		    </td>
			<td><s:url action="mobiles" var="urlTag4">
					<s:param name="category">MOBILES</s:param>
				</s:url> <a href="<s:property value="#urlTag4" />"><img
					class="images_ad" src="images/mobiles.png"> </a>
			</td>
			<td><s:url action="books" var="urlTag5">
					<s:param name="category">DVD</s:param>
				</s:url> <a href="<s:property value="#urlTag5" />"><img
					class="images_ad" src="images/dvd.png"> </a>
			</td>
		</tr>

	</table>

	<s:if test="%{#session.userLoggedIn} != null">
		<%@include file="./postAd_Modal_Window.jsp"%>
	</s:if>
	<s:else>
		<%@include file="./login_Modal_Window.jsp"%>
	</s:else>
</div>
