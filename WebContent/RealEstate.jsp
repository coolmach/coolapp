<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="js/jquery.min.js"></script> 
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/home.css" type="text/css">
<link rel="stylesheet" href="css/Cbuddy.css" type="text/css">
<script type="text/javascript" src="js/Cbuddy.js"></script> 
<div class="col-md-12">
	<form class="form-inline" role="form">
		<div class="form-group pull-left" id="subCategory-main">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Apartment/House For Rent</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
				    <li><span class="content">Apartment/House For Rent</span></li>
					<li><span class="content">Apartment/House For Sale</span></li>
					<li><span class="content">Plot For Sale</span></li>
					<li><span class="content">PG Accommodation</span></li>
					<li><span class="content">Roommate Required</span></li>

				</ul>
			</div>
		</div>
		<div class="form-group pull-left" id="loc-main">
			<div id="location" class="inputstyle pointer form-control">
				<span class="content">Location</span> <span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_loc" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><span class="content">BTM</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">HSR</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">Bellanduru</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span> </li>
					<li><span class="content">Marathalli</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span> </li>
				</ul>
			</div>
		</div>
		<div class="form-group pull-left" id="area-main">
			<div id="area" class="inputstyle pointer form-control">
				Area <span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_area" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li> <span class="content"><1000 sq.ft</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">1000-1200 sq.ft</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li> <span class="content">>1200 sq.ft</span> <span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
				</ul>
			</div>
		</div>
		<div class="form-group pull-left" id="bhk-main">
			<div id="bhk" class="inputstyle pointer form-control">
				BHK <span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_bhk" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><span class="content">1 BHK</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">2 BHK</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">3 BHK</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">Others</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
				</ul>
			</div>
		</div>
		<div class="form-group pull-left" id="rent-main">
			<div id="rent" class="inputstyle pointer form-control">
				Rent <span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_rent" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><span class="content"><10,000</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">10,000-14,000</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">14,000-18,000</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">>18,000</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
				</ul>
			</div>
		</div>
		<div class="form-group pull-left" id="dir-main">
			<div id="direction" class="inputstyle pointer form-control">
				Direction <span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_dir" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><span class="content">East</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">West</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">North</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">South</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
				</ul>
			</div>

		</div>
		<div class="form-group pull-left" id="pref-main">
			<div id="preference" class="inputstyle pointer form-control">
				Preference <span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_pref" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><span class="content">Bachelors</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">Family</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
				</ul>
			</div>
		</div>
		<div class="form-group pull-left" id="park-main">
			<div id="park" class="inputstyle pointer form-control">
				Car Parking <span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			<div id="subCategory_hidden_park" class="subCategory_hidden_bck"
				style="display: none;">
				<ul class="list-unstyled">
					<li><span class="content">Yes</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
					<li><span class="content">No</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-feedback"></span></li>
				</ul>
			</div>

		</div>



	</form>

</div>