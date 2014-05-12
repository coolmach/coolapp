<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="row header_2"></div>
<div class="col-md-6">
   <div class="col-md-3">
       <img src="images/cbuddy_boy.png">
   </div>
   <div class="col-md-9">
        <div class="col-md-12 cbuddy_intro"><h4>An exclusive Classifieds portal for Techies</h4></div>
        <div class="col-md-12 cbuddy_intro"><i style="margin:10px;">"Say no to brokers, yes to fellow IT companies"</i></div>
        <div class="col-md-12 cbuddy_intro" >
             <div style="margin:15px;"><img src="images/star.jpg"><b>Verified Posts</b></div>
             <div style="margin:15px;"><img src="images/star.jpg"><b>Authenticate Users</b></div>
        </div>
        <div class="col-md-12" >
             <img src="images/arrow.png"> <input type="text" class="input-lg" id="category" name="category" placeholder="I am looking for...">
        </div>
   </div>
</div>
<div class="col-md-6">
    <div class="table mygrid">
          <s:url action="addetails" var="urlTag">
            <s:param name="category">REAL ESTATE</s:param>
          </s:url>
          <a href="<s:property value="#urlTag" />" ><img  class="images_ad" src="images/real_estate.png"></a>
    </div>
	<div class="table mygrid">
	<s:url action="addetails" var="urlTag1">
            <s:param name="category">CARS</s:param>
          </s:url>
          <a href="<s:property value="#urlTag1" />" ><img  class="images_ad" src="images/cars.png"></a>
	</div>
	<div class="table mygrid">
	<s:url action="addetails" var="urlTag2">
            <s:param name="category">HOUSEHOLD</s:param>
          </s:url>
          <a href="<s:property value="#urlTag2" />" ><img  class="images_ad" src="images/household.png"></a>
	</div>
	<div class="table mygrid">
	<s:url action="addetails" var="urlTag3">
            <s:param name="category">LAPTOPS</s:param>
          </s:url>
          <a href="<s:property value="#urlTag3" />" ><img  class="images_ad" src="images/laptops.png"></a>
	</div>
	<div class="table mygrid">
	<s:url action="addetails" var="urlTag4">
            <s:param name="category">MOBILES</s:param>
          </s:url>
          <a href="<s:property value="#urlTag4" />" ><img  class="images_ad" src="images/mobiles.png"></a>
	</div>
	<div class="table mygrid">
	<s:url action="addetails" var="urlTag5">
            <s:param name="category">DVD</s:param>
          </s:url>
          <a href="<s:property value="#urlTag5" />" ><img  class="images_ad" src="images/dvd.png"></a>
	</div><br/>
	
<div class=" mygrid_post">  <a id="post_ad" href="#stores" class="" >Post Ad</a></div>

</div>
