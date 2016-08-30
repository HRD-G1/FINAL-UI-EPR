<!DOCTYPE html>
<html ng-app="expertApplication" ng-controller="expertController">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Data Tables</title>
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
<!--[if lt IE 9]> -->
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/datepicker/datepicker3.css">
<!-- <![endif] -->

<style type="text/css">
.container {
	margin-top: 20px;
}

.image-preview-input {
	position: relative;
	overflow: hidden;
	margin: 0px;
	color: #333;
	background-color: #fff;
	border-color: #ccc;
}

.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.image-preview-input-title {
	margin-left: 2px;
}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Include Main Header -->
		<jsp:include page="../../fragements/main-header.jsp"></jsp:include>
		<!-- Include Main Header -->

		<!-- Left side column. contains the logo and sidebar -->

		<!-- Include Main Sider -->
		<jsp:include page="../../fragements/main-sider.jsp"></jsp:include>
		<!-- Include Main Sider -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Add User<small>Expert DB User</small>
				</h1>
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
						<!-- add User -->
						<!-- First Name and Last Name -->
						<div class="row">
							<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="FirstName">First Name</label> <input type="text"
										class="form-control" id="FirstName" placeholder="FirstName"
										ng-model="firstName">
								</div>
							</div>
							<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="LastName">Last Name</label> <input type="text"
										class="form-control" id="LastName" placeholder="lastName"
										ng-model="lastName">
								</div>
							</div>
						</div>
						<!-- First Name and Last Name -->

						<!-- Gender and Photo -->
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label for="gender">Gender</label> <select ng-model="gender"
										class="form-control" id="gedner">
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<!-- image-preview-filename input [CUT FROM HERE]-->
								<label for="photo">Photo</label>
								<div class="input-group image-preview">

									<input type="text" class="form-control image-preview-filename"
										disabled="disabled">
									<!-- don't give a name === doesn't send on POST/GET -->
									<span class="input-group-btn"> <!-- image-preview-clear button -->
										<button type="button"
											class="btn btn-default image-preview-clear"
											style="display: none;">
											<span class="glyphicon glyphicon-remove"></span> Clear
										</button> <!-- image-preview-input -->
										<div class="btn btn-default image-preview-input">
											<span class="glyphicon glyphicon-folder-open"></span> <span
												class="image-preview-input-title">Browse</span> <input
												id="image" type="file" file-model="photoUpload"
												accept="image/png, image/jpeg, image/gif" name="image" />
											<!-- rename it -->
										</div>
									</span>
								</div>
								<!-- /input-group image-preview [TO HERE]-->

							</div>
						</div>
						<!-- Gender and Photo -->

						<!-- Phone -->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="gender">Phone Line 1</label> <input
										ng-model="phone1" type="text" class="form-control" id="phone1"
										placeholder="phone1">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="gender">Phone Line 2 <small>Optional</small></label>
									<input type="text" class="form-control" id="phone2"
										ng-model="phone2" placeholder="phone2">
								</div>
							</div>
						</div>
						<!-- Phone -->

						<!-- Place of Birth -->
						<div class="col-md-12">
							<label for="gender">Place of Birth</label>
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="gender">Country</label>
							<div class="form-group input-group">
								<select class="form-control" id="gedner" ng-model="countryID"
									ng-change="getDataOfProvinceOrCityByCountryID(countryID)"
									ng-options="cn.COUNTRY_ID as cn.COUNTRY_NAME for cn in countryObject">
								</select> <span class="input-group-btn">
									<button type="button" class="btn btn-default btn-add"
										data-toggle="modal" data-target="#addCountry"
										ng-click="whenInsert()">+</button>
								</span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="gender">Province or City</label>
							<div class="form-group input-group">
								<select class="form-control" id="gedner"
									ng-model="cityOrProvinceID"
									ng-change="getDataOfDistrictByProvinceID(cityOrProvinceID)"
									ng-options="pv.CITY_OR_PROVINCE_ID as pv.CITY_OR_PROVINCE_NAME for pv in provinceOrCityByCountryID">
								</select> <span class="input-group-btn"><button type="button"
										class="btn btn-default btn-add" data-toggle="modal"
										data-target="#addProvince" ng-click="whenInsert()">+</button></span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="gender">District</label>
							<div class="form-group input-group">
								<select class="form-control" id="gedner" ng-model="districtID"
									ng-change="getDataOfCommuneByDistrictID(districtID)"
									ng-options="ds.DISTRICT_ID as ds.DISTRICT_NAME for ds in provinceByCountryID">
								</select> <span class="input-group-btn"><button type="button"
										class="btn btn-default btn-add" data-toggle="modal"
										data-target="#addDistrict" ng-click="whenInsert()">+</button></span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="gender">Commune</label>
							<div class="form-group input-group">
								<select name="country" class="form-control"
									ng-model="objectCommuneOfPlaceOfBirth"
									ng-options="cm.COMMUNE_NAME for cm in communeObjectByDistrictID">
								</select> <span class="input-group-btn"><button type="button"
										class="btn btn-default btn-add" data-toggle="modal"
										data-target="#addCommune" ng-click="whenInsert()">+</button></span>
							</div>
						</div>

						<!-- Place of Birth -->

						<!-- Current Address -->
						<div class="col-md-12">
							<label for="gender">Current Address</label>
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="gender">Country</label>
							<div class="form-group input-group">
								<select class="form-control" id="gedner"
									ng-model="countryIDOfCurrentAddress"
									ng-change="getDataOfProvinceOrCityByCountryIDOfCurrentAddress(countryIDOfCurrentAddress)"
									ng-options="cn.COUNTRY_ID as cn.COUNTRY_NAME for cn in countryObject">
								</select> <span class="input-group-btn"><button type="button"
										class="btn btn-default btn-add"
										class="btn btn-default btn-add" data-toggle="modal"
										data-target="#addCountry" ng-click="whenInsert()">+</button> </span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="gender">Province or City</label>
							<div class="form-group input-group">
								<select class="form-control" id="gedner"
									ng-model="cityOrProvinceIDOfCurrentAddress"
									ng-change="getDataOfDistrictByProvinceIDOfCurrentAddress(cityOrProvinceIDOfCurrentAddress)"
									ng-options="pv.CITY_OR_PROVINCE_ID as pv.CITY_OR_PROVINCE_NAME for pv in provinceOrCityByCountryIDOfCurrentAddress">
								</select> <span class="input-group-btn"><button type="button"
										class="btn btn-default btn-add" data-toggle="modal"
										data-target="#addProvince" ng-click="whenInsert()">+</button></span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="gender">District</label>
							<div class="form-group input-group">
								<select class="form-control" id="gedner"
									ng-model="districtIDOfCurrentAddress"
									ng-change="getDataOfCommuneByDistrictIDOfCurrentAddress(districtIDOfCurrentAddress)"
									ng-options="ds.DISTRICT_ID as ds.DISTRICT_NAME for ds in provinceByCountryIDOfCurrentAddress">
								</select> <span class="input-group-btn"><button type="button"
										class="btn btn-default btn-add" data-toggle="modal"
										data-target="#addDistrict" ng-click="whenInsert()">+</button></span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="gender">Communce</label>
							<div class="form-group input-group">
								<select name="country" class="form-control"
									ng-model="objectCommuneOfCurrentAddress"
									ng-options="cm.COMMUNE_NAME for cm in communeObjectByDistrictIDOfCurrentAddress">
								</select> <span class="input-group-btn"><button type="button"
										class="btn btn-default btn-add" data-toggle="modal"
										data-target="#addCommune" ng-click="whenInsert()">+</button></span>
							</div>
						</div>
						<!-- Current Address -->

						<!-- Email -->
						<div class="form-group">
							<label for="address">Email</label> <input type="email"
								ng-model="email" class="form-control" id="Email"
								placeholder="Email">
						</div>
						<!-- Email -->

						<!-- Generation and Advance Course -->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="address">Generation</label> <input type=number
										ng-model="generation" class="form-control" id="Generation"
										placeholder="Generation">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="address">Advance Course</label> <input type="text"
										class="form-control" id="AdvanceCourse"
										ng-model="advanceCourse" placeholder="Advance Course">
								</div>
							</div>
						</div>
						<!-- Generation and Advance Course -->
						<!-- Project Link Demo and Date of birth -->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="address">Project Link Demo</label> <input type=text
										ng-model="projectLinkDemo" class="form-control"
										id="projectLinkDemo" placeholder="URL of Your Project">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="address">Date Of Birth</label> <input
										id="dateOfBirth" type="text" class="form-control"
										id="dateOfBirth" ng-model="dateOfBirth"
										placeholder="1999-02-28">
								</div>
							</div>
						</div>
						<!-- Project Link Demo and Date of birth -->

						<hr>

						<!-- Education -->
						<div class="row"
							style="background-color: #FFF; padding: 10px; margin: 10px">
							<div ng-repeat="edu in eduOfExpert">
								<div class="education">
									<div class="col-md-12">
										<h3>
											<span style="color: #e74c3c; cursor: pointer;"
												id="removeLanguage" class="fa fa-trash-o"></span> Education
										</h3>
									</div>
									<div class="col-md-6">
										<label for="gender">University</label>
										<div class="form-group input-group">
											<select name="University" class="form-control"
												ng-model="eduOfExpert[$index].UNIVERSITY_ID"
												ng-options="un.UNIVERSITY_ID as un.UNIVERSITY_NAME for un in universityObject">

											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addUniversity" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-6">
										<label for="gender">Major</label>
										<div class="form-group input-group">
											<select name="Major" class="form-control"
												ng-model="eduOfExpert[$index].MAJOR_ID"
												ng-options="ma.MAJOR_ID as ma.MAJOR_NAME for ma in majorObject">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addMajor" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="dob">Start Date</label> <input id="eduStartDate"
												type="text"
												ng-model="eduOfExpert[$index].EDUCATION_START_YEAR"
												class="form-control" placeholder="Start Date">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="dob">End Date</label> <input type="text"
												ng-model="eduOfExpert[$index].EDUCATION_END_YEAR"
												class="form-control" placeholder="End Date">
										</div>

									</div>
									<div class="col-md-6">Your Option {{$index+1}}</div>
								</div>
							</div>
							<div id="placeToAddEducationPattern" class="col-md-12 text-right">
								<div class="btn-group">
									<button type="button" id="moreEducation"
										class="btn btn-primary fa fa-plus-circle"
										ng-click="addTempEduOfExpert()">More Education</button>
								</div>
							</div>
						</div>
						<!-- Education -->

						<hr>

						<!-- Experience  -->
						<div class="row"
							style="background-color: #FFF; padding: 10px; margin: 10px">
							<div ng-repeat="exp in expOfExpert">
								<div class="experience">
									<div class="col-md-12">
										<h3>
											<span style="color: #e74c3c; cursor: pointer;"
												id="removeLanguage" class="fa fa-trash-o"></span> Experience
										</h3>
									</div>
									<div class="col-md-6">
										<label for="gender">Institution</label>
										<div class="form-group input-group">
											<select name="Institution" class="form-control"
												ng-model="expOfExpert[$index].INSTITUTION_ID"
												ng-options="ins.INSTITUTION_ID as ins.INSTITUTION_NAME for ins in institutionObject">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addInstitution" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-6">
										<label for="gender">Position</label>
										<div class="form-group input-group">
											<select name="Major" class="form-control"
												ng-model="expOfExpert[$index].POSITION_ID"
												ng-options="pos.POSITION_ID as pos.POSITION_NAME for pos in positionObject">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addMajor" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="period">Period</label> <input type="text"
												ng-model="expOfExpert[$index].PERIOD" class="form-control"
												id="period" placeholder="Example: 2 Years">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="projectExp">Project Experience</label> <input
												type="text" class="form-control" id="projectExp"
												ng-model="expOfExpert[$index].PROJECT_EXPERIENCE"
												placeholder="Name project that you used to do">
										</div>
									</div>
								</div>
							</div>
							<div id="placeToAddExperiencePattern"
								class="col-md-12 text-right">
								<div class="btn-group">
									<button type="button" id="moreExperience"
										class="btn btn-primary fa fa-plus-circle"
										ng-click="addTempExpOfExpert()">More Experience</button>
								</div>

							</div>
							<div class="col-md-12">Your Option {{$index+1}}</div>
						</div>
						<!-- Experience -->

						<hr>

						<!-- Current Job  -->
						<div class="row"
							style="background-color: #FFF; padding: 10px; margin: 10px">
							<div ng-repeat="cur in currentJobOfExpert">
								<div class="currentJob">
									<div class="col-md-12">
										<h3>
											<span style="color: #e74c3c; cursor: pointer;"
												id="removeLanguage" class="fa fa-trash-o"></span> Current
											Job
										</h3>
									</div>
									<div class="col-md-6">
										<label for="gender">Institution</label>
										<div class="form-group input-group">
											<select name="Institution" class="form-control"
												ng-model="currentJobOfExpert[$index].INSTITUTION_ID"
												ng-options="ins.INSTITUTION_ID as ins.INSTITUTION_NAME for ins in institutionObject">

											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addInstitution" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<label for="gender">Position</label>
										<div class="form-group input-group">
											<select name="Position" class="form-control"
												ng-model="currentJobOfExpert[$index].POSITION_ID"
												ng-options="pos.POSITION_ID as pos.POSITION_NAME for pos in positionObject">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addPosition" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-3  col-sm-6">
										<div class="form-group">
											<label for="address">Salary</label> <input type="number"
												ng-model="currentJobOfExpert[$index].SALARY"
												class="form-control" id="Salary" placeholder="Salary">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="address">Institution Phone Contact</label> <input
												type="text" class="form-control" id="inst-phone"
												ng-model="currentJobOfExpert[$index].INSTITUTION_PHONE"
												placeholder="Contact Phone">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="address">Institution Email <small>Optional</small></label>
											<input type="email" class="form-control" id="ints-email"
												ng-model="currentJobOfExpert[$index].INSTITUTION_EMAIL"
												placeholder="Emial">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="address">Institution Address <small>Optional</small></label>
											<input type="text" class="form-control" id="ints-address"
												ng-model="currentJobOfExpert[$index].INSTITUTION_ADDRESS"
												placeholder="address">
										</div>
									</div>
									<div class="col-md-6">Current Job {{$index+1}}</div>
								</div>
							</div>
							<div id="placeToAddExperiencePattern"
								class="col-md-12 text-right">
								<div class="btn-group">
									<button type="button" id="moreCurrentJob"
										class="btn btn-primary fa fa-plus-circle"
										ng-click="addTempCurrentJobOfExpert()">More Current
										Job</button>
								</div>
							</div>

						</div>
						<!-- Current Job -->

						<hr>

						<!-- Language -->
						<div class="row"
							style="background-color: #FFF; padding: 10px; margin: 10px">
							<div ng-repeat="lang in langOfExpert">
								<div class="language">
									<div class="col-md-12 col-sm-6">
										<h3>
											<span style="color: #e74c3c; cursor: pointer;"
												id="removeLanguage" class="fa fa-trash-o"></span> Language
										</h3>
									</div>
									<div class="col-md-6">
										<label for="gender">Language</label>
										<div class="form-group input-group">
											<select name="Institution" class="form-control"
												ng-model="langOfExpert[$index].LANGUAGE_ID"
												ng-options="lang.LANGUAGE_ID as lang.LANGUAGE_NAME for lang in languageObject">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addLanguage" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-6 col-sm-6">
										<div class="form-group">
											<label for="level">Mention of This Langauage</label> <select
												class="form-control" id="level"
												ng-model="langOfExpert[$index].MENTION">
												<option value="Low">Low</option>
												<option value="Medium">Medium</option>
												<option value="High">High</option>
											</select>
										</div>
									</div>

									<div class="col-md-12">Language {{$index+1}}</div>
								</div>
							</div>
							<div id="placeToAddExperiencePattern"
								class="col-md-12 text-right">
								<div class="btn-group">
									<button type="button" id="moreLanguage"
										class="btn btn-primary fa fa-plus-circle"
										ng-click="addTempLanguageOfExpert()">More Language</button>
								</div>
							</div>
						</div>
						<!-- Language -->

						<hr>

						<!-- Job Expectation -->
						<div class="row"
							style="background-color: #FFF; padding: 10px; margin: 10px">
							<div ng-repeat="joe in jobExpectationOfExpert">
								<div class="JobExpectation">
									<div class="col-md-12 col-sm-6">
										<h3>
											<span style="color: #e74c3c; cursor: pointer;"
												id="removeLanguage" class="fa fa-trash-o"></span> Job
											Expectation
										</h3>
									</div>
									<div class="col-md-6">
										<label for="jobExpectation">Position</label>
										<div class="form-group input-group">
											<select name="Institution" class="form-control"
												ng-model="jobExpectationOfExpert[$index].POSITION_ID"
												ng-options="pos.POSITION_ID as pos.POSITION_NAME for pos in positionObject">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addLanguage" ng-click="whenInsert()">+</button></span>
										</div>
									</div>

									<div class="col-md-6 col-sm-6">
										<div class="form-group">
											<label for="address">Minimum Salary</label> <input
												type=number
												ng-model="jobExpectationOfExpert[$index].MIN_SALARY"
												class="form-control" id="position"
												placeholder="Minimun Salary">
										</div>
									</div>
									<div class="col-md-6 col-sm-6">
										<div class="form-group">
											<label for="address">Location</label> <input type="text"
											ng-model="jobExpectationOfExpert[$index].LOCATION"
												class="form-control" id="Location"
												placeholder="A Place You Wish to Work...">
										</div>
									</div>
									<div class="col-md-6 col-sm-6">
										<div class="form-group">
											<label for="address">Maximum Salary</label> <input
												type=number
												ng-model="jobExpectationOfExpert[$index].MAX_SALARY"
												class="form-control" id="position"
												placeholder="Maximun Salary">
										</div>
									</div>
									<div class="col-md-12">Job Expectation {{$index+1}}</div>
								</div>

							</div>
							<div id="placeToAddExperiencePattern"
								class="col-md-12 text-right">
								<div class="btn-group">
									<button type="button" id="moreLanguage"
										class="btn btn-primary fa fa-plus-circle"
										ng-click="addTempjobExpectationOfExpert()">More Job
										Expectation</button>
								</div>
							</div>
						</div>
						<!-- Job Expectation -->

						<hr>

						<!-- Skill -->
						<div class="row"
							style="background-color: #FFF; padding: 10px; margin: 10px">
							<div ng-repeat="se in subjectOfExpert">
								<div class="Skill">
									<div class="col-md-12 col-sm-6">
										<h3>
											<span style="color: #e74c3c; cursor: pointer;"
												id="removeLanguage" class="fa fa-trash-o"></span> Skill
										</h3>
									</div>
									<div class="col-md-4 com-sm-6">
										<label for="gender">Main Skill</label>
										<div class="form-group input-group">
											<select name="Institution" class="form-control"
												ng-change="whenMainSkillchange(mainSkillID)"
												ng-model="mainSkillID"
												ng-options="ms.SUBJECT_CATEOGRY_ID as ms.SUBJECT_CATEGORY_NAME for ms in mainSkillSet">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addMainSkill" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-4 col-sm-6">
										<label for="gender">Skill</label>
										<div class="form-group input-group">
											<select name="level" class="form-control"
												ng-model="subjectOfExpert[$index].SUBJECT_ID"
												ng-options="ss.SUBJECT_ID as ss.SUBJECT_NAME for ss in subSkillObject">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addSkill" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-4 col-sm-6">
										<div class="form-group">
											<label for="level">Level</label> <select class="form-control"
												ng-model="subjectOfExpert[$index].EXPERT_SUBJECT_DETAIL_LEVEL"
												id="level">
												<option value="Low">Low</option>
												<option value="Medium">Medium</option>
												<option value="High">High</option>
											</select>
										</div>
									</div>
									<div class="col-md-12">Subject Of Expert {{$index+1}}</div>
								</div>
							</div>
							<div class="col-md-12 text-right">
								<div class="btn-group">
									<button type="button" id="moreSkill"
										class="btn btn-primary fa fa-plus-circle"
										ng-click="addTempsubjectOfExpertOfExpert()">More
										Skill</button>
								</div>
							</div>
						</div>
						<!-- Skill -->

						<hr>

						<!-- Document -->
						<div class="row"
							style="background-color: #FFF; padding: 10px; margin: 10px">
							<div ng-repeat="fd in fileDocOfExpert">
								<div class="Document">
									<div class="col-md-12 col-sm-6">
										<h3>
											<span style="color: #e74c3c; cursor: pointer;"
												id="removeLanguage" class="fa fa-trash-o"></span> Document
										</h3>
									</div>
									<div class="col-md-4">
										<label for="gender">File Type</label>
										<div class="form-group input-group">
											<select name="fileType" class="form-control"
												ng-model="fileDocOfExpert[$index].FILE_DOCUMENT_ID"
												ng-options="fl.FILE_ID as fl.FILE_NAME for fl in fileType">
											</select> <span class="input-group-btn"><button type="button"
													class="btn btn-default btn-add" data-toggle="modal"
													data-target="#addFileType" ng-click="whenInsert()">+</button></span>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="address">Document Name</label> <input type="text"
											ng-model="fileDocOfExpert[$index].FILE_NAME"
												class="form-control" id="Location"
												placeholder="A Place You Wish to Work...">
										</div>
									</div>
									<div class="col-md-4">
										<label for="gender">File Document</label> <input type="file"
											file-model="fileDocOfExpert[$index].FILE_PATH" id="files">
									</div>
									<div class="col-md-12">Document of Expert {{$index+1}}</div>
								</div>
							</div>

							<div class="col-md-12 text-right">
								<div class="btn-group">
									<button type="button" id="moreSkill"
										class="btn btn-primary fa fa-plus-circle"
										ng-click="addfileDocOfExpertOfExpert()">More</button>
								</div>
							</div>
						</div>
						<!-- Skill -->

						<hr>

						<button type="submit" class="btn btn-primary"
							ng-click="insertExpertAllTheTime()">Add New User to Be
							Expert</button>
						<!-- End Add User -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">

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


	<%-- <script src="${pageContext.request.contextPath}/resources/admin/plugins/jQuery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/plugins/jquery.form.min.js"></script> --%>
	<!-- page script -->

	<script
		src="${pageContext.request.contextPath}/resources/admin/datepicker/bootstrap-datepicker.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/admin/angularJS/jquery.bootpage.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$("#dateOfBirth").datepicker({
								format : "yyyy-mm-dd", // Notice the Extra space at the beginning
							});
							$("#dateOfBirth")
									.change(
											function() {
												angular
														.element(
																document
																		.querySelector('[ng-controller="expertController"]'))
														.scope().dateOfBirth = $(
														this).val();
											})

							$(document).on(
									'click',
									'#close-preview',
									function() {
										$('.image-preview').popover('hide');
										// Hover befor close the preview
										$('.image-preview').hover(
												function() {
													$('.image-preview')
															.popover('show');
												},
												function() {
													$('.image-preview')
															.popover('hide');
												});
									});

							$(function() {
								// Create the close button
								var closebtn = $('<button/>', {
									type : "button",
									text : 'x',
									id : 'close-preview',
									style : 'font-size: initial;',
								});
								closebtn.attr("class", "close pull-right");
								// Set the popover default content
								$('.image-preview').popover(
										{
											trigger : 'manual',
											html : true,
											title : "<strong>Preview</strong>"
													+ $(closebtn)[0].outerHTML,
											content : "There's no image",
											placement : 'bottom'
										});
								// Clear event
								$('.image-preview-clear')
										.click(
												function() {
													$('.image-preview').attr(
															"data-content", "")
															.popover('hide');
													$('.image-preview-filename')
															.val("");
													$('.image-preview-clear')
															.hide();
													$(
															'.image-preview-input input:file')
															.val("");
													$(
															".image-preview-input-title")
															.text("Browse");
												});
								// Create the preview image
								$(".image-preview-input input:file")
										.change(
												function() {
													var img = $('<img/>', {
														id : 'dynamic',
														width : 250,
														height : 200
													});
													var file = this.files[0];
													var reader = new FileReader();
													// Set preview image into the popover data-content
													reader.onload = function(e) {
														$(
																".image-preview-input-title")
																.text("Change");
														$(
																".image-preview-clear")
																.show();
														$(
																".image-preview-filename")
																.val(file.name);
														img
																.attr(
																		'src',
																		e.target.result);
														$(".image-preview")
																.attr(
																		"data-content",
																		$(img)[0].outerHTML)
																.popover("show");
													}
													reader.readAsDataURL(file);
												});
							});

						});
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular-filter/0.5.11/angular-filter.js"></script>

</body>
</html>
