<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="expertFrontEndApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- My APP -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-filter/0.5.11/angular-filter.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/experts/js/index.js"></script>
<!-- My APP -->

<!-- font for navbar -->
<link href='https://fonts.googleapis.com/css?family=Angkor'
	rel='stylesheet' type='text/css'>

<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/experts/ui/ui.min.css">
<!--custom-->
<link
	href="${pageContext.request.contextPath}/resources/experts/css/custom.css"
	rel="stylesheet" type="text/css">

<!-- font-awesome-4.6.3 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/expert/font-awesome-4.6.3/css/font-awesome.min.css">

<script
	src="${pageContext.request.contextPath}/resources/experts/js/jquery.bootpage.min.js"></script>

<script>
	
$(document).ready(function() {
	
	var SUB_ID= '<%=request.getParameter("id")%>';
	  $('a').tooltip({placement: 'top'});
	  $( "#toggle1" ).click(function() {
	      $("#widget-body1").slideToggle( "slow" );
		  $('#toggle1').toggleClass(function() {
		  if ($(this).is('.fa fa-chevron-down')) {
			return '.fa fa-chevron-up';
		  } else {
			return '.fa fa-chevron-down';
		  }
		})
	 });  
	 
	   $( "#toggle2" ).click(function() {
	      $("#widget-body2").slideToggle( "slow" );
		  
		  $('#toggle2').toggleClass(function() {
		  if ($(this).is('.fa fa-chevron-down')) {
			return '.fa fa-chevron-up';
		  } else {
			return '.fa fa-chevron-down';
		  }
		})
	 }); 

	   
	   $( "#toggle3" ).click(function() {
		      $("#widget-body3").slideToggle( "slow" );
			  
			  $('#toggle2').toggleClass(function() {
			  if ($(this).is('.fa fa-chevron-down')) {
				return '.fa fa-chevron-up';
			  } else {
				return '.fa fa-chevron-down';
			  }
			})
		 }); 

	   $( "#toggle4" ).click(function() {
		      $("#widget-body4").slideToggle( "slow" );
			  
			  $('#toggle2').toggleClass(function() {
			  if ($(this).is('.fa fa-chevron-down')) {
				return '.fa fa-chevron-up';
			  } else {
				return '.fa fa-chevron-down';
			  }
			})
		 }); 

	   $( "#toggle5" ).click(function() {
		      $("#widget-body5").slideToggle( "slow" );
			  
			  $('#toggle2').toggleClass(function() {
			  if ($(this).is('.fa fa-chevron-down')) {
				return '.fa fa-chevron-up';
			  } else {
				return '.fa fa-chevron-down';
			  }
			})
		 }); 

	});

</script>

<style>
/*WIDGETS */
a {
	color: #A3A5A7;
	text-decoration: none;
}

a:hover, a:focus {
	color: #434446;
	text-decoration: none;
}

.widget {
	background: #fff;
	margin: 0 auto 20px;
	position: static;
	border: 1px solid #c1c1c1;
}

.widget .tab-content {
	padding: 0;
}

.widget .widget-head {
	background-color: #009688;
	background-image: -moz-linear-gradient(top, #f8f8f8, #ededed);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f8f8f8),
		to(#ededed));
	background-image: -webkit-linear-gradient(top, #f8f8f8, #ededed);
	background-image: -o-linear-gradient(top, #f8f8f8, #ededed);
	background-image: linear-gradient(to bottom, #f8f8f8, #ededed);
	background-repeat: repeat-x;
	border-bottom: 1px solid #c1c1c1;
	color: #fff;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
	height: 40px;
	line-height: 40px;
	position: relative;
	padding: 0 15px 0 0;
}

.widget .widget-head.progress {
	-webkit-border-radius: 0 0 0 0;
	-moz-border-radius: 0 0 0 0;
	border-radius: 0 0 0 0;
	margin: 0;
	padding: 0;
}

.widget .widget-head .glyphicons {
	height: 40px;
	width: 30px;
	padding: 0;
}

.widget .widget-head .fai:before {
	width: 30px;
	height: 40px;
	line-height: 31px;
	text-align: center;
	font-size: 16px;
	color: rgba(255, 255, 255, 0.5);
}

.widget .widget-head .heading {
	margin: 0;
	color: #45484d;
	font-size: 14px;
	height: 40px;
	line-height: 40px;
	padding: 0 15px;
	float: left;
}

.widget .widget-head .heading.glyphicons {
	width: auto;
	display: block;
	padding: 0 0 0 35px;
}

.widget .widget-head .heading.fai:before {
	padding: 0;
	margin: 0;
	left: 0;
	top: 0;
	height: 40px;
	line-height: 40px;
	text-align: center;
	width: 35px;
	color: #45484d;
	font-size: 16px;
	font-weight: normal;
	text-shadow: none;
}

.widget .widget-head a {
	text-shadow: none;
}

.widget .widget-head .dropdown-menu li>a:hover, .widget .widget-head .dropdown-menu li>a:focus,
	.widget .widget-head .dropdown-submenu:hover>a {
	background-color: #47759e;
	background-image: -moz-linear-gradient(top, #47759e, #d24343);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#47759e),
		to(#d24343));
	background-image: -webkit-linear-gradient(top, #47759e, #d24343);
	background-image: -o-linear-gradient(top, #47759e, #d24343);
	background-image: linear-gradient(to bottom, #47759e, #d24343);
	background-repeat: repeat-x;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffda4c4c',
		endColorstr='#ffd24343', GradientType=0);
}

.widget .details {
	font-size: 8pt;
	color: #45484d;
}

.widget .widget-body {
	padding: 20px 15px;
}

.widget .widget-body form {
	margin: 0;
}

.widget .widget-body .count {
	font-size: 15pt;
	font-weight: 400;
}

.widget .widget-body>p:last-child {
	margin: 0;
}

.widget .widget-body.list {
	color: #575655;
	padding: 0;
}

.widget .widget-body.list ul {
	margin: 0;
	list-style: none;
}

.widget .widget-body.list ul li {
	padding: 0 10px;
	height: 39px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.02);
	line-height: 39px;
	text-align: left;
	clear: both;
}

.widget .widget-body.list ul li:first-child {
	border-top: none;
}

.widget .widget-body.list ul li:last-child {
	border-bottom: none;
}

.widget .widget-body.list ul li .count {
	float: right;
	color: #47759e;
}

.widget .widget-body.list ul li .sparkline {
	position: relative;
	top: 5px;
	margin-left: 5px;
}

.widget .widget-body.list.products li {
	height: 60px;
	line-height: 60px;
}

.widget .widget-body.list.products .img {
	float: left;
	display: inline-block;
	width: 48px;
	height: 44px;
	line-height: 44px;
	color: #818181;
	text-align: center;
	background: #272729;
	margin: 8px 8px 0 0;
	-webkit-border-radius: 3px 3px 3px 3px;
	-moz-border-radius: 3px 3px 3px 3px;
	border-radius: 3px 3px 3px 3px;
	cursor: pointer;
	font-size: 10pt;
	font-weight: 600;
}

.widget .widget-body.list.products .title {
	line-height: normal;
	display: inline-block;
	padding: 13px 0 0;
	font-family: "Raleway", sans-serif;
	text-transform: uppercase;
}

.widget .widget-body.list.products .title strong {
	font-family: "Open Sans", sans-serif;
	text-transform: none;
}

.widget .widget-body.list.fluid ul li {
	height: auto;
	line-height: normal;
	padding: 10px;
}

.widget .widget-body.list.list-2 ul li {
	border-bottom: 1px solid #d8d9da;
	border-top: none;
	background: #f8f8f8;
}

.widget .widget-body.list.list-2 ul li.active {
	border-color: #dddddd;
	background: #fff;
}

.widget .widget-body.list.list-2 ul li.active i:before {
	font-weight: normal;
	background: #47759e;
	color: #fff;
	text-shadow: none;
}

.widget .widget-body.list.list-2 ul li.active a {
	color: #47759e;
}

.widget .widget-body.list.list-2 ul li:last-child {
	border-bottom: none;
}

.widget .widget-body.list.list-2 ul li a {
	display: block;
	color: #222;
	padding: 0 0 0 30px;
}

.widget .widget-body.list.list-2 ul li a i:before {
	color: #555;
	width: 20px;
	height: 17px;
	font-size: 14px;
	border: 1px solid #ccc;
	background: #dddddd;
	top: 9px;
	left: 0;
	text-align: center;
	vertical-align: middle;
	padding-top: 3px;
	text-shadow: 0 1px 0 #fff;
}

.widget .widget-body.list.list-2 ul li.hasSubmenu {
	height: auto;
}

.widget .widget-body.list.list-2 ul li.hasSubmenu ul {
	padding: 0 0 10px;
}

.widget .widget-body.list.list-2 ul li.hasSubmenu ul li {
	height: auto;
	line-height: normal;
	background: none;
	border: none;
	line-height: 20px;
}

.widget .widget-body.list.list-2 ul li.hasSubmenu ul li a {
	color: #333;
	padding: 0 0 0 20px;
}

.widget .widget-body.list.list-2 ul li.hasSubmenu ul li.active a {
	font-weight: bold;
}

.widget .widget-footer {
	background: #f7f7f7;
	height: 25px;
	line-height: 25px;
	border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #ffffff;
}

.widget .widget-footer .fa {
	width: 25px;
	height: 25px;
	line-height: 25px;
	padding: 0;
	float: right;
}

.widget .widget-footer .fa i:before {
	font-size: 16px;
	color: #c3c3c3;
	text-align: center;
	width: 20px;
	height: 25px;
	line-height: 25px;
	text-shadow: 0 1px 0 #fff;
}

.widget .widget-footer .fa:hover i:before {
	color: rgba(0, 0, 0, 0.5);
}

.widget.margin-bottom-none {
	margin-bottom: 0;
}

.widget.widget-gray {
	background: #f5f5f5;
}

.widget.widget-gray .widget-head {
	background: #e9e9e9;
	border-color: #d1d2d3;
	box-shadow: inset 1px 1px 1px rgba(255, 255, 255, 0.6), inset -1px -1px
		1px rgba(0, 0, 0, 0);
	-moz-box-shadow: inset 1px 1px 1px rgba(255, 255, 255, 0.6), inset -1px
		-1px 1px rgba(0, 0, 0, 0);
	-webkit-box-shadow: inset 1px 1px 1px rgba(255, 255, 255, 0.6), inset
		-1px -1px 1px rgba(0, 0, 0, 0);
}

.widget.widget-gray .widget-head .heading {
	color: #555555;
	text-shadow: 0 1px 0 #fff;
}

.widget.widget-gray .widget-head .heading.fai:before {
	background: none;
	color: #555;
	border-color: rgba(0, 0, 0, 0.1);
}

.widget.widget-body-white .widget-body {
	background: #fff;
}
</style>

</head>
<body ng-controller="expertController"
	ng-init="goToSearchBySubjectID(<%=request.getParameter("id")%>)">

	<!-- get user login by id  -->
	<security:authorize access="isAuthenticated()">
		<span
			ng-init="getUserById(<security:authentication property="principal.id" />)"></span>
	</security:authorize>

	<!-- start navbar -->
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header ">
				<button type="button" class="navbar-toggle " data-toggle="collapse"
					data-target="#navbar-ex-collapse">
					<span class="sr-only ">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--  <a class="navbar-brand"><i class="fa -retro fa-crosshairs"></i></a> -->
				<a class="navbar-brand"> <img alt="EPSEEKER" class="logo"
					src="${pageContext.request.contextPath}/resources/experts/img/logo11.png">
				</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="menu"><a href="/" class="waves-effect waves-light "><i
							class="fa fa-home "></i> ទំព័រដើម</a></li>
					<li class="menu"><a href="/contact"
						class="waves-effect waves-light "><i class="fa fa-phone "></i>ទំនាក់ទំនង</a>
					</li>
					<li class=" menu"><a href="/about"
						class="waves-effect waves-light"><i class="fa fa-user-secret"></i>
							អំពីយើង</a></li>
					<security:authorize access="isAnonymous()">
					<li class="menu"><a href="/signup"	class="waves-effect waves-light "> <i class="fa fa-user-plus"></i>
							ចុះឈ្មោះ
					</a></li>
					</security:authorize>
					<li class="menu">
						<security:authorize access="isAnonymous()">
							<a href="/login" class="waves-effect waves-light "><i
								class="fa fa-sign-in "></i> ចូល </a>
						</security:authorize></li>

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
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary text-justify">
					<div class="panel-heading  text-center home-header">
						ការណែនាំនៃការប្រើប្រាស់ របស់<b><i> EPSEEKER</i></b><br>Introduction
						To EPSEEKER
					</div>
					<div class="panel-body">
						<div style="word-wrap: break-word;" class="text-left;">
							<p ​​ class="welcome"​>ទំព័រនេះជួយអ្នកក្នុងការស្វែងរកអ្នកជំនាញIT​ទៅតាមអ្វីដែលអ្នកចង់បាន។​ផ្នែកទាំងពីរខាងក្រោមពិតជាសំខាន់សម្រាប់អ្នក។​អ្នកគ្រាន់តែដឹង
								ពីររបៀបប្រើប្រាស់វាគឺគ្រប់គ្រាន់។ផ្នែកខាងឆ្វេងជាកន្លែងសម្រាប់កំណត់តម្រូវការរបស់អ្នក
								បន្ទាប់មកចុចលើប៊ូតុងស្វែងរក។​ ផ្នែកខាងស្ដាំជា
								កន្លែងសម្រាប់បង្ហាញលទ្ធផល។</p>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="row"></div>
		<div class="row">
			<div class="col-md-5">
				<div class="panel panel-primary text-left">
					<div class="panel-heading "
						style="font-family: 'Khmer OS Battambang'; padding: 23px">
						ឧបករណ៍ស្វែងរក <span style="float: right">
							<button class="btn" ng-click="clickSearchAdvance()"
								style="background-color: #FFF; border-radius: 2px; font-weight: 600;">
								<a style="color: teal">Search</a>
							</button>
						</span>
					</div>

					<div class="panel-body"
						style="height: 600px; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto;">

						<div class="row" style="padding: 10px">
							<div class="widget">
								<!-- TYPE PANEL -->
								<div style="background-color: #008080; padding: 10px;">
									<h4 class="heading" style="color: #FFF">CHOOSE EXPERT
										SKILL</h4>
								</div>
								<!-- /HEAD PANEL -->

								<div class="widget-body" id="widget-body2">
									<!-- CONTENT PANEL -->
									<h5>MAIN SKILL</h5>
									<select class="form-control" ng-model="objSkill"
										ng-options="sk.SUBJECT_CATEGORY_NAME for sk in skills">
										<option style="display: none" value="">--Select--</option>
									</select>
									<h5>SUB SKILLS</h5>
									<div class="row" ng-repeat="subskill in objSkill.SUBJECT">
										<div class="col-md-12 col-sm-12">
											<input type="checkbox" class="col-md-6"
												value="{{subskill.SUBJECT_ID}}" name="subjectValues" />{{subskill.SUBJECT_NAME}}
										</div>
									</div>

								</div>
								<!-- /CONTENT PANEL -->

								<div class="widget-footer">
									<!-- FOOTER PANEL-->
									<a href="#" id="toggle2" class="fa fa-chevron-up fa-1x"
										data-toggle="tooltip" data-placement="right" title=""><i></i></a>
								</div>
								<!-- /FOOTER PANEL-->

							</div>
							<!-- /TYPE PANEL -->
						</div>


						<div class="row" style="padding: 10px">
							<div class="widget">
								<!-- TYPE PANEL -->
								<div style="background-color: #008080; padding: 10px;">
									<h4 class="heading" style="color: #FFF">WORK EXPERIENCE</h4>
								</div>
								<!-- /HEAD PANEL -->

								<div class="widget-body" id="widget-body1">
									<h5>POSITION EXPERIENCE</h5>
									<select class="form-control" ng-model="objPosition"
										ng-options="pos.POSITION_NAME for pos in positions">
										<option style="display: none" value="">--Select--</option>
									</select>
									<h4>YEAR OF EXPERIENCE</h4>
									<select class="form-control" ng-model="expPeroid"
										ng-options="ev.EXP_SHOW for ev in experienceValues">
										<option style="display: none" value="">--Select--</option>
									</select>

								</div>
								<!-- /CONTENT PANEL -->

								<div class="widget-footer">
									<!-- FOOTER PANEL-->
									<a href="#" id="toggle1" class="fa fa-chevron-up fa-1x"
										data-toggle="tooltip" data-placement="right" title=""><i></i></a>
								</div>
								<!-- /FOOTER PANEL-->

							</div>
							<!-- /TYPE PANEL -->
						</div>


						<div class="row" style="padding: 10px">
							<div class="widget">
								<!-- TYPE PANEL -->
								<div style="background-color: #008080; padding: 10px;">
									<h4 class="heading" style="color: #FFF">PERSONAL
										INFORMATION</h4>
								</div>
								<!-- /HEAD PANEL -->

								<div class="widget-body" id="widget-body3">
									<h5>LANGUAGE</h5>
									<div class="row">
										<div class="col-md-6 col-sm-6" ng-repeat="lang in languages">
											<input type="checkbox" class="col-md-6"
												name="languagesValues" value="{{lang.LANGUAGE_ID}}" />{{lang.LANGUAGE_NAME}}
										</div>
									</div>
									<br>
									<h5>GENDER</h5>
									<select class="form-control" id="gender">
										<option value="0">Both</option>
										<option value="1">Male</option>
										<option value="2">Female</option>
									</select>
									<h5>AGE</h5>
									<select class="form-control" ng-model="objAge"
										ng-options="age.AGE_INFO for age in ages">
										<option style="display: none" value="1">--Select--</option>
									</select>
									<h5>LOCATION</h5>
									<select class="form-control" ng-model="objLocation"
										ng-options="loc.CITY_OR_PROVINCE_NAME for loc in locations">
										<option style="display: none" value="">--Select--</option>
									</select>
								</div>
								<!-- /CONTENT PANEL -->

								<div class="widget-footer">
									<!-- FOOTER PANEL-->
									<a href="#" id="toggle3" class="fa fa-chevron-up fa-1x"
										data-toggle="tooltip" data-placement="right" title=""><i></i></a>
								</div>
								<!-- /FOOTER PANEL-->

							</div>
							<!-- /TYPE PANEL -->
						</div>

						<div class="row" style="padding: 10px">
							<div class="widget">
								<!-- TYPE PANEL -->
								<div style="background-color: #008080; padding: 10px;">
									<h4 class="heading" style="color: #FFF">JOB EXPECTATION</h4>
								</div>
								<!-- /HEAD PANEL -->

								<div class="widget-body" id="widget-body4">
									<h5>EXPECTED SALARY</h5>
									<select class="form-control" ng-model="objSalary"
										ng-options="sa.SALARY_INFO for sa in expectedSalarys">
										<option style="display: none" value="">--Select--</option>
									</select>
								</div>
								<!-- /CONTENT PANEL -->

								<div class="widget-footer">
									<!-- FOOTER PANEL-->
									<a href="#" id="toggle4" class="fa fa-chevron-up fa-1x"
										data-toggle="tooltip" data-placement="right" title=""><i></i></a>
								</div>
								<!-- /FOOTER PANEL-->

							</div>
							<!-- /TYPE PANEL -->
						</div>
					</div>
					<!--end panel search body-->
				</div>
			</div>
			<div class="col-md-7">
				<!--start panel result-->
				<div class="panel panel-primary text-left">
					<div class="panel-heading "
						style="font-family: 'Khmer OS Battambang'" id=""RESULT"">លទ្ធផលស្វែងរក</div>
					<div class="panel-body">
						<!-- ly  -->
						<table class="table table-responsive">
							<thead>
								<tr>
									<th style="font-family: 'Khmer OS Battambang'">រូបថត</th>
									<th style="font-family: 'Khmer OS Battambang'">ឈ្មោះ</th>
									<th style="font-family: 'Khmer OS Battambang'">ជំនាញ</th>
									<th style="font-family: 'Khmer OS Battambang'">ប្រាក់ខែ</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="ers in resultExpert">
									<td style="text-align: center;">
										<div>
											<a href="/rest/expert/content/?id={{ers.EXPERT_ID}}"
												target="_blank"> <img src="{{ers.EXPERT_PHOTO}}"
												width="30px" height="30px" alt="profile">
											</a>
										</div>
									</td>
									<td>{{ers.EXPERT_FIRST_NAME}} {{ers.EXPERT_LAST_NAME}}</td>
									<td><em><i>{{ers.EXPERT_ADVANCE_COURSE}}</i></em></td>
									<td>{{ers.EXPERT_JOB_EXPECTATIONS[0].MIN_SALARY |
										currency}} {{ers.EXPERT_JOB_EXPECTATIONS[0].MAX_SALARY |
										currency}}</td>
								</tr>
							</tbody>

						</table>
						<!-- ly -->
						<div id="PAGINATION"></div>
					</div>
				</div>
			</div>
			<!--end panel result-->
		</div>
	</div>
	<script type="text/javascript">
			var searchID = '<%=request.getParameter("id")%>
		';
	</script>
	<jsp:include page="expert/fragements/footer/footer.jsp"></jsp:include>
</body>
</html>

