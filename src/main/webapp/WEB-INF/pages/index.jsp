<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="expertFrontEndApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- font for navbar -->
<link href='https://fonts.googleapis.com/css?family=Angkor'	rel='stylesheet' type='text/css'>

<script type="text/javascript"	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"	rel="stylesheet" type="text/css">
<link rel="stylesheet"	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">

<script	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
<!-- Angular -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.6/angular.min.js"></script>


<!-- Exucuse Me can i put my cdn here? - Recommend Expert -->
<script	src="${pageContext.request.contextPath}/resources/experts/js/jquery.bootpage.min.js"></script>
<style>
.paging-nav a {
	background-color: teal;
	padding: 5px;
	margin: 2px;
	color: #FFF;
	border-radius: 3px;
}
</style>

<!-- Exucuse Me can i put my cdn here? - Recommend Expert -->
<script>
	$.noConflict();
	jQuery(document).ready(function($) {

		$('.slider').slider({
			full_width : true
		});

	});
</script>
<!-- statistic css  -->
<link
	href="${pageContext.request.contextPath}/resources/experts/css/statistic.css"
	rel="stylesheet" type="text/css">
<!-- js index  -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-filter/0.5.11/angular-filter.js"></script>
<script src="${pageContext.request.contextPath}/resources/experts/js/index.js"></script>
<!--custom-->
<link	href="${pageContext.request.contextPath}/resources/experts/css/custom.css"	rel="stylesheet" type="text/css">


<style type="text/css">
		.dropdown-menu > li > a:hover
		{
			background-color: #008080;
		}
</style>
</head>
<body ng-controller="expertController">
<!-- get user login by id  -->
<security:authorize access="isAuthenticated()">
    <span ng-init="getUserById(<security:authentication property="principal.id" />)"></span>
</security:authorize> 
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header ">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-ex-collapse">
					<span class="sr-only ">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- <a class="navbar-brand"><i class="-retro fa fa-crosshairs"></i></a> -->
				<a class="navbar-brand"> <img alt="EPSEEKER"
					class="img-responsive logo"
					src="${pageContext.request.contextPath}/resources/experts/img/logo11.png">
				</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class=" active menu"><a href="/" class="waves-effect waves-light "><i class="fa fa-home "></i> ទំព័រដើម</a></li>
					<li class="menu"><a href="/contact" class="waves-effect waves-light "><i class="fa fa-phone "></i> ទំនាក់ទំនង</a></li>
					<li class=" menu"><a href="/about" class="waves-effect waves-light"><i class="fa fa-users"></i> អំពីយើង</a></li>
					<security:authorize access="isAnonymous()">
						<li class="menu"><a href="/signup"	class="waves-effect waves-light "> <i class="fa fa-user-plus"></i> ចុះឈ្មោះ</a></li>
					</security:authorize>
					<li class="menu">
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
	<!--start carousel-->
	<div class="slider">
		<ul class="slides">
			<li><img
				src="${pageContext.request.contextPath}/resources/experts/img/3rd.jfif">
			</li>
			<li><br> <br> <img
				src="${pageContext.request.contextPath}/resources/experts/img/4th.jpg">
			</li>
		</ul>
	</div>
	<!--end carousel-->
	<br>
	<!--container developer-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary ">
					<div class="panel-heading  text-center home-header"​​>សូមស្វាគមន៍មកកាន់ <b><i> EPSEEKER</i></b><br>Welcome To EPSEEKER</div>
					<div class="panel-body ">
						<p  class="welcome"​>
							<span>នេះគឺជាគេហទំព័រមួយដែលជួយដល់និយោជកឬអ្នកដែលមានបំណងចង់ស្វែងរក​បុគ្គលិកសម្រាប់បម្រើការនៅក្រុមហ៊ុនរបស់ខ្លួនបានដោយ
								ផ្ដល់នូវមុខងារស្វែង​រកជាច្រើន។
								បេក្ខភាពទាំងអស់​នៅគេហទំព័រនេះសុទ្ធ​តែជាអតីតនិស្សិតរបស់មជ្ឈមណ្ឌលកូរ៉េសហ្វវែរ
								អេច អ ឌី គ្រប់ជំនាន់ទាំងអស់។ មុននឹងអាចប្រើប្រាស់គ្រប់មុខងារ
								ជាពិសេស
								ការបង្ហាញផ្នែកលំអិតរប​ស់បេក្ខជនដែលអ្នកចាប់អារម្មណ៍ដូ​ចជាកម្រិតនៃការសិក្សា
								មុខជំនាញ ​សញ្ញាបត្រ អាសយដ្ឋាន និង ព័ត៌មានជាច្រើនទៀតសូមធ្វើការ<a
								href="/signup"><b> ចុះឈ្មោះ </b></a> របស់អ្នក ដោយឥតគិតថ្លៃ។
							</span>
						</p>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="panel panel-primary text-justify">
					<div class="panel-heading  text-center home-header">ជំនាញ និង ចំនួនអ្នកជំនាញនៅក្នុងផ្នែករងនីមួយៗ</div>

					<div class="container-fluid">
						<!-- start skill tab list -->
						<ul class="nav nav-tabs">
							<li class="active subject_category"
								ng-click="getAllSubjectByCategoryID(1)"><a
								data-toggle="tab" href="#skills">Framework</a></li>
							<li class="subject_category"
								ng-click="getAllSubjectByCategoryID(2)"><a
								data-toggle="tab" href="#skills">Front-End</a></li>
							<li class="subject_category"
								ng-click="getAllSubjectByCategoryID(3)"><a
								data-toggle="tab" href="#skills">Back-End</a></li>
							<li class="subject_category"
								ng-click="getAllSubjectByCategoryID(4)"><a
								data-toggle="tab" href="#skills">Mobile Development</a></li>
							<li class="subject_category"
								ng-click="getAllSubjectByCategoryID(5)"><a
								data-toggle="tab" href="#skills">Database</a></li>
							<li class="subject_category"
								ng-click="getAllSubjectByCategoryID(6)"><a
								data-toggle="tab" href="#skills">Network</a></li>
							<li class="subject_category"
								ng-click="getAllSubjectByCategoryID(7)"><a
								data-toggle="tab" href="#skills">Server Operating System</a></li>
							<li class="subject_category"
								ng-click="getAllSubjectByCategoryID(8)"><a
								data-toggle="tab" href="#skills">Graphic Design</a></li>
							<li class="subject_category"
								ng-click="getAllSubjectByCategoryID(9)"><a
								data-toggle="tab" href="#skills">Microsoft Office</a></li>
						</ul>

						<div class="tab-content">
							<div id="skills" class="tab-pane fade in active">
								<div class="row">
									<div class="col-md-4 col-sm-6 col-xs-6 text-left skill-list"
										ng-repeat="category in categories">
										<a style="cursor: pointer;"
											ng-click="getSubjectID(category.SUBJECT_ID)"> <!-- we need inner join exp_expert_subject_detail and get count_EXP -->
											{{category.SUBJECT_NAME}}<span class="badge">{{category.NUMBER_OF_EXPERT_EACH_SKILL}}</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end skill tab list -->

				</div>
			</div>
		</div>
	</div>
	<!--end container developer-->
	<div class="container">
		<div class="row">
			<!-- ly -->
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading text-center"
						style="font-family:  'khmer os battambang', cursive;'">អ្នកជំនាញដែលអ្នកអាចនឹងត្រូវការ</div>
					<div class="panel-body">
						<!-- start popular expert  -->
						<table id="tableData" class="table">
							<thead>
								<tr>
									<th style="font-family: 'Khmer OS Siemreap'">រូបភាព</th>
									<th style="font-family: 'Khmer OS Siemreap'">ឈ្មោះ</th>
									<th style="font-family: 'Khmer OS Siemreap'">ជំនាញ</th>
									<th style="font-family: 'Khmer OS Siemreap'">អស័យដ្ដាន</th>
									<th style="font-family: 'Khmer OS Siemreap'"><i></i>
										បទពិសោធន៏</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="ep in experts">
									
										<td>
										<a href="/rest/expert/content/?id={{ep.EXPERT_ID}}" target="_blank"><img alt=""
											src="{{ep.EXPERT_PHOTO}}"
											style="width: 50px; height: 50px"></a>
											</td>
										<td style="max-width: 100px; vertical-align: initial; padding-top: 23px">{{ep.EXPERT_LAST_NAME}}
											{{ep.EXPERT_FIRST_NAME}}</td>
										<td style="max-width: 150px;padding-top: 23px">{{ep.EXPERT_ADVANCE_COURSE}}</td>
										<td style="max-width: 100px; padding-top: 23px">{{ep.EXPERT_CURRENT_ADDRESS.CITY_OR_PROVINCE_NAME}}</td>
										<td style="max-width: 30px; padding-top: 23px">{{ep.EXPERT_EXPERIENCES[0].PERIOD}}</td>
								</tr>
							</tbody>
						</table>

						<button class="fa fa-refresh btn btn-primary"
							ng-click="getExpertsByRandom()">More</button>

						<!-- end popular expert  -->
					</div>
				</div>
			</div>
		</div>
		<!-- ly  -->
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary text-center">
					<div class="panel-heading  text-center"​​ style="font-family: 'Khmer OS Battambang'">ស្ថិតិសរុបនៃជំនាញ</div>
					<div class="panel-body">
						<div class="row">
							<section class="section_0" ng-repeat="ss in numOfSkills">
							<div class="col-sm-6 col-xs-12 col-md-4">
								<div class="circle circle1">
									<a id=""><h5 style="color: #000">{{ss.NUM_OF_SKILLS}}<small style="font-family: 'Khmer OS Battambang'; font-size: 12px; font-weight: 600; color: black"> ជំនាញរង នៃ ជំនាញ</small></h5>	
										<h6 style="color: #000; font-weight: 600">
											{{ss.SUBJECT_CATEGORY_NAME}}
											</p>
										</h6></a>
								</div>
							</div>
							</section>
						</div>
						<!-- <div id="PAGINATION_STATISTIC"></div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<br>
	<div id="page-selection"></div>
	<jsp:include page="expert/fragements/footer/footer.jsp"></jsp:include>
</body>
</html>