<div id="right_LocationFilterSection" class="col-md-3">
	<%@include file="/location_And_Corporate_Strip.jsp"%>
	<div style="margin-top:5px;">&nbsp;</div>
	<div class="form-group" id="subCategory-right">
		<div id="" class="" style="position: relative;">
		<div class="heading" style="padding-top:10px;">
			<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_ul">
          			Categories
                 <span class="glyphicon glyphicon-chevron-down"></span>
            </a>
        </div>
		<ul class="list-unstyled collapse in" id="collapse_ul" style="padding:10px;">
		    <li value="Almirah"><span class="content">Almirah</span></li>
			<li value="Bero"><span class="content">Bero</span></li>
			<li value="Chair"><span class="content">Chair</span></li>
			<li value="Cot"><span class="content">Cot</span></li>
			<li value="Dining Table"><span class="content">Dining Table</span></li>
			<li value="Mattress"><span class="content">Mattress</span></li>
			<li value="Shoe Rack"><span class="content">Shoe Rack</span></li>
			<li value="Sofa"><span class="content">Sofa</span></li>
			<li value="TV Stand"><span class="content">TV Stand</span></li>
			<li value="Others"><span class="content">Others</span></li>
		</ul>
		</div>
	</div>
</div>

<script>
function getFurnitureList( furnitureType){
	
	//Fetch Models if only one Make is selected
	if(noOfBrandsSelected == 1 && selectedBrand != ""){
		$("#data").html("");
		$.ajax({
			url:"furniture",
			data:{type:furnitureType},
			dataType:'json',
			type:'POST',
			success:function(res){
				for(var i=0; i<res.mobileModels.length; i++){
					mobileModelFromServer = res.mobileModels[i];
					//Format: <li><input type="checkbox" class="check_year" name="yearStr" value="2005" /><span class="content">2005</span></li>
					optionStr = "<li><input type='checkbox' class='check_model' name='model' value='" + mobileModelFromServer + "' /><span class='content'>" + mobileModelFromServer + "</span></li>";
					$("#model_List_In_Filter_Screen").append(optionStr);		
				}
			}
		});
	}else{
		//If more than one Make is selected then remove all items in Model
		$("#model_List_In_Filter_Screen").html("");
		$("#model_List_In_Filter_Screen").append("<li>Select one Make</li>");
	}
}


</script>