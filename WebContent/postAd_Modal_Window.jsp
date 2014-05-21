<%@ taglib prefix="s" uri="/struts-tags"%>
	<div id='content'>
		<div id='basic-modal' class="mygrid_post">
			<input type='button' name='basic' value='Post Advertisement' class='basic'/>
		</div>	
		<!-- modal content -->
		<div id="basic-modal-content">
			<h3>Post Category</h3>
			<form class="form-horizontal post" id="loginForm" action="postad">
				<div class="form-group-modal">
					<s:select class="form-control" id="cat"
						headerKey="-1" headerValue="Select Category" onChange="getSubCategory()"
						list="#{'REAL':'Real Estate', 'AUTO':'Cars/Bikes', 'LAP':'Laptops', 'ELEC':'Electronics', 'HOUSE':'Household Items', 'BOOK':'Books/DVDs'}" 
						name="cat" 
						value="2" />
				</div>
				<div class="form-group-modal">
					<s:select class="form-control" id="scat"
						headerKey="-1" headerValue="Select Subcategory"
						list="#{'REAL':'Real Estate', 'AUTO':'Cars/Bikes', 'LAP':'Laptops', 'ELEC':'Electronics', 'HOUSE':'Household Items', 'BOOK':'Books/DVDs'}" 
						name="scat" 
						value="2" />				</div>
				<div class="col-sm-offset-2 col-sm-10 modalFormBtn">
					<s:submit cssClass="btn btn-primary pull-right" value="Continue"/>
				</div>
			</form>			
		</div>
	</div>	