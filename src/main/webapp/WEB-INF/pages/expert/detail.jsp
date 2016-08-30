<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="expertFrontEndApp">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<!-- font for navbar -->
	<link href='https://fonts.googleapis.com/css?family=Angkor'	rel='stylesheet' type='text/css'>
	<!--bootstrap css-->
	<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/expert/bootstrap-3.3.6-dist/css/bootstrap.min.css" />
	<!--font awesome-->
	<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/expert/font-awesome-4.6.3/css/font-awesome.min.css" />
	
	<!--bootstrap modal-->
	<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!--bootstrap modal-->
	<!--AngularJS-->
	<script	src="${pageContext.request.contextPath }/resources/expert/angularjs/angular.min.js"></script>
	<script	src="${pageContext.request.contextPath }/resources/expert/angularjs/myapplication.js"></script>
	<!--AngularJS-->
	<!--Progress Bar-->
	<script	src="${pageContext.request.contextPath }/resources/expert/js/progressbar.js" /></script>
	<script src="${pageContext.request.contextPath}/resources/experts/js/index.js"></script>
	<!--Date Picker-->
	<!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
	<script type="text/javascript"	src="https://formden.com/static/cdn/formden.js"></script>
	
	<!-- Inline CSS based on choices in "Settings" tab -->
	<style>
		.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p,
			.bootstrap-iso form {
			font-family: Arial, Helvetica, sans-serif;
			color: black
		}
		
		.bootstrap-iso form button, .bootstrap-iso form button:hover {
			color: white !important;
		}
		
		.asteriskField {
			color: red;
		}
		
		.navbar-default .navbar-collapse, .navbar-default .navbar-form {
			width: 1094px;
		}
		.navbar-default .navbar-collapse, .navbar-default .navbar-form {
		    border-color: #e7e7e7;
		    padding-right: 158px;
		}
	</style>
	<!-- footer -->
	<link href="${pageContext.request.contextPath}/resources/experts/css/custom.css" rel="stylesheet" type="text/css">
</head>
<body ng-controller="expertController">
	<!-- getUserById after login -->
	<security:authorize access="isAuthenticated()">
	    <span ng-init="getUserById(<security:authentication property="principal.id" />)"></span>
	</security:authorize>
	<!-- end getUserById after login -->
	
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header ">
				<button type="button" class="navbar-toggle" data-toggle="collapse"	data-target="#navbar-ex-collapse">
					<span class="sr-only ">Toggle navigation</span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand"> <img alt="EPSEEKER" class="img-responsive logo" src="${pageContext.request.contextPath}/resources/experts/img/logo11.png"></a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="  menu"><a href="/"	class="waves-effect waves-light "><i class="fa fa-home "></i> ទំព័រដើម</a></li>
					<li class="menu"><a href="/contact"	class="waves-effect waves-light "><i class="fa fa-phone "></i> ទំនាក់ទំនង</a></li>
					<li class=" menu"><a href="/about" class="waves-effect waves-light"><i class="fa fa-user-secret"></i> អំពី</a></li>
					<security:authorize access="isAnonymous()">
						<li class="menu"><a href="/signup"	class="waves-effect waves-light "> <i class="fa fa-user-plus"></i> ចុះឈ្មោះ</a></li>
					</security:authorize>
					<li class="menu">
						<security:authorize access="isAnonymous()">
						  <a href="/login" class="waves-effect waves-light "><i class="fa fa-sign-in "></i>	 ចូល </a>
						</security:authorize> 	
					</li> 

				<security:authorize access="isAuthenticated()">
					<li role="presentation" class="dropdown">
						<a style="text-transform: uppercase;" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-user" aria-hidden="true"></i> សួស្ដី {{userlogined.username}} <span class="caret"></span>
						</a>
						<ul class="dropdown-menu" style="margin: 0px; padding: 0px;">
							<li style="background-color: #008080;padding: 10px;">
								<a href="/logout" class="waves-effect waves-light" style="font-family: 'Angkor';color: #fff;">	
							<i class="fa fa-sign-out "></i>ចាកចេញ</a>
							<security:authorize  access="hasRole('ADMIN')">
								<li class="menu" style="background-color: #008080;padding: 10px;"><a href="/rest/admin/dashboard" style="font-family: 'Angkor';color: #fff;"	class="waves-effect waves-light "> <i class="fa fa-user-secret"></i> គ្រប់គ្រង</a></li>
							</security:authorize>
							<security:authorize  access="hasRole('USER')">
								<li class="menu" style="background-color: #008080;padding: 10px;"><a href="/rest/user/setting" style="font-family: 'Angkor';color: #fff;"	class="waves-effect waves-light "> <i class="fa fa-user"></i> គ្រប់គ្រង</a></li>
								<li class="menu" style="background-color: #008080;padding: 10px;"><a href="/rest/user/promote" style="font-family: 'Angkor';color: #fff;"	class="waves-effect waves-light "> <i class="fa fa-hand-o-up"></i> ដំឡើងឋានៈ</a></li>
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
	<br>
	<jsp:include page="fragements/detail/EpDetail.jsp"></jsp:include>
	<!-- Include Date Range Picker -->
	<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
	<!-- footer -->

	<jsp:include page="fragements/footer/footer.jsp"></jsp:include>
</body>
</html>