
<!-- All Controll -->
<script
	src="${pageContext.request.contextPath}/resources/admin/angularJS/angular.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/angularJS/expertskill.js"></script>

<!-- Sweet Alert -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/sweetalert/sweetalert.css">
<script
	src="${pageContext.request.contextPath }/resources/admin/plugins/sweetalert/sweetalert-dev.js"></script>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">MAIN NAVIGATION</li>
			<li class="active treeview"><a href="/rest/admin/dashboard">
					<i class="fa fa-dashboard"></i> <span>Dashboard</span>
			</a></li>
			<!-- Expert -->
			<li class="treeview"><a href="#"> <i class="fa fa-users"></i>
					<span>Expert</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="/rest/admin/expert/add"><i class="fa fa-plus"></i>
							Add Expert</a></li>
					<li><a href="/rest/admin/expert/view"><i class="fa fa-eye"></i>
							View Expert</a></li>
				</ul></li>
			<!-- Expert -->

			<!-- Main Skill -->
			<li class="treeview"><a href="#"> <i
					class="fa fa-newspaper-o"></i> <span>Main Skill</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li ng-click="whenInsert()"><a style="cursor: pointer"
						data-toggle="modal" data-target="#addMainSkill"><i
							class="fa fa-plus"></i> Add Main Skill</a></li>
					<li><a href="../../../rest/admin/mainskill/view"><i
							class="fa fa-eye"></i> View Main Skill</a></li>
					<!-- Sub Skill -->
					<li class="treeview"><a href="#"> <i
							class="fa fa-newspaper-o"></i> <span>Sub Skill</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li ng-click="whenInsert()"><a style="cursor: pointer"
								data-toggle="modal" data-target="#addSkill"><i
									class="fa fa-plus"></i> Add Sub Skill</a></li>
							<li><a href="../../../rest/admin/skill/view"><i
									class="fa fa-eye"></i> View Sub Skill</a></li>
						</ul></li>
					<!-- Sub Skill -->
				</ul></li>
			<!-- Main Skill -->

			<!-- Education -->
			<li class="treeview"><a href="#"> <i
					class="fa fa-sticky-note"></i> <span>Education</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<!-- University -->
					<li class="treeview"><a href="#"> <i
							class="fa fa-university"></i> <span>University</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li ng-click="whenInsert()"><a style="cursor: pointer"
								data-toggle="modal" data-target="#addUniversity"><i
									class="fa fa-plus"></i> Add University</a></li>
							<li><a href="../../../rest/admin/university/view"><i
									class="fa fa-eye"></i> View University</a></li>
						</ul></li>
					<!-- University -->
					<!-- Major -->
					<li class="treeview"><a href="#"> <i class="fa fa-circle"></i>
							<span>Major</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li ng-click="whenInsert()"><a style="cursor: pointer"
								data-toggle="modal" data-target="#addMajor"><i
									class="fa fa-plus"></i> Add Major</a></li>
							<li><a href="../../../rest/admin/major/view"><i
									class="fa fa-eye"></i> View Major</a></li>
						</ul></li>
					<!-- Major -->
				</ul></li>
			<!-- Education -->
			<!-- Location -->
			<li class="treeview"><a href="#"> <i class="fa fa-language"></i>
					<span>Language</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li ng-click="whenInsert()"><a style="cursor: pointer"
						data-toggle="modal" data-target="#addLanguage"><i
							class="fa fa-plus"></i> Add Language</a></li>
					<li><a href="../../../rest/admin/language/view"><i
							class="fa fa-eye"></i> View Language</a></li>
				</ul></li>
			<!-- Location -->
			<!-- Language -->
			<li class="treeview"><a href="#"> <i
					class="fa fa-location-arrow"></i> <span>Location</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li class="treeview"><a href="#"> <i
							class="fa fa-dot-circle-o"></i> <span>Country</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a style="cursor: pointer" data-toggle="modal"
								data-target="#addCountry"><i class="fa fa-plus"
									ng-click="whenInsert()"></i> Add Country</a></li>
							<li><a href="../../../rest/admin/country/view"><i
									class="fa fa-eye"></i> View Country</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-dot-circle-o"></i> <span>Province</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li ng-click="whenInsert()"><a style="cursor: pointer"
								data-toggle="modal" data-target="#addProvince"><i
									class="fa fa-plus"></i> Add Province</a></li>
							<li><a href="../../../rest/admin/province/view"><i
									class="fa fa-eye"></i> View Province</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-dot-circle-o"></i> <span>District</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a style="cursor: pointer" data-toggle="modal"
								data-target="#addDistrict"><i class="fa fa-plus"
									ng-click="whenInsert()"></i> Add District</a></li>
							<li><a href="../../../rest/admin/district/view"><i
									class="fa fa-eye"></i> View District</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-dot-circle-o"></i> <span>Commune</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li ng-click="whenInsert()"><a style="cursor: pointer"
								data-toggle="modal" data-target="#addCommune"><i
									class="fa fa-plus"></i> Add Commune</a></li>
							<li><a href="../../../rest/admin/commune/view"><i
									class="fa fa-eye"></i> View Commune</a></li>
						</ul></li>
				</ul></li>
			<!-- language -->
			<!-- File Type -->
			<li class="treeview"><a href="#"> <i class="fa fa-file-text"></i>
					<span>File Type</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li ng-click="whenInsert()"><a style="cursor: pointer"
						data-toggle="modal" data-target="#addFileType"><i
							class="fa fa-plus"></i> Add File Type</a></li>
					<li><a href="../../../../../../rest/admin/filetype/view"><i
							class="fa fa-eye"></i> View File Type</a></li>
				</ul></li>
			<!-- File Type -->
			<!-- Institution -->
			<li class="treeview"><a href="#"> <i
					class="fa fa-university"></i> <span>Institution</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li ng-click="whenInsert()"><a style="cursor: pointer"
						data-toggle="modal" data-target="#addInstitution"><i
							class="fa fa-plus"></i> Add Institution</a></li>
					<li><a href="../../../../../../rest/admin/institution/view"><i
							class="fa fa-eye"></i> View Institution</a></li>
				</ul></li>
			<!-- Institution -->
			<!-- Position -->
			<li class="treeview"><a href="#"> <i
					class="fa fa-get-pocket"></i> <span>Position</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li ng-click="whenInsert()"><a style="cursor: pointer"
						data-toggle="modal" data-target="#addPosition"><i
							class="fa fa-plus"></i> Add Position</a></li>
					<li><a href="../../../../../../rest/admin/position/view"><i
							class="fa fa-eye"></i> View Position</a></li>
				</ul></li>
			<!-- Position -->
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>


<!-- modal -->

<!-- line modal of main skill -->
<div class="modal fade" id="addMainSkill" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">Main Skill</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="MainSkill">Add New Main Skill</label> <input
							type="text" class="form-control" id="mainSkill"
							placeholder="Add New Main Skill" ng-model="mainSkillName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete" role="group" ng-hide="insertBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button" ng-click="updateMainSkill()">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="insertDataOfMainSkill"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertDataOfMainSkill()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- line modal of main skill -->


<!-- line modal of Skill -->
<div class="modal fade" id="addSkill" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">Sub Skill</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="mainSkill">Sub Skill</label> <select
							class="form-control" id="mainSkillValue" ng-model="ms"
							ng-change="changeMainSkillID(ms)"
							ng-options="ms as ms.SUBJECT_CATEGORY_NAME for ms in mainSkillSet">
						</select>
					</div>
					<div class="form-group">
						<label for="country">Add New Sub Skill</label> <input type="text"
							class="form-control" id="country" placeholder="Add New Skill"
							ng-model="subjectName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete" role="group" ng-hide="insertBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button" ng-click="updateSkill()">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="insertDataOfMainSkill"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertDataOfSubSkill()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- line modal of Skill -->

<!-- UNIVERSITY -->
<!-- line modal -->
<div class="modal fade" id="addUniversity" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="country">Add New University</label> <input type="text"
							class="form-control" id="commune"
							placeholder="Add New University" ng-model="universityName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-update" role="group" ng-hide="insertBOOL"
						ng-show="universityBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button" ng-click="updateUniversity()">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertUniverty()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- UNIVERSITY -->

<!-- INSTITUTION -->
<!-- line modal -->
<div class="modal fade" id="addInstitution" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="country">Add New Institution</label> <input
							type="text" class="form-control" id="commune"
							placeholder="Add New University" ng-model="institutionName">
					</div>
					<div class="form-group">
						<label for="country">Address</label> <input
							type="text" class="form-control" id="commune"
							placeholder="Add New University" ng-model="institutionAddress">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-update" role="group" ng-hide="insertBOOL"
						ng-show="universityBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button" ng-click="updateInstitution()">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertInstitution()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- INSTITUTION -->

<!-- POSITION -->
<!-- line modal -->
<div class="modal fade" id="addPosition" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="country">Add New Position</label> <input type="text"
							class="form-control" id="commune"
							placeholder="Add New University" ng-model="positionName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-update" role="group" ng-hide="insertBOOL"
						ng-show="universityBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button" ng-click="updatePosition()">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertPosition()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- POSITION -->

<!-- LOCATION -->

<!-- line modal -->
<div class="modal fade" id="addCountry" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="country">Add New Country</label> <input type="text"
							class="form-control" id="country" placeholder="Add New Country"
							ng-model="countryName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete " role="group"
						ng-hide="insertBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							ng-click="updateLanguage()" role="button">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertCountry()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- line modal city or province-->
<div class="modal fade" id="addProvince" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="gender">Country</label> <select class="form-control"
							id="gedner" ng-model="countryID"
							ng-options="cn.COUNTRY_ID as cn.COUNTRY_NAME for cn in countryObject">
							<option style="display: none" value="">--SELECT--</option>
						</select>
					</div>
					<div class="form-group">
						<label for="country">Add New Province or City</label> <input
							type="text" class="form-control" id="country"
							placeholder="Add New Province or City"
							ng-model="provinceOrCityName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete" role="group" ng-hide="insertBOOL">
						<button type="button" id="delImage"
							ng-click="updateCityOrProvince()"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertProvince()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- line modal city or province-->


<!-- line modal of district -->
<div class="modal fade" id="addDistrict" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="gender">Country</label> <select class="form-control"
							id="gedner" ng-model="countryID"
							ng-change="getDataOfProvinceOrCityByCountryID(countryID)"
							ng-options="cn.COUNTRY_ID as cn.COUNTRY_NAME for cn in countryObject">
						</select>
					</div>
					<div class="form-group">
						<label for="gender">Province Or City</label> <select
							class="form-control" id="gedner" ng-model="cityOrProvinceID"
							ng-options="pv.CITY_OR_PROVINCE_ID as pv.CITY_OR_PROVINCE_NAME for pv in provinceOrCityByCountryID">
						</select>
					</div>
					<div class="form-group">
						<label for="country">Add New District</label> <input type="text"
							class="form-control" id="country" placeholder="Add New District"
							ng-model="districtName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete" role="group" ng-hide="insertBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							ng-click="updateDistrict()" role="button">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertDistrict()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- line modal of district -->


<!-- line modal of Commune-->
<div class="modal fade" id="addCommune" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="gender">Country</label> <select class="form-control"
							id="gedner" ng-model="countryID"
							ng-change="getDataOfProvinceOrCityByCountryID(countryID)"
							ng-options="cn.COUNTRY_ID as cn.COUNTRY_NAME for cn in countryObject">
						</select>
					</div>
					<div class="form-group">
						<label for="gender">Province Or City</label> <select
							class="form-control" id="gedner" ng-model="cityOrProvinceID"
							ng-change="getDataOfDistrictByProvinceID(cityOrProvinceID)"
							ng-options="pv.CITY_OR_PROVINCE_ID as pv.CITY_OR_PROVINCE_NAME for pv in provinceOrCityByCountryID">
						</select>
					</div>
					<div class="form-group">
						<label for="gender">District</label> <select class="form-control"
							id="gedner" ng-model="districtID"
							ng-options="ds.DISTRICT_ID as ds.DISTRICT_NAME for ds in provinceByCountryID">
						</select>
					</div>
					<div class="form-group">
						<label for="country">Add New Commune</label> <input type="text"
							class="form-control" id="commune" placeholder="Add New Commune"
							ng-model="communeName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete" role="group" ng-hide="insertBOOL">
						<button type="button" id="delImage" ng-click="updateCommune()"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertCommune()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- line modal of Commune-->

<!-- LOCATION -->

<!-- POSITION -->
<!-- line modal -->
<div class="modal fade" id="addPosition" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="Position">Add New Position</label> <input type="text"
							class="form-control" id="Position" placeholder="Add New Position">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete hidden" role="group">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button">Delete</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- POSITION -->

<!-- MAJOR -->
<!-- line modal -->
<div class="modal fade" id="addMajor" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="country">Add New Major</label> <input type="text"
							class="form-control" id="major" placeholder="Add New Major"
							ng-model="majorName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete" role="group" ng-hide="insertBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button" ng-click="updateMajor()">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertMajor()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- MAJOR -->

<!-- LANGUAGE -->
<!-- line modal -->
<div class="modal fade" id="addLanguage" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="Language">Add New Language</label> <input type="text"
							class="form-control" id="Language" placeholder="Add New Language"
							ng-model="languageName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete" role="group" ng-hide="insertBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button" ng-click="updateLanguage()">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertLanguage()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- LANGUAGE -->

<!-- INSTITUTION -->

<!-- line modal -->
<div class="modal fade" id="addInstitution" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="institution">Add New Institution</label> <input
							type="text" class="form-control" id="Institution"
							placeholder="Add New Institution">
					</div>
					<div class="form-group">
						<label for="Address">Address <small>Optional</small>
						</label> <input type="text" class="form-control" id="Address"
							placeholder="1st, #342, Chamka Morn, Phnom Penh">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete hidden" role="group">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button">Delete</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- INSTITUTION -->

<!-- FILE TYPE -->

<!-- line modal -->
<div class="modal fade" id="addFileType" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				<!-- content goes here -->
				<form>
					<div class="form-group">
						<label for="docType">Add New Document Type</label> <input
							type="text" class="form-control" id="docType"
							placeholder="Add New Document Type" ng-model="fileTypeName">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
					<div class="btn-group btn-delete" role="group" ng-hide="insertBOOL">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							ng-click="updateFileType()" role="button">Update</button>
					</div>
					<div class="btn-group" role="group" ng-show="insertBOOL">
						<button type="button" id="saveImage"
							class="btn btn-default btn-hover-green" data-action="save"
							role="button" ng-click="insertFileType()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- FILE TYPE -->

<!-- modal -->