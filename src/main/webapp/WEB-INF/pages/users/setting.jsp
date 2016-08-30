<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="expertFrontEndApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- font for navbar -->
 	<link href='https://fonts.googleapis.com/css?family=Angkor' rel='stylesheet' type='text/css'> 
 	
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> 
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css"> 

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
	<!-- Angular -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.6/angular.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-filter/0.5.11/angular-filter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/experts/js/index.js"></script>
    <!--custom-->
    <link href="${pageContext.request.contextPath}/resources/experts/css/custom.css" rel="stylesheet" type="text/css">
    <style>
    
/* .container > .navbar-header, .container-fluid > .navbar-header, .container > .navbar-collapse, .container-fluid > .navbar-collapse {
    padding-right: 158px;
} */
    </style>
    <style type="text/css">
		.dropdown-menu > li > a:hover
		{
			background-color: #008080;
		}
		.navbar-default .navbar-collapse, .navbar-default .navbar-form {
   		 padding-right: 62px;
			}
</style>
  </head>
  <body  ng-controller="expertController">
	  <security:authorize access="isAuthenticated()">
	    <span ng-init="getUserById(<security:authentication property="principal.id" />)"></span>
	</security:authorize>
    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header ">
          <button type="button" class="navbar-toggle " data-toggle="collapse" data-target="#navbar-ex-collapse">
            <span class="sr-only ">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand">
          		<img alt="EPSEEKER" class="logo" src="${pageContext.request.contextPath}/resources/experts/img/logo11.png">
          	</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
           <li class="menu"><a href="/" class="waves-effect waves-light "><i class="fa fa-home "></i> ទំព័រដើម</a></li>
            <li class="menu"><a href="/contact" class="waves-effect waves-light "><i class="fa fa-phone " ></i> ទំនាក់ទំនង</a></li>
            <li class=" menu"><a href="/about" class="waves-effect waves-light"><i class="fa fa-users" ></i> អំពីយើង</a></li>
            <security:authorize access="isAnonymous()">
          	  <li class="menu"><a href="/signup"	class="waves-effect waves-light "> <i class="fa fa-user-plus"></i> ចុះឈ្មោះ</a></li>
          	 </security:authorize>
            <li class=" menu">
						<security:authorize access="isAnonymous()">
						  <a href="/login" class="waves-effect waves-light "><i class="fa fa-sign-in "></i>
						   	 ចូល	
						 </a>
						</security:authorize> 	
					</li> 

				<security:authorize access="isAuthenticated()">
					<li role="presentation" class="dropdown">
					<a style="text-transform: uppercase;"  class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-user" aria-hidden="true"></i> សួស្ដី {{userlogined.username}} <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" style="margin: 0px; padding: 0px;">
							<li style="background-color: #008080;padding: 10px;">
							<a href="/logout" class="waves-effect waves-light" style=" font-family: 'khmer os battambang', cursive;color: #fff;  background-color: #008080;">	
							<i class="fa fa-sign-out "></i>ចាកចេញ</a>
							<security:authorize  access="hasRole('ADMIN')">
								<li class="menu" style="background-color: #008080;padding: 10px;"><a href="/rest/admin/dashboard" style="font-family: 'khmer os battambang', cursive;color: #fff;    background-color: #008080;"	class="waves-effect waves-light "> <i class="fa fa-user-secret"></i> គ្រប់គ្រង</a></li>
							</security:authorize>
							<security:authorize  access="hasRole('USER')">
								<li class="menu" style="background-color: #008080;padding: 10px;">
									<a href="/rest/user/setting" style="font-family: 'khmer os battambang', cursive;color: #fff  ;background-color: #008080;;" class="waves-effect waves-light "> <i class="fa fa-user"></i> គ្រប់គ្រង</a></li>
								<li class="menu" style="background-color: #008080;padding: 10px;">
									<a href="/rest/user/promote" style="font-family: 'khmer os battambang', cursive;color: #fff;  background-color: #008080;"	class="waves-effect waves-light "> <i class="fa fa-hand-o-up"></i> ដំឡើងឋានៈ</a>
								</li>
							</security:authorize>
						</ul>
					</li>
				</security:authorize>	
				
          </ul>
        </div>
      </div>
    </div>
    <!--end bavbar-->
    <br>
    <br>
    <br>
    <div class="container">
      <div class="row">
  		<div class="col-md-offset-1 col-md-10">
			  <div class="panel panel-primary text-center">
			    <div class="panel-heading" style="  font-family: 'Khmer OS Battambang';font-size: 17px;">កែប្រែគណនីរបស់អ្នក</div>
			    <!-- start content body -->
			    <div class="panel-body text-left">
			    	<form name="mysignup" method="POST">
			    	<div class="col-md-offset-2 col-md-8">
			    	<label for="email" class="signup-label">សារអេឡិចត្រូនិច</label>
			    		<input name="myemail" ng-model="email" class="form-control signup-email" id="email" type="email"  required> <br>
			    	<label for="username" class="signup-label">ឈ្មោះ​</label>
			    		<input type="text" class="form-control signup-username" id="username" ng-model="username" required ><br>
			    	<label for="password" class="signup-label">លេខសំងាត់ចាស់ </label>
			    		<input ng-keyup="validateOldPassword()" type="password"  id="password" class="form-control signup-password" ng-model="opwd" required ><br>
			    	<label for="password" class="signup-label">លេខសំងាត់ ថ្មី </label>
			    		<input ng-disabled="pstatus==false" type="password" ng-model="npwd" id="password" class="form-control signup-password" ><br>
			    	<div class="col-md-offset-4 col-sm-offset-4 col-xs-offset-4">	
			    		<button ng-disabled=" !email || !username || !opwd || !npwd || mysignup.$invalid " class="btn btn-signup" 
			    		ng-click="updateUser()"><i class="fa fa-user-plus"></i> កែប្រែ</button>
			    	</div>
			    	</div>
			    	</form>
			    </div>
			    <!-- end content body -->
			  </div>
  		</div>
      </div>
    </div>
    <br>
  <jsp:include page="../expert/fragements/footer/footer.jsp"></jsp:include>
</body>
</html>