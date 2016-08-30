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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
    <!--custom-->
    <link href="${pageContext.request.contextPath}/resources/experts/css/custom.css" rel="stylesheet" type="text/css">
    <script>
      $.noConflict();
        jQuery(document).ready(function($){
        $('select').material_select();
        $('.slider').slider({full_width: true});
                                         	
       });
    </script>
     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<!-- Angular -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.6/angular.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-filter/0.5.11/angular-filter.js"></script>
<script src="${pageContext.request.contextPath}/resources/experts/js/index.js"></script>
<style type="text/css">
		.dropdown-menu > li > a:hover
		{
			background-color: #008080;
		}
		   .media
    {
        /*box-shadow:0px 0px 4px -2px #000;*/
        margin: 20px 0;
        padding:30px;
    }
    .dp
    {
        border:10px solid #eee;
        transition: all 0.2s ease-in-out;
    }
    .dp:hover
    {
        border:2px solid #eee;
        transform:rotate(360deg);
        -ms-transform:rotate(360deg);  
        -webkit-transform:rotate(360deg);  
        /*-webkit-font-smoothing:antialiased;*/
    }
</style>
 </head>
  <body ng-controller="expertController">
  <div class="container-fluid">
  <!-- get user login by id  -->
  
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
         <!--  <a class="navbar-brand"><i class="-retro fa fa-crosshairs"></i></a> -->
         <a class="navbar-brand">
          		<img alt="EPSEEKER" class="logo" src="${pageContext.request.contextPath}/resources/experts/img/logo11.png">
          	</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
           <li class="menu">
              <a href="/" class="waves-effect waves-light " ><i class="fa fa-home " ></i> ទំព័រដើម</a>
            </li>
            <li class=" menu">
              <a href="/contact" class="waves-effect waves-light " "><i class="fa fa-phone " ></i> ទំនាក់ទំនង</a>
            </li>
            <li class="active menu">
              <a href="/about" class="waves-effect waves-light"><i class="fa fa-users" ></i> អំពីយើង</a>
            </li>
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
    <br>
    <br>
    <br>
    <br>
    <div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary text-center">
					<div class="panel-heading  text-center home-header">អ្វីដែលយើងកំពុងធ្វី</div>
					<div class="panel-body text-justify">
						<p style="word-wrap: break-word;" class="welcome">
							នេះគឺជាគេហទំព័រមួយដែលជួយដល់និយោជកឬអ្នកដែលមាន​បំណងចង់ស្វែងរក​បុគ្គលិកសម្រាប់បម្រើការនៅក្រុមហ៊ុនរបស់
							ខ្លួនបានដោយផ្ដល់នូវមុខងារស្វែង​រកជាច្រើន។បេក្ខភាពទាំង
							អស់​នៅគេហទំព័រនេះសុទ្ធ​តែជាអតីតនិស្សិតរបស់មជ្ឈមណ្ឌល
							កូរ៉េសហ្វវែរអេច អ ឌី គ្រប់ជំនាន់ទាំងអស់។ មុននឹងអាចប្រើ
							ប្រាស់គ្រប់មុខងារជាពិសេសការបង្ហាញផ្នែកលំអិតរប​ស់បេក្ខជន
							ដែលអ្នកចាប់អារម្មណ៍ដូ​ចជាកម្រិតនៃការសិក្សាមុខជំនាញ ​ សញ្ញាបត្រ
							អាសយដ្ឋាន និង ព័ត៌មានជាច្រើនទៀតសូម ធ្វើការចុះឈ្មោះ
							និងចូលក្នុងគណនីរបស់អ្នក ដោយឥតគិតថ្លៃ ។</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="panel panel-primary text-center">
		<div class="panel-heading  text-center home-header">ព័ត៏មានអំពី Developer</div><br>
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					
				    <div class="col-lg-6">
				        <div class="media">
				            <a class="pull-left" href="#">
				                <img class="media-object dp img-circle" src="${pageContext.request.contextPath}/resources/experts/img/sal.jpg" style="width: 100px;height:100px;">
				            </a>
				            <div class="media-body">
				                <h4 class="media-heading">Sous Visal <small> Cambodia</small></h4>
				                <h6>Software Developer at <a href="http://kshrd.com.kh/jsp/index.hrd">KSHRD</a></h6>
				                <hr style="margin:8px auto">
				                <span class="label label-default">Web Dev</span>
				                <span class="label label-info">Spring</span>
				                <span class="label label-default">Android</span>
				            </div>
				        </div>
				    </div>	
				    <div class="col-lg-6">
				        <div class="media">
				            <a class="pull-left" href="#">
				                <img class="media-object dp img-circle" src="${pageContext.request.contextPath}/resources/experts/img/tey.jpg" style="width: 100px;height:100px;">
				            </a>
				            <div class="media-body">
				                <h4 class="media-heading">Khem Sovatey <small> Cambodia</small></h4>
				                <h6>Software Developer at <a href="http://kshrd.com.kh/jsp/index.hrd">KSHRD</a></h6>
				                <hr style="margin:8px auto">
				               <span class="label label-default">Web Dev</span>
				                <span class="label label-info">Spring</span>
				                <span class="label label-default">Android</span>
				            </div>
				        </div>
				    </div>	
				    				    <div class="col-lg-6">
				        <div class="media">
				            <a class="pull-left" href="#">
				                <img class="media-object dp img-circle" src="${pageContext.request.contextPath}/resources/experts/img/ly.jpg" style="width: 100px;height:100px;">
				            </a>
				            <div class="media-body">
				                <h4 class="media-heading">Torn Sokly <small> Cambodia</small></h4>
				                <h6>Software Developer at <a href="http://kshrd.com.kh/jsp/index.hrd">KSHRD</a></h6>
				                <hr style="margin:8px auto">
				                <span class="label label-default">Web Dev</span>
				                <span class="label label-info">Spring</span>
				                <span class="label label-default">Android</span>
				            </div>
				        </div>
				    </div>	
				    <div class="col-lg-6">
				        <div class="media">
				            <a class="pull-left" href="#">
				                <img class="media-object dp img-circle" src="${pageContext.request.contextPath}/resources/experts/img/ra.jpg" style="width: 100px;height:100px;">
				            </a>
				            <div class="media-body">
				                <h4 class="media-heading">Srun Vanara <small> Cambodia</small></h4>
				                <h6>Software Developer at <a href="http://kshrd.com.kh/jsp/index.hrd">KSHRD</a></h6>
				                <hr style="margin:8px auto">
				               <span class="label label-default">Web Dev</span>
				                <span class="label label-info">Spring</span>
				                <span class="label label-default">Android</span>
				            </div>
				        </div>
				    </div>	
				    				    <div class="col-lg-6">
				        <div class="media">
				            <a class="pull-left" href="#">
				                <img class="media-object dp img-circle" src="${pageContext.request.contextPath}/resources/experts/img/nang.jpg" style="width: 100px;height:100px;">
				            </a>
				            <div class="media-body">
				                <h4 class="media-heading">Heng Samnang <small> Cambodia</small></h4>
				                <h6>Software Developer at <a href="http://kshrd.com.kh/jsp/index.hrd">KSHRD</a></h6>
				                <hr style="margin:8px auto">
				               <span class="label label-default">Web Dev</span>
				                <span class="label label-info">Spring</span>
				                <span class="label label-default">Android</span>
				            </div>
				        </div>
				    </div>			
				</div>
			</div>
		</div>
		</div>
		</div>
	</div>
    <br>
  <jsp:include page="expert/fragements/footer/footer.jsp"></jsp:include>

</body>
</html>