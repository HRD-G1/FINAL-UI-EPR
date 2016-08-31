var app = angular.module('expertFrontEndApp',  ['angular.filter']);
app
		.controller(
				'expertController',
				function($scope, $http) {
					// expert detail
					$scope.getDataDetail = function(ID) {
						$http({
							url : 'http://localhost:3333/rest/expert/' + ID,
							/*
							 * url:
							 * 'http://localhost:7777/rest/subject/bysubjectcategory/'+catID,
							 */
							method : 'GET'
						}).then(function(response) {

							$scope.expertDetail = response.data.DATA;
							console.log("This is expert detail");
							console.log($scope.expertDetail);
						}, function(response) {

						});
					}
					// expert detail

					/* get all subject name by category id */
					$scope.getAllSubjectByCategoryID = function(catID) {
						
						$http(
								{
									url : 'http://localhost:3333/rest/subject/bysubjectcategory/'
											+ catID,
									/*
									 * url:
									 * 'http://localhost:7777/rest/subject/bysubjectcategory/'+catID,
									 */
									method : 'GET'
								}).then(function(response) {
							/* console.log(response.data); */
							$scope.categories = response.data.DATA;
						}, function(response) {

						});
					}
					$scope.getAllSubjectByCategoryID(1);
					/* get all subject name by category id */

					$scope.getExpertsByRandom = function() {
						$http({
							url : 'http://localhost:3333/rest/expertbyrandom',
							method : 'GET'
						}).then(function(response) {

							console.log("Expert");
							console.log(response.data);

							$scope.experts = response.data.DATA;
						}, function(response) {

						});
					}

					$scope.getExpertsByRandom();

					$scope.getStatistic = function() {
						$http({
							url : 'http://localhost:3333/rest/subject/count',
							method : 'GET'
						}).then(function(response) {
							/*
							 * console.log("NUM"); console.log(response.data);
							 */
							$scope.numOfSkills = response.data.DATA;
						}, function(response) {

						});
					}

					$scope.getStatistic();

					$scope.goToSearchBySubject = function(id) {

					}

					// Searching Block

					$scope.getSubjectID = function(id) {
						window.location = "http://localhost:2244/search?id="
								+ id;
					}

					$scope.filter = {
						page : 1
					}

					$scope.checkPagination = true;

					var SUB_ID;
					$scope.goToSearchBySubjectID = function(subjectID) {
						SUB_ID = subjectID;
						$http(
								{
									url : 'http://localhost:3333/rest/findExpertsBySubjectID/'
											+ subjectID,
									method : 'GET',
									params : {
										page : $scope.filter.page,
										limit : 10
									}
								})
								.then(
										function(response) {
											console.log(
													"This is Result Subject: ",
													response);
											$scope.resultExpert = response.data.DATA;

											if ($scope.checkPagination) {
												/* alert("PAGINATION BLOCK") */
												$('#PAGINATION')
														.bootpag(
																{
																	total : response.data.PAGINATION.TOTAL_PAGES,
																	page : $scope.filter.page, // CURRENT
																	// PAGE
																	leaps : true,
																	firstLastUse : true,
																	first : '←',
																	last : '→',
																	next : 'Next',
																	prev : 'Prev',
																	maxVisible : 10
																});
												$scope.checkPagination = false;
											}
										}, function(response) {

										});
					}

					var pagOption = false;
					$('#PAGINATION').on("page", function(event, currentPage) {
						$scope.filter.page = currentPage;
						if (pagOption) {
							$scope.searchAdvance();
						} else {
							$scope.goToSearchBySubjectID(SUB_ID);
						}
					});

					// subjectSkill

					$scope.getSkill = function() {
						$http({
							url : 'http://localhost:3333/rest/subjectcategory',
							method : 'GET'
						}).then(function(response) {
							console.log("Skill")
							console.log(response.data);
							$scope.skills = response.data.DATA;
						}, function(response) {

						});
					}

					$scope.getSkill();

					var sujectSkills = {};
					$scope.getSubjectResults = function() {
						sujectSkills = $('input[name=subjectValues]:checked')
								.map(function() {
									return this.value;
								}).get();

					}

					$scope.test = function() {
						$scope.getSubjectResults();

						console.log(subjectString);
					}

					// subjectSkill

					// work experience

					$scope.getPosition = function() {
						$http({
							url : 'http://localhost:3333/rest/position',
							method : 'GET'
						}).then(function(response) {
							console.log(response.data);
							$scope.positions = response.data.DATA;
							$scope.positions[$scope.positions.length] = {
								POSITION_ID : 0,
								POSITION_NAME : "--Other--"
							};
						}, function(response) {

						});
					}

					$scope.getPosition();

					$scope.experienceValues = [ {
						EXP_VALUE : "1 Year",
						EXP_SHOW : "0-1 Year"
					}, {
						EXP_VALUE : "2 Years",
						EXP_SHOW : "1-2 Years"
					}, {
						EXP_VALUE : "3 Years",
						EXP_SHOW : "2-3 Years"
					}, {
						EXP_VALUE : "4 Years",
						EXP_SHOW : "3-4 Years"
					}, {
						EXP_VALUE : "5 Years",
						EXP_SHOW : "4 Years+"
					} ];

					// work experience

					// languages

					$scope.getLanguages = function() {
						$http({
							url : 'http://localhost:3333/rest/language',
							method : 'GET'
						}).then(function(response) {
							console.log(response.data);
							$scope.languages = response.data.DATA;
						}, function(response) {

						});
					}

					$scope.getLanguages();

					var languagesResults;
					$scope.getLanguageResults = function() {
						languagesResults = $(
								'input[name=languagesValues]:checked').map(
								function() {
									return this.value;

								}).get();
						console.log(languagesResults);
					}

					// age
					$scope.ages = [ {
						MIN_AGE : 18,
						MAX_AGE : 25,
						AGE_INFO : "18 - 25"
					}, {
						MIN_AGE : 26,
						MAX_AGE : 30,
						AGE_INFO : "26 - 30"
					}, {
						MIN_AGE : 31,
						MAX_AGE : 25,
						AGE_INFO : "31 - 50"
					} ];
					// age

					// location

					$scope.getLanguages = function() {
						$http({
							url : 'http://localhost:3333/rest/cityorprovince',
							method : 'GET'
						}).then(function(response) {
							console.log(response.data);
							$scope.locations = response.data.DATA;
						}, function(response) {

						});
					}

					$scope.getLanguages();

					// location

					$scope.expectedSalarys = [ {
						MIN_SALARY : 250,
						MAX_SALARY : 300,
						SALARY_INFO : "$ 250.00 - $ 300.00"
					}, {
						MIN_SALARY : 300,
						MAX_SALARY : 500,
						SALARY_INFO : "$ 300.00 - $ 500.00"
					}, {
						MIN_SALARY : 500,
						MAX_SALARY : 1000,
						SALARY_INFO : "$ 500.00 - $ 1000.00"
					}, {
						MIN_SALARY : 1000,
						MAX_SALARY : 5000,
						SALARY_INFO : "$ 1000.00 - $ 5000.00"
					} ];

					$scope.objLocation = null;

					$scope.clickSearchAdvance = function() {
						$scope.filter.page = 1;
						$scope.searchAdvance();
					}
					
					$scope.searchAdvance = function() {
						
						$scope.myDataOfSubjects = [];
						// subject array
						$scope.getSubjectResults();
						console.log("sub" + sujectSkills.length);
						for (var i = 0; i < sujectSkills.length; i++) {
							$scope.myDataOfSubjects.push({
								NUMBER_OF_EXPERT_EACH_SKILL : 0,
								NUM_OF_SKILLS : 10,
								SUBJECT_CATEGORY_ID : 0,
								SUBJECT_CATEGORY_NAME : '',
								SUBJECT_ID : sujectSkills[i],
								SUBJECT_NAME : ''
							});
						}
						// console.log($scope.myDataOfSubjects);

						// subject array

						// languages array
						$scope.getLanguageResults();
						languagesResults;
						$scope.myDataOfLanguages = [];
						for (var i = 0; i < languagesResults.length; i++) {
							$scope.myDataOfLanguages.push({
								LANGUAGE_DESCRIPTION : "",
								LANGUAGE_ID : languagesResults[i],
								LANGUAGE_NAME : ""
							})
						}

						// languages array

						// age
						var minAge = 0;
						var maxAge = 0;
						if ($scope.objAge != null) {
							minAge = $scope.objAge.MIN_AGE;
							maxAge = $scope.objAge.MAX_AGE;
						}
						// age

						// salary
						var maxSalary = 0;
						var minSalary = 0;
						if ($scope.objSalary != null) {
							maxSalary = $scope.objSalary.MIN_SALARY;
							minSalary = $scope.objSalary.MAX_SALARY;
						}
						// salary

						// city or province id
						var cityOrProvinceID = 0;
						if ($scope.objLocation != null) {
							cityOrProvinceID = $scope.objLocation.CITY_OR_PROVINCE_ID;
						}
						// city or province id

						// period
						var peroid = "NO";
						if ($scope.expPeroid != null) {
							peroid = $scope.expPeroid.EXP_VALUE;
						}

						// period

						// position
						var positionID = 0;
						if ($scope.objPosition != null) {
							positionID = $scope.objPosition.POSITION_ID;
						}
						// position

						$http({

							params : {
								page : $scope.filter.page,
								limit : 10
							},
							url : 'http://localhost:3333/rest/expert/advance',
							method : 'POST',
							data : {
								"MAX_AGE" : maxAge,
								"MIN_AGE" : minAge,
								"MAX_SALARY" : minSalary,
								"MIN_SALARY" : maxSalary,
								"DOB" : "string",
								"EDUCATIONS" : [ {
									"EDUCATION_END_YEAR" : "",
									"EDUCATION_START_YEAR" : "",
									"EXPERT_ID" : 0,
									"MAJOR_ID" : 0,
									"MAJOR_NAME" : "",
									"UNIVERSITY_ID" : 0,
									"UNIVERSITY_NAME" : ""
								} ],
								"EXPERT_ADVANCE_COURSE" : "",
								"EXPERT_CURRENT_ADDRESS" : {
									"CITY_OR_PROVINCE_ID" : cityOrProvinceID,
									"CITY_OR_PROVINCE_NAME" : "",
									"COMMUNE_ID" : 0,
									"COMMUNE_NAME" : "",
									"COUNTRY_ID" : 0,
									"COUNTRY_NAME" : "",
									"DISTRICT_ID" : 0,
									"DISTRICT_NAME" : "",
									"EXPERT_ID" : 0
								},
								"EXPERT_CURRENT_JOBS" : [ {
									"EXPERT_ID" : 0,
									"INSTITUTIOIN_NAME" : "",
									"INSTITUTION_ADDRESS" : "",
									"INSTITUTION_EMAIL" : "",
									"INSTITUTION_ID" : 0,
									"INSTITUTION_PHONE" : "",
									"POSITION_ID" : 0,
									"POSITION_NAME" : "",
									"SALARY" : 0,
									"intitutionAddress" : ""
								} ],
								"EXPERT_DOCUMENTS" : [ {
									"DESCRIPTION" : "",
									"EXPERT_ID" : 0,
									"FILE_DOCUMENT_ID" : 0,
									"FILE_NAME" : "",
									"FILE_PATH" : ""
								} ],
								"EXPERT_EMAIL" : "",
								"EXPERT_EXPERIENCES" : [ {
									"EXPERIENCE_END_YEAR" : "",
									"EXPERIENCE_START_YEAR" : "",
									"EXPERT_ID" : 0,
									"INSTITUTION_ADDRESS" : "",
									"INSTITUTION_ID" : 0,
									"INSTITUTION_NAME" : "",
									"PERIOD" : peroid,
									"POSITION_ID" : positionID,
									"POSITION_NAME" : "",
									"PROJECT_EXPERIENCE" : ""
								} ],
								"EXPERT_FIRST_NAME" : "",
								"EXPERT_GENDER" : $("#gender").val(),
								"EXPERT_GENDERATION" : 0,
								"EXPERT_ID" : 0,
								"EXPERT_JOB_EXPECTATIONS" : [ {
									"EXPERT_ID" : 0,
									"LOCATION" : "",
									"MAX_SALARY" : 0,
									"MIN_SALARY" : 0,
									"POSITION_ID" : 0,
									"POSITION_NAME" : ""
								} ],
								"EXPERT_LAST_NAME" : "",
								"EXPERT_PHONE1" : "",
								"EXPERT_PHONE2" : "",
								"EXPERT_PHOTO" : "",
								"EXPERT_STATUS" : "",
								"KA_ID" : 0,
								"LANGUAGES" : $scope.myDataOfLanguages,
								"PLACE_OF_BIRTH" : {
									"CITY_OR_PROVINCE_ID" : 0,
									"CITY_OR_PROVINCE_NAME" : "",
									"COMMUNE_ID" : 0,
									"COMMUNE_NAME" : "",
									"COUNTRY_ID" : 0,
									"COUNTRY_NAME" : "",
									"DISTRICT_ID" : 0,
									"DISTRICT_NAME" : "",
									"EXPERT_ID" : 0
								},
								"PROJECT_LINK_DEMO" : "",
								"SUBJECTS" : $scope.myDataOfSubjects
							}

						}).then(function(response) {
							console.log("Expert Advance: ",response);
							$scope.resultExpert = response.data.DATA;

							// CHANGE pagination to advance search
							pagOption = true;
							
							$('#PAGINATION').bootpag({
								total : response.data.PAGINATION.TOTAL_PAGES,
								page : $scope.filter.page, // CURRENT
								// PAGE
								leaps : true,
								firstLastUse : true,
								first : '←',
								last : '→',
								next : 'Next',
								prev : 'Prev',
								maxVisible : 10
							});

						}, function(response) {

						});
					}

					// Searching Block

					// getUserById
					$scope.getUserById = function(userId) {
						$scope.id = userId;
						$http(
								{
									url : 'http://localhost:3333/rest/getuserbyid/%7BuserId%7D?userId='
											+ $scope.id,
									/* strenght url */
									method : 'GET'
								}).then(function(response) {
							$scope.userlogined = response.data;
							$scope.email = response.data.email;
							$scope.username = response.data.username;
							$scope.password = response.data.password;
							$scope.gender = response.data.gender;
							$scope.dob = response.data.dob;
							$scope.phone = response.data.phone;
							console.log("This is user have logined");
							console.log($scope.userlogined);
						}, function(response) {

						});
					}
					// getUserById

					$scope.addUserAndRole = function() {
						/*
						 * when our data are array should be create new scope
						 * array
						 */
						var i = {
							"email" : $scope.emails,
							"password" : $scope.passwords,
							"username" : $scope.usernamess,
							"gender" : $scope.gender,
							"dob" : $scope.dob,
							"phone" : $scope.phone,
							"roles" : [ {
								id : $scope.selectedroleid,
								roleName : ""
							} ],
							"status" : true
						};
						console.log(i);
						$http({
							url : 'http://localhost:3333/rest/adduser',
							method : 'POST',
							data : i
						}).then(
								function(response) {
									$scope.email = "", $scope.password = "",
									$scope.usernames = "",
									console.log(response);
									window.location = "http://localhost:2244/login";
								}, function(response) {

								});
					}
					/* $scope.addUserAndRole(); */

					$scope.pstatus = false;

					$scope.validateOldPassword = function() {
						if ($scope.password == $scope.opwd) {
							$scope.pstatus = true;
						} else {
							$scope.pstatus = false;
						}
					}

					/* getRole */
					$scope.getRole = function() {
						$http({
							url : 'http://localhost:3333/rest/role',
							method : 'GET',

						}).then(function(response) {
							$scope.roles = response.data.DATA;
							console.log(response.data.DATA);
						}, function(response) {

						});

					}
					/* upate user */
					$scope.updateUser = function(user) {
						$http({
							url : 'http://localhost:3333/rest/user/',
							method : 'PUT',
							data : {
								'email' : $scope.email,
								'id' : $scope.id,
								'username' : $scope.username,
								'password' : $scope.npwd,
								'gender' : $scope.gender,
								'dob' : $scope.dob,
								'phone' : $scope.phone
							}
						}).then(
								function(response) {
									window.location = "http://localhost:2244/rest/user/setting";
								}, function(response) {
								});
					}
					/* upate user */

					/* confirm password */
					$scope.confirmStatus = false;
					$scope.confirmPassword = function() {
						if ($scope.passwords == $scope.cpwd) {
							$scope.confirmStatus = true;
						} else {
							$scope.confirmStatus = false;
						}

					}
					/* confirm password */

					/* getRole *//* $scope.getRole(); */
					// array of roles
					$scope.roles = [ /*
										 * { id : 1, rolename : "Admin" },
										 */{
						id : 2,
						rolename : "អ្នកប្រើប្រាស់ធម្មតា (User)"
					} ];
				});
