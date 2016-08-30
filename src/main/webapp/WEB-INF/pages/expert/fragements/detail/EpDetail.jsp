<!--[*my CSS*] for general uses for only detail page-->
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/expert/css/detail.css" />
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/experts/css/detail.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-filter/0.5.11/angular-filter.js"></script>
<script	src="${pageContext.request.contextPath}/resources/experts/js/index.js"></script>
<div ​​​​ ng-app="expertFrontEndApp">
	<!--start row personal data by visal-->
	<div class="container" ng-controller="expertController"
		ng-init="getDataDetail(<%=request.getParameter("id")%>)">
		<div>

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
					                <div class="col-md-6 col-sm-6 col-xs-12 list-category text-primary" ng-repeat="(key,value) in expertDetail.SUBJECTS | groupBy: 'SUBJECT_CATEGORY_NAME'">
					                  <h3 class="title text-center" style="background-color: #008080;color:#fff;border-radius: 5px;"> {{key}} </h3>
					                  <div id="" style="overflow-y:scroll; height:200px;">
					                  <div class="list-group">
							  			<a  href="" class="list-group-item" ng-repeat="subject in value">
											<div class="truncate pull-left">{{subject.SUBJECT_NAME}}</div><span class="badge">{{subject.EXPERT_SUBJECT_DETAIL_LEVEL}}</span>
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
												role="progressbar" style="width: {{eLang.LEVEL_NUMBER}}%; background-color: #999"></div>
										</div></td>
								</tr>
							</table>
						</div>
						<div class="tab-pane fade" id="jobExpectation">
							<table>
								<tr ng-repeat="jp in expertDetail.EXPERT_JOB_EXPECTATIONS">
									<td style="border-bottom: 1px solid #999; padding: 10px">
										<p style="font-size: 18px; font-family: 'Calibri'">
											Option {{$index+1}} <br> Position: {{jp.POSITION_NAME}}
											<br> Salary Range: {{jp.MIN_SALARY | currency}} -
											{{jp.MAX_SALARY | currency}} <br> Location:
											{{jp.LOCATION}}
										</p>
									</td>
								</tr>
							</table>
						</div>
						<div class="tab-pane fade" id="projectDemo">
							<object data="{{expertDetail.PROJECT_LINK_DEMO}}"
								width="1024" height="600"></object>
						</div>
					</div>
				</div>
			</div>
			<!-- Panel -->
		</div>
	</div>

</div>