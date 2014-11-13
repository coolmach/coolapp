<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	.searchText{height:35px; font-size:14px; border:1px solid #C9E835); width:200px;}
</style>
<div class="col-md-12 col-md-offset-3" id="breadCrumb" style="margin-left:0%;margin-top:15px;">
	<input type="text" id="item_search" class="searchText" placeholder="Search for items" value="<s:property value='searchKeyword'/>">
	<span style="margin-left:2px;"><img src="images/common/search_32.png" width="35" height="35" style="cursor:pointer;" onClick="searchPosts();"></span>
</div>
<script>
function searchPosts(){
	var keyword = $("#item_search").val();
	if(keyword != ""){
		window.location.href = "http://localhost:8080/Virat/searchPosts?" + "searchKeyword=" + keyword;	
	}else{
		$("#item_search").focus();
	}
}
$(document).ready(function(){
	$("#item_search").keydown(function(){
		if(event.keyCode == 13){
			searchPosts();
		}
	});
});
$(document).ready(function(){
	
	$("#item_search").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "Virat" + "/getKeywords?",
				//url:$('#contextPath').text() + "getLocation",
				type: "POST",
				dataType: "json",
				data: {keywordToSearch:$("#item_search").val()},
				success: function(data) {
					response( $.map(data.searchResults, function(item) {
						return {
							label: item.keyword,
							value: item.category,
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
			$("#item_search").val(ui.item.label);
			console.log(ui);
			$.ajax({
				url: "Virat" + "/searchPostsFilter?",
				//url:$('#contextPath').text() + "getLocation",
				type: "POST",
				//dataType: "json",
				data: {searchKeyword:ui.item.label},
				success: function(data) {
					console.log(data);
					$('.data').html('');
					$('.data').html(data);
				},
				error: function (error) {
					console.log(error);
					alert('error: ' + error.responseText);
				}
			});
		},
		minLength: 1
	});	
});
</script>
