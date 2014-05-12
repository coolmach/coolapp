<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row header_2">
  <div class="col-md-4"></div>
  <div class="col-md-7">Home > </div>
</div>
<div class="col-md-4">
<!-- <div class="sidebar_head span3"><h2>Readymade Packs</h2></div>
  <div class="sidebar span3">Family Pack - Nuclear</div>
   <div class="sidebar span3">Family Pack - Joint</div>
    <div class="sidebar span3">Babies Pack</div>
     <div class="sidebar span3">Weekend Pack</div> -->
</div>
<div class="col-md-7">
<s:if test="adList.size() > 0">
    <table class="table table-bordered">
    <tr>
    <th>Description</th>
    <th></th>
     <th>Price</th>
      <th>Date</th>
       <th>Posted By</th>
    </tr>
    <s:iterator value="adList" status="userStatus">
    <tr>
    <td>
    <img class="" src=" <s:property value="imageFileName" />">
    </td>
    <td>
    <p><s:property value="title" /></p>
    <s:iterator begin="1" end="rating">
     <img class="rating_stars" src="images/star.jpg">
    </s:iterator> 
	<%-- <s:if test="rating % 1 == 0">
	<img class="rating_half_stars" src="images/halfstar.jpg">
	</s:if> --%>
    <br/>
    <small><b><s:property value="cityCode" />,<s:property value="locCode" /></b></small><br/>
    <small>Contact <s:property value="contactPerson" />,<s:property value="contactNo" /></small>
    </td>	
     <td><s:property value="price" /></td>
      <td><s:date name="rCreTime" format="dd/MM/yyyy"/></td>
       <td><s:property value="firstName" />(<s:property value="corpName" />)</td>
    </tr>
    </s:iterator>
    </table>
   </s:if>
</div>