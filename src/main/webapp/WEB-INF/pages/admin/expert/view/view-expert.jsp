
<!DOCTYPE html>
<html ng-app="expertApplication" ng-controller="expertController">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Expert DB - Admin | User</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!--[*my CSS*] for general uses for only detail page-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/expert/css/detail.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/experts/css/detail.css"
	rel="stylesheet" type="text/css">


<style>
.modal-lg {
	width: 1200px;
	height: 900px; /* control height here */
}

.onoffswitch4 {
	position: relative;
	width: 90px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.onoffswitch4-label {
	display: block;
	overflow: hidden;
	cursor: pointer;
	border: 2px solid #27A1CA;
	border-radius: 0px;
}

.onoffswitch4-checkbox {
	display: none;
}

.onoffswitch4-inner {
	display: block;
	width: 200%;
	margin-left: -100%;
	-moz-transition: margin 0.3s ease-in 0s;
	-webkit-transition: margin 0.3s ease-in 0s;
	-o-transition: margin 0.3s ease-in 0s;
	transition: margin 0.3s ease-in 0s;
}

.onoffswitch4-switch {
	display: block;
	width: 25px;
	margin: 0px;
	background: #27A1CA;
	position: absolute;
	top: 0;
	bottom: 0;
	right: 65px;
	-moz-transition: all 0.3s ease-in 0s;
	-webkit-transition: all 0.3s ease-in 0s;
	-o-transition: all 0.3s ease-in 0s;
	transition: all 0.3s ease-in 0s;
}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini"
	ng-init="getDataOfExperts()">
	<div class="wrapper">

		<!-- Include Main Header -->
		<jsp:include page="../../fragements/main-header.jsp"></jsp:include>
		<!-- Include Main Header -->

		<!-- Left side column. contains the logo and sidebar -->

		<!-- Include main Sidebar -->
		<jsp:include page="../../fragements/main-sider.jsp"></jsp:include>
		<!-- Include main Sidebar -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>View Expert</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Tables</a></li>
					<li class="active">Data tables</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<div class="box">
									<div class="box-header"></div>
									<!-- /.box-header -->
									<div class="box-body">
										<table class="table table-striped table-bordered table-list">
											<thead>
												<tr>
													<th class="hidden-xs">No.</th>
													<th>Name</th>
													<th>Gender</th>
													<th>Current Address</th>
													<th>Phone</th>
													<th>Generation</th>
													<th>Status</th>
													<th><em class="fa fa-cog"></em> Action</th>
												</tr>
											</thead>
											<tbody>
												<tr ng-repeat="expt in expertObject">
													<td>{{$index+1}}</td>
													<td>{{expt.EXPERT_FIRST_NAME}}
														{{expt.EXPERT_LAST_NAME}}</td>
													<td>{{expt.EXPERT_GENDER}}</td>
													<td>{{expt.EXPERT_CURRENT_ADDRESS.CITY_OR_PROVINCE_NAME}}</td>
													<td>{{expt.EXPERT_PHONE1}}</td>
													<td>{{expt.EXPERT_GENDERATION}}</td>
													<td>{{expt.EXPERT_STATUS}}</td>
													<td align="center"><a class="btn btn-default"
														ng-click="getUpdateSkill(expt.EXPERT_ID)"
														data-toggle="modal" data-target="#addSkill"><em
															class="fa fa-pencil"></em></a> <a class="btn btn-danger"
														ng-click="getDataDetail(expt.EXPERT_ID)"
														data-toggle="modal" data-target="#viewExpert"><em
															class="fa fa-eye"></em></a></td>


												</tr>
											</tbody>
										</table>
										<div id="EXPERT_PAGIN"></div>
									</div>
									<!-- /.box-body -->
								</div>
								<!-- /.box -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<div class="modal fade " tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel" aria-hidden="true"
			id="viewExpert">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!--Personal Information-->
					<div class="row row1">
						<div class="profile-option">
							<center>
								<h2 class="small-heading">
									<span class="fa fa-arrow-circle-right"></span> PERSONAL DATA
								</h2>
							</center>
						</div>
						<div class="col-md-4 col-xs-12">
							<!--<label class="tag label label-primary">Photo Profile</label>-->
							<div id="border-profile" style="top:">
								<center>
									<img style="margin-top: 10px" id="profile"
										src="{{expertDetail.EXPERT_PHOTO}}"
										class="img-responsive img-circle">
									<p
										style="margin-top: 30px; font-family: 'Arial'; font-size: 22px; font-weight: 500; text-shadow: -1px 1px 1px #999">
										{{expertDetail.EXPERT_FIRST_NAME + " " +
										expertDetail.EXPERT_LAST_NAME}}</p>
								</center>
							</div>
						</div>
						<div class="col-md-8 col-xs-12">
							<div id="border-profile">
								<!--<label class="tag label label-primary">Personal Profile</label>-->
								<div
									style="border: 1px solid lightgray; padding: 10px; box-shadow: -5px 5px 10px grey; background-color: #ecf0f1;">
									<table class="table">
										<tr style="border: none; border-bottom: 1px solid lightgray">
											<th style="width: 130px; border: none">Gender</th>
											<th style="width: 10px; border: none">:</th>
											<td style="border: none">{{expertDetail.EXPERT_GENDER}}</td>
										</tr>

										<tr style="border: none; border-bottom: 1px solid lightgray">
											<th style="border: none">Date of Birth</th>
											<th style="border: none">:</th>
											<td style="border: none">{{expertDetail.DOB}}</td>
										</tr>

										<tr style="border: none; border-bottom: 1px solid lightgray">
											<th style="border: none">Place of Birth</th>
											<th style="border: none">:</th>
											<td style="border: none">{{expertDetail.PLACE_OF_BIRTH.COMMUNE_NAME}}
												{{expertDetail.PLACE_OF_BIRTH.DISTRICT_NAME}}
												{{expertDetail.PLACE_OF_BIRTH .CITY_OR_PROVINCE_NAME}}
												{{expertDetail.PLACE_OF_BIRTH.COUNTRY_NAME}}</td>
										</tr>

										<tr style="border: none; border-bottom: 1px solid lightgray">
											<th style="border: none">Current Address</th>
											<th style="border: none">:</th>
											<td style="border: none">{{expertDetail.EXPERT_CURRENT_ADDRESS.COMMUNE_NAME}}
												{{expertDetail.EXPERT_CURRENT_ADDRESS.DISTRICT_NAME}}
												{{expertDetail.EXPERT_CURRENT_ADDRESS.CITY_OR_PROVINCE_NAME}}
												{{expertDetail.EXPERT_CURRENT_ADDRESS.COUNTRY_NAME}}</td>
										</tr>

										<tr style="border: none; border-bottom: 1px solid lightgray">
											<th style="border: none">Email</th>
											<th style="border: none">:</th>
											<td style="border: none">{{expertDetail.EXPERT_EMAIL}}</td>
										</tr>

										<tr style="border: none; border-bottom: 1px solid lightgray">
											<th style="border: none">Phone</th>
											<th style="border: none">:</th>
											<td style="border: none">{{expertDetail.EXPERT_PHONE1}}</td>
										</tr>

										<tr style="border: none; border-bottom: 1px solid lightgray">
											<th style="border: none">Generation</th>
											<th style="border: none">:</th>
											<td style="border: none">{{expertDetail.EXPERT_GENDERATION}}</td>
										</tr>

										<tr style="border: none; border-bottom: 1px solid lightgray">
											<th style="border: none">Advance Subject</th>
											<th style="border: none">:</th>
											<td style="border: none">{{expertDetail.EXPERT_ADVANCE_COURSE}}</td>
										</tr>
									</table>
								</div>
							</div>
						</div>


					</div>
					<!--end personal data-->
				</div>
				<!--end row personal data by visal-->

				<hr>

				<!-- start education and experience scope -->
				<div>



					<!-- Panel -->
					<div class="panel with-nav-tabs panel-default">
						<div class="panel-heading">
							<ul class="nav nav-tabs">
								<li style="font-family: 'Arial'" class="active"><a
									href="#edu" data-toggle="tab">Education</a></li>
								<li style="font-family: 'Arial'"><a href="#exp"
									data-toggle="tab">Experience</a></li>
								<li style="font-family: 'Arial'"><a href="#currentJob"
									data-toggle="tab">Current Job</a></li>
								<li style="font-family: 'Arial'"><a href="#skill"
									data-toggle="tab">Skill(s)</a></li>
								<li style="font-family: 'Arial'"><a href="#lang"
									data-toggle="tab">Language(s)</a></li>
								<li style="font-family: 'Arial'"><a href="#jobExpectation"
									data-toggle="tab">Job Expectation</a></li>
								<li style="font-family: 'Arial'"><a href="#projectDemo"
									data-toggle="tab">Project Demo</a></li>
								<li style="font-family: 'Arial'"><a href="#document"
									data-toggle="tab">Document</a></li>
							</ul>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane fade in active" id="edu">
									<table id="edu-container"
										class="education-container col-md-12 col-xs-12"
										style="margin-bottom: 0px">
										<tr ng-repeat="ed in expertDetail.EDUCATIONS">
											<td>
												<div id="{{ed.id}}"
													style="padding: 0; margin: 10px; border-radius: 0px;">
													<form class="fm">
														<fieldset class="fs">
															<legend class="lg">{{ed.UNIVERSITY_NAME}}</legend>
															<p style="font-size: 18px; font-family: 'Calibri'">
																<i>Period</i>: {{ed.EDUCATION_START_YEAR}} To
																{{ed.EDUCATION_END_YEAR}} <br> <i>Major</i>:
																{{ed.MAJOR_NAME}}
															</p>
														</fieldset>
													</form>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="exp">
									<table id="edu-container"
										class="education-container col-md-12 col-xs-12"
										style="margin-bottom: 0px">

										<tr ng-repeat="ex in expertDetail.EXPERT_EXPERIENCES">
											<td>
												<div id="{{ex.EXPERT_ID}}">
													<form class="fm">
														<fieldset class="fs">
															<legend class="lg">{{ex.INSTITUTION_NAME}}</legend>
															<!-- Not Yet  -->
															<p style="font-size: 18px; font-family: 'Calibri'">
																<!-- 												Institution Phone: {{ex.contactPhone}} <br> Institution
												Email: {{ex.email}} <br> <br>
 -->
																Period: {{ex.PERIOD}} Year <br> Used To Be:
																{{ex.POSITION_NAME}}
															</p>
														</fieldset>
													</form>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="currentJob">
									<table id="edu-container"
										class="education-container col-md-12 col-xs-12"
										style="margin-bottom: 0px">

										<tr ng-repeat="cj in expertDetail.EXPERT_CURRENT_JOBS">
											<td>
												<div id="{{cj.id}}">
													<form class="fm">
														<fieldset class="fs">
															<legend class="lg">{{cj.INSTITUTIOIN_NAME}}</legend>
															<p style="font-size: 18px; font-family: 'Calibri'">
																<i>Institution Phone</i>: {{cj.INSTITUTION_PHONE}} <br>
																<i>Institution Email</i>: {{cj.INSTITUTION_EMAIL}} <br>
																<br> <i>Position</i>: {{cj.POSITION_NAME}} <br>
																<i>Salary</i>: {{cj.SALARY | currency }}
															</p>
														</fieldset>
													</form>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="skill">
									<div class="row">
										<div
											class="col-md-6 col-sm-6 col-xs-12 list-category text-primary"
											ng-repeat="(key,value) in expertDetail.SUBJECTS | groupBy: 'SUBJECT_CATEGORY_NAME'">
											<h3 class="title text-center"
												style="background-color: #008080; color: #fff; border-radius: 5px;">
												{{key}}</h3>
											<div id="" style="overflow-y: scroll; height: 200px;">
												<div class="list-group">
													<a href="" class="list-group-item"
														ng-repeat="subject in value">
														<div class="truncate pull-left">{{subject.SUBJECT_NAME}}</div>
														<span class="badge">{{subject.EXPERT_SUBJECT_DETAIL_LEVEL}}</span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="lang">
									<table class="col-md-12 col-xs-12">

										<tr ng-repeat="eLang in expertDetail.LANGUAGES">
											<td id="{{eLang.LANGUAGE_ID}}"><span class="alignleft"
												style="font-family: 'Arial'; font-weight: 600">{{eLang.LANGUAGE_NAME}}</span>



												<div style="clear: both;"></div>
												<div class="progress">
													<div class="progress-bar progress-bar-info"
														role="progressbar" style="width: 25%">{{eLang.MENTION}}</div>
													<div class="progress-bar progress-bar-danger"
														role="progressbar" style="width: {{eLang.LEVEL_NUMBER}}%"></div>
												</div></td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="jobExpectation">
									<table>
										<tr ng-repeat="jp in expertDetail.EXPERT_JOB_EXPECTATIONS">
											<td style="border-bottom: 1px solid #999; padding: 10px">
												<p style="font-size: 18px; font-family: 'Calibri'">
													Option {{$index+1}} <br> Position:
													{{jp.POSITION_NAME}} <br> Salary Range:
													{{jp.MIN_SALARY | currency}} - {{jp.MAX_SALARY | currency}}
													<br> Location: {{jp.LOCATION}}
												</p>
											</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="projectDemo">
									<object data="{{expertDetail.PROJECT_LINK_DEMO}}" width="1024"
										height="600"></object>
								</div>
								<div class="tab-pane fade" id="document">
									<a href="http://localhost:3333/{{}}"></a>
								</div>
							</div>
						</div>
					</div>
					<!-- Panel -->
				</div>
			</div>
		</div>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Tab panes -->

			<!-- Include control sidebar -->
			<jsp:include page="../../fragements/control-sidebar.jsp"></jsp:include>
			<!-- Include control sidebar -->

		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.0 -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/dist/js/demo.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/admin/angularJS/jquery.bootpage.min.js"></script>

	<!-- page script -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/angularJS/jquery.bootpage.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular-filter/0.5.11/angular-filter.js"></script>

</body>
</html>
