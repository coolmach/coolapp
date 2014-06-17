<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%--             <div class="col-md-3">
                <a class="navbar-logo" href="<s:url action=""/>">
                    <b><i style="color:#ffff00;">CBuddy.</i>in</b>
                </a>
            </div>
            <div class="col-md-3">
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="col-md-6" id="login_div">
              <s:actionerror />
           <s:form action="login.action" id="login_form" cssClass="form-inline" method="post" theme="simple">
             <div class="form-group">
             <!-- <label class="sr-only" for="exampleInputEmail2">Email address</label> -->
             <s:textfield cssClass="form-control" id="exampleInputEmail2" placeholder="Email" name="userName" />
             </div>
			  <div class="form-group">
			    <!-- <label class="sr-only" for="exampleInputPassword2">Password</label> -->
			    <s:password cssClass="form-control" id="exampleInputPassword2" placeholder="Password" name="password" />
			  </div>
			  <!-- <div class="checkbox">
			    <label>
			      <input type="checkbox"> Remember me
			    </label>
			  </div> -->
			 <s:submit cssClass="btn btn-info" value="Log In"/>
            </s:form>
            <div class="col-md-4 forgot_pwd"> <a class="" href="">New User?Sign Up</a></div>
            <div class="col-md-4 forgot_pwd"> <a class="" href="">Forgot Password</a></div>   
                
            </div> --%>
            <!-- <div class="pull-right"> <b id="myuser"> </b><br/><a id="nav_user" href="/Cool/logout.action">logout</a> </div> -->
            <!-- /.navbar-collapse -->
            
<!--         </div>
        /.container
    </nav> -->
    
    
    <%-- <header id="login_top">
    <div class="container-fluid">
      <div class="row">
      <div class="col-md-3">
                <a class="navbar-logo" href="<s:url action=""/>">
                    <b><i style="color:#ffff00;">CBuddy.</i>in</b>
                </a>
            </div>
            <div class="col-md-3">
            </div>
      <div class="col-md-6 pull-right" id="login_div">
                <s:fielderror /> 
           <s:form action="login" id="login_form" cssClass="form-inline" method="post" theme="simple">
          
             <div class="form-group">
             <!-- <label class="sr-only" for="exampleInputEmail2">Email address</label> -->
             <s:textfield cssClass="form-control" id="exampleInputEmail2" placeholder="E-Mail ID" name="userName" />
             </div>
             <div class="form-group">
             </div>
			  <div class="form-group">
			    <!-- <label class="sr-only" for="exampleInputPassword2">Password</label> -->
			    <s:password cssClass="form-control" id="exampleInputPassword2" placeholder="Password" name="password" />
			  </div>
			  <!-- <div class="checkbox">
			    <label>
			      <input type="checkbox"> Remember me
			    </label>
			  </div> -->
			  <s:submit cssClass="btn btn-info" value="Log In"/> 
			  <a class="" href="#"><span style="margin-left:15px;margin-top:10px;">Sign Up</span></a>
			  					  <span style="margin-left:5px;margin-top:10px;color:#FFFFFF;">|</span>
			  <a class="" href="#"><span style="margin-left:5px;margin-top:10px;">Forgot Password</span></a> 
            </s:form>
           <!--  <div class="col-md-4 forgot_pwd" style="color:#0099cc;"> &nbsp;</div>
            <div class="col-md-4 forgot_pwd" style="color:#0099cc;"> &nbsp;</div> -->
             <a class="" href="#"><span style="margin-left:5px;margin-top:10px;">Forgot Password</span></a> 
            </div>
      </div>
    </div>
  </header> --%>
  
  <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="background-color:#0099cc;">
   
        <div class="container" style="width:100%;">
            <div class="navbar-header page-scroll">
                <a class="navbar-logo" href="<s:url action=""/>">
                    <b><i style="color:#ffff00;">CBuddy.</i>in</b>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse" style="width:600px;">
                <ul class="nav navbar-nav" style="float:right;">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>
               
                    <li class="page-scroll">
                        <a href="#contact">Contact</a>
                    </li>
                   
                     <li class="page-scroll">
                    <a  href="<s:url action="mylogin"/>"> Login</a> 
                    </li>
                </ul>
               <!--  <div class="pull-right"> <b id="myuser"> </b><br/><a id="nav_user" href="/Cool/logout.action">logout</a> </div> -->
            </div>
            <!-- /.navbar-collapse -->
            
        </div>
        <!-- /.container -->
    </nav>