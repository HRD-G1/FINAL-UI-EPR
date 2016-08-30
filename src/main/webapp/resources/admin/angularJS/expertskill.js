var app = angular.module('expertApplication', [ 'angular.filter' ]);

app.directive('fileModel', [ '$parse', function($parse) {
	return {
		restrict : 'A',
		link : function(scope, element, attrs) {
			var model = $parse(attrs.fileModel);
			var modelSetter = model.assign;

			element.bind('change', function() {
				scope.$apply(function() {
					modelSetter(scope, element[0].files[0]);
				});
			});
		}
	};
} ]);

app.service('uploadFile', [ '$http', '$rootScope', function($http, $rootScope) {
	this.uploadFileToUrl = function(file, uploadUrl, fnCallback) {
		var fd = new FormData();
		fd.append('files', file);

		$http.post(uploadUrl, fd, {
			transformRequest : angular.identity,

			headers : {
				'Content-Type' : undefined
			}
		})

		.success(function(response) {
			if (fnCallback) {
				fnCallback(response);
			}
		})

		.error(function() {
			swal({
				title : "Error Internet",
				type : "error"
			});
		});
	}
} ]);

app
		.controller(
				'expertController',
				function($scope, $http, uploadFile) {

					$scope.test = function() {
						console.log($scope.fileDocOfExpert);
					}

					$('#EXPERT_PAGIN').on("page", function(event, currentPage) {
						$scope.filter.page = currentPage;
						$scope.getDataOfExperts();
					});

					// Expert

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

					$scope.getDataOfExperts = function() {
						$http({
							url : 'http://localhost:3333/rest/expert',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							console.log("Data of Expert");
							console.log(response)
							$scope.expertObject = response.data.DATA; // array
							$("#EXPERT_PAGIN").bootpag({
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
					};
					// Expert

					$scope.filter = {
						page : 1
					}

					$scope.whenInsert = function() {

						$scope.insertBOOL = true;
					}

					// Start of Sub Skill block
					$scope.insertDataOfMainSkill = function() {
						console.log("Main Skill: ");
						console.log($scope.mainSkillName);
						$http({
							url : 'http://localhost:3333/rest/subjectcategory',
							method : "POST",
							data : {
								"SUBJECT_CATEGORY" : 0,
								"SUBJECT_CATEGORY_NAME" : $scope.mainSkillName
							}
						}).then(function(response) {
							$scope.getDataOfMainSkill();
							$scope.mainSkillName = "";
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.subjectCategoryID;
					$scope.changeMainSkillID = function(OBJECT) {
						$scope.subjectCategoryID = OBJECT.SUBJECT_CATEOGRY_ID;
					}

					$scope.getUpdateMainSkill = function(mainSkill) {

						$scope.insertBOOL = false;

						$scope.mainSkillID = mainSkill.mks.SUBJECT_CATEOGRY_ID;
						$scope.mainSkillName = mainSkill.mks.SUBJECT_CATEGORY_NAME;

						console.log(mainSkill.mks.SUBJECT_CATEOGRY_ID);
					}

					$scope.updateMainSkill = function() {
						console.log("Main Skill: ");
						console.log($scope.mainSkillID);
						$http({
							url : 'http://localhost:3333/rest/subjectcategory',
							method : "PUT",
							data : {
								"SUBJECT_CATEGORY_NAME" : $scope.mainSkillName,
								"SUBJECT_CATEOGRY_ID" : $scope.mainSkillID,
								"subjectCategory" : $scope.mainSkillID
							}
						}).then(function(response) {
							$scope.getDataOfMainSkill();
							$scope.mainSkillName = "";
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.removeMainSkill = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/subjectcategory/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfMainSkill();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Deleted",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					$scope.getDataOfMainSkill = function() {
						$http({
							url : 'http://localhost:3333/rest/subjectcategory',
							method : 'GET'
						}).then(function(response) {
							console.log(response)
							$scope.mainSkillSet = response.data.DATA; // array
						}, function(response) {

						});
					};

					$scope.getDataOfMainSkill();

					$('#SKILL_PAGIN').on("page", function(event, currentPage) {
						$scope.filter.page = currentPage;
						$scope.getDataOfSkill();
					});

					$scope.getDataOfSkill = function() {
						$http({
							url : 'http://localhost:3333/rest/subject',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							console.log("Main SKill DATA");
							console.log(response)
							$scope.skillSet = response.data.DATA; // array
							$("#SKILL_PAGIN").bootpag({
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
					};
					$scope.getDataOfSkill();

					$scope.skillChange = function(skill) {
						console.log(skill);
					}
					$scope.insertDataOfSubSkill = function() {
						console.log($scope.mainSkillObject);
						$http(
								{
									url : 'http://localhost:3333/rest/subject',
									method : "POST",
									data : {
										"NUMBER_OF_EXPERT_EACH_SKILL" : 0,
										"NUM_OF_SKILLS" : 0,
										"SUBJECT_CATEGORY_ID" : $scope.subjectCategoryID,
										"SUBJECT_CATEGORY_NAME" : "",
										"SUBJECT_ID" : 0,
										"SUBJECT_NAME" : $scope.subjectName
									}

								}).then(function(response) {
							$scope.subjectName = "";
							$scope.getDataOfSkill();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdateSkill = function(subject) {
						console.log(subject);

						$scope.insertBOOL = false;

						$scope.subjectID = subject.sub.SUBJECT_ID;
						$scope.subjectName = subject.sub.SUBJECT_NAME;
						$scope.subjectCategory = subject.sub.SUBJECT_CATEGORY_ID;
					}

					$scope.updateSkill = function() {
						$http(
								{
									url : 'http://localhost:3333/rest/subject',
									method : "PUT",
									data : {
										"NUMBER_OF_EXPERT_EACH_SKILL" : 0,
										"NUM_OF_SKILLS" : 0,
										"SUBJECT_CATEGORY_ID" : $scope.subjectCategoryID,
										"SUBJECT_CATEGORY_NAME" : "",
										"SUBJECT_ID" : $scope.subjectID,
										"SUBJECT_NAME" : $scope.subjectName
									}
								}).then(function(response) {
							$scope.subjectName = "";
							$scope.getDataOfSkill();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$scope.removeSkill = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary Skill!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/subject/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															console
																	.log(response);
															if (response.data.CODE == 200) {
																$scope
																		.getDataOfMainSkill();
																swal({
																	title : "Deleted",
																	text : "Deleted Successfully",
																	timer : 600,
																	showConfirmButton : false
																})
															} else {
																swal({
																	title : "Failed To Deleted",
																	text : "Deleted Unsuccessfully",
																	timer : 600,
																	showConfirmButton : false
																});
															}

														}, function(response) {

														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					/* End of Sub Skill Block */

					/* Starting of University */

					$('#UNIVERSITY_PAGIN').on("page",
							function(event, currentPage) {
								$scope.filter.page = currentPage;
								$scope.getDataOfUniversity();
							});

					$scope.getDataOfUniversity = function() {
						$http({
							url : 'http://localhost:3333/rest/university',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}

						}).then(function(response) {
							console.log("this is university");
							console.log(response);
							$scope.universityObject = response.data.DATA; // array
							$("#UNIVERSITY_PAGIN").bootpag({
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
					};

					$scope.getDataOfUniversity();

					$scope.insertUniverty = function() {
						$http({
							url : 'http://localhost:3333/rest/university',
							method : "POST",
							data : {
								"UNIVERSITY_DESCRIPTION" : "",
								"UNIVERSITY_ID" : 0,
								"UNIVERSITY_NAME" : $scope.universityName
							}
						}).then(function(response) {
							$scope.universityName = "";
							$scope.getDataOfUniversity();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdateUniversity = function(uni) {

						$scope.insertBOOL = false;

						$scope.universityID = uni.uni.UNIVERSITY_ID;
						$scope.universityName = uni.uni.UNIVERSITY_NAME;
					}

					$scope.updateUniversity = function() {
						$http({
							url : 'http://localhost:3333/rest/university',
							method : "PUT",
							data : {
								"UNIVERSITY_DESCRIPTION" : "",
								"UNIVERSITY_ID" : $scope.universityID,
								"UNIVERSITY_NAME" : $scope.universityName
							}
						}).then(function(response) {
							$scope.universityName = "";
							$scope.getDataOfUniversity();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$scope.removeUniversity = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/university/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfUniversity();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Deleted",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					$scope.getUpdateUniversity = function(inti) {

						$scope.insertBOOL = false;

						$scope.universityID = uni.uni.UNIVERSITY_ID;
						$scope.universityName = uni.uni.UNIVERSITY_NAME;
					}

					/* End of university */

					/* Starting Institution */
					$scope.getDataOfInstitution = function() {
						$http({
							url : 'http://localhost:3333/rest/institution',
							method : 'GET'
						}).then(function(response) {
							console.log("this is institution");
							console.log(response);
							$scope.institutionObject = response.data.DATA; // array
							/*
							 * $('#PAGINATION_UNIVERSITY').bootpag({ total : 10,
							 * page : $scope.filter.page, // CURRENT // PAGE
							 * leaps : true, firstLastUse : true, first : '←',
							 * last : '→', next : 'Next', prev : 'Prev',
							 * maxVisible : 10 });
							 */
						}, function(response) {

						});
					};

					$scope.insertInstitution = function() {
						$http(
								{
									url : 'http://localhost:3333/rest/institution',
									method : "POST",
									data : {
										"INSTITUTION_ID" : 0,
										"INSTITUTION_NAME" : $scope.institutionName,
										"INSTITUTION_ADDRESS" : $scope.institutionAddress
									}
								}).then(function(response) {
							$scope.institutionName = "";
							$scope.institutionAddress = "";
							$scope.getDataOfInstitution();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdateInstitution = function(ints) {

						$scope.insertBOOL = false;

						$scope.institutionID = ints.ints.INSTITUTION_ID;
						$scope.institutionName = ints.ints.INSTITUTION_NAME;
						$scope.institutionAddress = ints.ints.INSTITUTION_ADDRESS;
					}

					$scope.updateInstitution = function() {
						$http({
							url : 'http://localhost:3333/rest/institution',
							method : "PUT",
							data : {
								INSTITUTION_ID : $scope.institutionID,
								INSTITUTION_NAME : $scope.institutionName,
								INSTITUTION_ADDRESS : $scope.institutionAddress
							}
						}).then(function(response) {
							$scope.institutionName = "";
							$scope.institutionAddress = "";
							$scope.getDataOfInstitution();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$scope.remvoeInstitution = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/institution/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfInstitution();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Deleted",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					/* Ending Institution */

					/* Starting Position */

					$scope.getDataOfPosition = function() {
						$http({
							url : 'http://localhost:3333/rest/position',
							method : 'GET'
						}).then(function(response) {
							console.log("this is position");
							console.log(response);
							$scope.positionObject = response.data.DATA; // array
							/*
							 * $('#PAGINATION_UNIVERSITY').bootpag({ total : 10,
							 * page : $scope.filter.page, // CURRENT // PAGE
							 * leaps : true, firstLastUse : true, first : '←',
							 * last : '→', next : 'Next', prev : 'Prev',
							 * maxVisible : 10 });
							 */
						}, function(response) {

						});
					};

					$scope.insertPosition = function() {
						$http({
							url : 'http://localhost:3333/rest/position',
							method : "POST",
							data : {
								POSITION_ID : 0,
								POSITION_NAME : $scope.positionName
							}
						}).then(function(response) {
							$scope.positionName = "";
							$scope.getDataOfPosition();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdatePostion = function(pos) {

						$scope.insertBOOL = false;

						$scope.positionID = pos.pos.POSITION_ID;
						$scope.positionName = pos.pos.POSITION_NAME;
					}

					$scope.updatePosition = function() {
						$http({
							url : 'http://localhost:3333/rest/position',
							method : "PUT",
							data : {
								POSITION_ID : $scope.positionID,
								POSITION_NAME : $scope.positionName
							}
						}).then(function(response) {
							$scope.positionName = "";
							$scope.getDataOfPosition();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$scope.removePosition = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/position/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfPosition();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Deleted",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					/* Ending Position */

					/* Starting of Major */
					$scope.insertMajor = function() {
						$http({
							url : 'http://localhost:3333/rest/major',
							method : "POST",
							data : {
								"MAJOR_ID" : 0,
								"MAJOR_NAME" : $scope.majorName
							}
						}).then(function(response) {
							$scope.majorName = "";
							$scope.getDataOfMajor();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdateMajor = function(major) {

						$scope.insertBOOL = false;

						$scope.majorID = major.maj.MAJOR_ID;
						$scope.majorName = major.maj.MAJOR_NAME;
					}

					$scope.updateMajor = function() {
						$http({
							url : 'http://localhost:3333/rest/major',
							method : "PUT",
							data : {
								"MAJOR_ID" : $scope.majorID,
								"MAJOR_NAME" : $scope.majorName
							}
						}).then(function(response) {
							$scope.majorName = "";
							$scope.getDataOfMajor();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$('#MAJOR_PAGIN').on("page", function(event, currentPage) {
						$scope.filter.page = currentPage;
						$scope.getDataOfDistrict();
					});

					$scope.getDataOfMajor = function() {
						$http({
							url : 'http://localhost:3333/rest/major',
							method : "GET",
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							console.log("this is major");
							console.log(response);
							$scope.majorObject = response.data.DATA;
							$("#MAJOR_PAGIN").bootpag({
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
					};
					$scope.getDataOfMajor();

					$scope.removeMajor = function(id) {

						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/major/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfMajor();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Deleted",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}
					/* Ending of Major */

					/* Starting of Language */

					$('#LANGUAGE_PAGIN').on("page",
							function(event, currentPage) {
								$scope.filter.page = currentPage;
								$scope.getDataOfLanguage();
							});

					$scope.getDataOfLanguage = function() {
						$http({
							url : 'http://localhost:3333/rest/language',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							$scope.languageObject = response.data.DATA; // array
							$("#LANGUAGE_PAGIN").bootpag({
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
					};
					$scope.getDataOfLanguage();

					$scope.getUpdateLanguage = function(lan) {

						$scope.insertBOOL = false;

						$scope.languageID = lan.lan.LANGUAGE_ID;
						$scope.languageName = lan.lan.LANGUAGE_NAME;
					}

					$scope.updateLanguage = function() {
						$http({
							url : 'http://localhost:3333/rest/language',
							method : "PUT",
							data : {
								"LANGUAGE_DESCRIPTION" : "",
								"LANGUAGE_ID" : $scope.languageID,
								"LANGUAGE_NAME" : $scope.languageName
							}
						}).then(function(response) {
							$scope.languageName = "";
							$scope.getDataOfLanguage();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$scope.removeLanguage = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/language/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfLanguage();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Deleted",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					$scope.insertLanguage = function() {
						$http({
							url : 'http://localhost:3333/rest/language',
							method : "POST",
							data : {
								"LANGUAGE_DESCRIPTION" : "",
								"LANGUAGE_ID" : 0,
								"LANGUAGE_NAME" : $scope.languageName
							}
						}).then(function(response) {
							$scope.languageName = "";
							$scope.getDataOfLanguage();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};
					/* Ending of Language */

					// Country Block
					$scope.getDataOfCountry = function() {
						$http({
							url : 'http://localhost:3333/rest/country',
							method : 'GET'
						}).then(function(response) {
							console.log("country: ")
							console.log(response)
							$scope.countryObject = response.data.DATA; // array
						}, function(response) {

						});
					};

					$scope.getDataOfCountry();

					$scope.insertCountry = function() {
						$http({
							url : 'http://localhost:3333/rest/country',
							method : "POST",
							data : {
								"COUNTRY_ID" : 0,
								"COUNTRY_NAME" : $scope.countryName
							}
						}).then(function(response) {
							$scope.countryName = "";
							$scope.getDataOfCountry(); // refresh country
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdateCountry = function(country) {

						$scope.insertBOOL = false;

						$scope.countryID = country.cou.COUNTRY_ID;
						$scope.countryName = country.cou.COUNTRY_NAME;

					}

					$scope.updateLanguage = function() {
						$http({
							url : 'http://localhost:3333/rest/country',
							method : "PUT",
							data : {
								"COUNTRY_ID" : $scope.countryID,
								"COUNTRY_NAME" : $scope.countryName
							}
						}).then(function(response) {
							$scope.countryName = "";
							$scope.getDataOfCountry();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$scope.removeCountry = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/country/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfCountry();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Deleted",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					// Country Block

					// Province Block

					$('#PROVINCE_PAGIN').on("page",
							function(event, currentPage) {
								$scope.filter.page = currentPage;
								$scope.getDataOfProvinceOrCity();
							});

					$scope.getDataOfProvinceOrCity = function() {
						$http({
							url : 'http://localhost:3333/rest/cityorprovince',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							console.log("CITY: ")
							console.log(response)
							$scope.provinceOrCity = response.data.DATA; // array
							$("#PROVINCE_PAGIN").bootpag({
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
					};

					$scope.getDataOfProvinceOrCity();

					$scope.getDataOfProvinceOrCityByCountryID = function(id) {
						$http(
								{
									url : 'http://localhost:3333/rest/cityorprovince/findAllBy/'
											+ id,
									method : 'GET'
								})
								.then(
										function(response) {
											console.log("CITY: ")
											console.log(response)
											$scope.provinceOrCityByCountryID = response.data.DATA; // array
										}, function(response) {

										});
					};

					$scope.getDataOfDistrictByProvinceID = function(id) {
						$http({
							url : 'http://localhost:3333/rest/district/' + id,
							method : 'GET'
						}).then(function(response) {
							console.log("CITY: ")
							console.log(response)
							$scope.provinceByCountryID = response.data.DATA; // array
						}, function(response) {

						});
					};

					$scope.insertProvince = function() {

						console.log($scope.countryID);

						$http(
								{
									url : 'http://localhost:3333/rest/cityorprovince',
									method : "POST",
									data : {
										"CITY_OR_PROVINCE_ID" : 0,
										"CITY_OR_PROVINCE_NAME" : $scope.provinceOrCityName,
										"COUNTRY_ID" : $scope.countryID
									}
								}).then(function(response) {
							$scope.provinceOrCityName = "";
							$scope.getDataOfProvinceOrCity();
							// Province Or
							// City
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdateCityOrProvince = function(pro) {

						console.log(pro);

						$scope.insertBOOL = false;

						$scope.cityOrProvinceID = pro.pro.CITY_OR_PROVINCE_ID;
						$scope.provinceOrCityName = pro.pro.CITY_OR_PROVINCE_NAME;
						$scope.countryID = pro.pro.COUNTRY_ID;

					}

					$scope.updateCityOrProvince = function() {
						$http(
								{
									url : 'http://localhost:3333/rest/cityorprovince',
									method : "PUT",
									data : {
										"CITY_OR_PROVINCE_ID" : $scope.cityOrProvinceID,
										"CITY_OR_PROVINCE_NAME" : $scope.provinceOrCityName,
										"COUNTRY_ID" : $scope.countryID
									}
								}).then(function(response) {
							$scope.provinceOrCityName = "";
							$scope.getDataOfProvinceOrCity();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$scope.removeCityOrProvince = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/cityorprovince/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfProvinceOrCity();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Delete",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					// Province Block

					// District Block

					$('#DISTRICT_PAGIN').on("page",
							function(event, currentPage) {
								$scope.filter.page = currentPage;
								$scope.getDataOfDistrict();
							});

					$scope.getDataOfDistrict = function() {
						$http({
							url : 'http://localhost:3333/rest/district',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							console.log("This is district");
							console.log(response);
							$scope.districtObject = response.data.DATA; // array
							$scope.communeObject = response.data.DATA; // array
							$("#DISTRICT_PAGIN").bootpag({
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
					};
					$scope.getDataOfDistrict();

					$scope.insertDistrict = function() {
						$http(
								{
									url : 'http://localhost:3333/rest/district',
									method : "POST",
									data : {
										"CITY_OR_PROVINCE_ID" : $scope.cityOrProvinceID,
										"CITY_OR_PROVINCE_NAME" : "",
										"COUNTRY_NAME" : "",
										"DISTRICT_ID" : 0,
										"DISTRICT_NAME" : $scope.districtName
									}

								}).then(function(response) {
							$scope.districtName = "";
							$scope.getDataOfDistrict();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdateDitrict = function(dis) {
						console.log("this id district: ")
						console.log(dis);

						$scope.insertBOOL = false;

						$scope.districtID = dis.dis.DISTRICT_ID;
						$scope.countryID = dis.dis.COUNTRY_ID
						$scope
								.getDataOfProvinceOrCityByCountryID($scope.countryID);
						$scope.cityOrProvinceID = dis.dis.CITY_OR_PROVINCE_ID;
						$scope.districtName = dis.dis.DISTRICT_NAME;
					}

					$scope.updateDistrict = function() {
						$http(
								{
									url : 'http://localhost:3333/rest/district',
									method : "PUT",
									data : {
										"CITY_OR_PROVINCE_ID" : $scope.cityOrProvinceID,
										"CITY_OR_PROVINCE_NAME" : "",
										"COUNTRY_NAME" : "",
										"DISTRICT_ID" : $scope.districtID,
										"DISTRICT_NAME" : $scope.districtName
									}

								}).then(function(response) {
							$scope.districtName = "";
							$scope.getDataOfDistrict();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Update",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.removeDistrict = function(id) {
						console.log(id);
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/district/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfDistrict();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Delete",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal({
											title : "Delete Cancel",
											text : "Delete Cancel",
											timer : 600,
											showConfirmButton : false
										});
									}
								});

					}

					// District Block

					// Commune Block

					$scope.insertCommune = function() {
						$http({
							url : 'http://localhost:3333/rest/commune',
							method : "POST",
							data : {
								"CITY_OR_PROVINCE_ID" : 0,
								"CITY_OR_PROVINCE_NAME" : "",
								"COMMUNE_ID" : 0,
								"COMMUNE_NAME" : $scope.communeName,
								"COUNTRY_ID" : 0,
								"COUNTRY_NAME" : "",
								"DISTRICT_ID" : $scope.districtID,
								"DISTRICT_NAME" : ""
							}

						}).then(function(response) {
							$scope.communeName = "";
							$scope.getDataOfCommune();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$('#COMMUNE_PAGIN').on("page",
							function(event, currentPage) {
								$scope.filter.page = currentPage;
								$scope.getDataOfCommune();
							});

					$scope.getDataOfCommune = function() {
						$http({
							url : 'http://localhost:3333/rest/commune',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							console.log("this is commune");
							console.log(response);

							$scope.communeObject = response.data.DATA; // array
							$("#COMMUNE_PAGIN").bootpag({
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
					};

					$scope.getUpdateCommune = function(com) {
						$scope.insertBOOL = false;
						console.log(com);

						$scope.countryID = com.com.COUNTRY_ID;
						$scope
								.getDataOfProvinceOrCityByCountryID($scope.countryID);
						$scope.cityOrProvinceID = com.com.CITY_OR_PROVINCE_ID;
						$scope
								.getDataOfDistrictByProvinceID($scope.cityOrProvinceID);
						$scope.districtID = com.com.DISTRICT_ID;

						$scope.communeID = com.com.COMMUNE_ID;
						$scope.communeName = com.com.COMMUNE_NAME;
					}

					$scope.getDataOfCommune();

					$scope.updateCommune = function() {
						$http({
							url : 'http://localhost:3333/rest/commune',
							method : "PUT",
							data : {
								"CITY_OR_PROVINCE_ID" : 0,
								"CITY_OR_PROVINCE_NAME" : "",
								"COMMUNE_ID" : $scope.communeID,
								"COMMUNE_NAME" : $scope.communeName,
								"COUNTRY_ID" : 0,
								"COUNTRY_NAME" : "",
								"DISTRICT_ID" : $scope.districtID,
								"DISTRICT_NAME" : ""
							}

						}).then(function(response) {
							$scope.communeName = "";
							$scope.getDataOfCommune();
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Update",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.removeCommune = function(id) {
						console.log(id);
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/commune/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfCommune();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Delete",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal({
											title : "Delete Cancel",
											text : "Delete Cancel",
											timer : 600,
											showConfirmButton : false
										});
									}
								});

					}

					// Commune Block

					/* Starting of File */
					$scope.insertFileType = function() {
						$http({
							url : 'http://localhost:3333/rest/filedocument',
							method : "POST",
							data : {
								"FILE_DESCRIPTION" : "",
								"FILE_ID" : 0,
								"FILE_NAME" : $scope.fileTypeName
							}
						}).then(function(response) {
							$scope.fileTypeName = "";
							$scope.getDataOfFileType();
							swal({
								title : "Inserted",
								text : "Inserted Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Insert",
								text : "Inserted Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					};

					$scope.getUpdateFileType = function(file) {

						console.log("This is File UPdate");
						console.log(file);

						$scope.insertBOOL = false;

						$scope.fileTypeID = file.ft.FILE_ID;
						$scope.fileTypeName = file.ft.FILE_NAME;

					}

					$scope.getDataOfFileType = function() {
						$http({
							url : 'http://localhost:3333/rest/filedocument',
							method : 'GET'
						}).then(function(response) {
							console.log("this is file");
							console.log(response)
							$scope.fileType = response.data.DATA; // array
						}, function(response) {

						});
					};

					$scope.updateFileType = function() {
						console.log("Main Skill: ");
						console.log($scope.fileTypeID);
						$http({
							url : 'http://localhost:3333/rest/filedocument',
							method : "PUT",
							data : {
								"FILE_DESCRIPTION" : "",
								"FILE_ID" : $scope.fileTypeID,
								"FILE_NAME" : $scope.fileTypeName
							}
						}).then(function(response) {
							$scope.getDataOfFileType();
							$scope.mainSkillName = "";
							swal({
								title : "Updated",
								text : "Updated Successfully",
								timer : 600,
								showConfirmButton : false
							})
						}, function(response) {
							swal({
								title : "Failed To Updated",
								text : "Updated Unsuccessfully",
								timer : 600,
								showConfirmButton : false
							});
						});
					}

					$scope.removeFileType = function(id) {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$http(
												{
													url : 'http://localhost:3333/rest/filedocument/'
															+ id,
													method : "DELETE"
												})
												.then(
														function(response) {
															$scope
																	.getDataOfFileType();
															swal({
																title : "Deleted",
																text : "Deleted Successfully",
																timer : 600,
																showConfirmButton : false
															})
														},
														function(response) {
															swal({
																title : "Failed To Delete",
																text : "Deleted Unsuccessfully",
																timer : 600,
																showConfirmButton : false
															});
														});
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});

					}

					$scope.getDataOfFileType();
					/* Ending of File */

					// Add Expert
					// start personal information
					$scope.getDataOfCommuneByDistrictID = function(id) {
						$http({
							url : 'http://localhost:3333/rest/commune/' + id,
							method : 'GET'
						})
								.then(
										function(response) {
											console.log("this is commune");
											console.log(response);
											$scope.communeObjectByDistrictID = response.data.DATA; // array
										}, function(response) {

										});
					}

					$scope.getDataOfCommuneByDistrictIDOfCurrentAddress = function(
							id) {
						$http({
							url : 'http://localhost:3333/rest/commune/' + id,
							method : 'GET'
						})
								.then(
										function(response) {
											console.log("this is commune");
											console.log(response);
											$scope.communeObjectByDistrictIDOfCurrentAddress = response.data.DATA; // array
										}, function(response) {

										});
					}

					$scope.getDataOfProvinceOrCityByCountryIDOfCurrentAddress = function(
							id) {
						$http(
								{
									url : 'http://localhost:3333/rest/cityorprovince/findAllBy/'
											+ id,
									method : 'GET'
								})
								.then(
										function(response) {
											console.log("CITY: ")
											console.log(response)
											$scope.provinceOrCityByCountryIDOfCurrentAddress = response.data.DATA; // array
										}, function(response) {

										});
					};

					$scope.getDataOfDistrictByProvinceIDOfCurrentAddress = function(
							id) {
						$http({
							url : 'http://localhost:3333/rest/district/' + id,
							method : 'GET'
						})
								.then(
										function(response) {
											console.log("CITY: ")
											console.log(response)
											$scope.provinceByCountryIDOfCurrentAddress = response.data.DATA; // array
										}, function(response) {

										});
					};

					// end personal information

					// education

					$scope.eduOfExpert = [ {
						EDUCATION_END_YEAR : "",
						EDUCATION_START_YEAR : "",
						EXPERT_ID : 0,
						MAJOR_ID : 0,
						MAJOR_NAME : "",
						UNIVERSITY_ID : 0,
						UNIVERSITY_NAME : ""
					} ];

					$scope.numOfEdu = 0;

					$scope.addTempEduOfExpert = function() {
						$scope.eduOfExpert.push({
							EDUCATION_END_YEAR : "",
							EDUCATION_START_YEAR : "",
							EXPERT_ID : 0,
							MAJOR_ID : 0,
							MAJOR_NAME : "",
							UNIVERSITY_ID : 0,
							UNIVERSITY_NAME : ""
						})
					}

					// education

					// experience

					$scope.expOfExpert = [ {
						EXPERIENCE_END_YEAR : "",
						EXPERIENCE_START_YEAR : "",
						EXPERT_ID : 0,
						INSTITUTION_ADDRESS : "",
						INSTITUTION_ID : 0,
						INSTITUTION_NAME : "",
						PERIOD : "",
						POSITION_ID : "",
						POSITION_NAME : "",
						PROJECT_EXPERIENCE : ""
					} ];

					$scope.addTempExpOfExpert = function() {
						$scope.expOfExpert.push({
							EXPERIENCE_END_YEAR : "",
							EXPERIENCE_START_YEAR : "",
							EXPERT_ID : 0,
							INSTITUTION_ADDRESS : "",
							INSTITUTION_ID : 0,
							INSTITUTION_NAME : "",
							PERIOD : "",
							POSITION_ID : "",
							POSITION_NAME : "",
							PROJECT_EXPERIENCE : ""
						})
					}

					// experience

					$('#INSTITUTION_PAGIN').on("page",
							function(event, currentPage) {
								$scope.filter.page = currentPage;
								$scope.getDataOfInstitution();
							});

					// call institution
					$scope.getDataOfInstitution = function() {
						$http({
							url : 'http://localhost:3333/rest/institution',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							console.log("this is intitution");
							console.log(response)
							$scope.institutionObject = response.data.DATA; // array
							$scope.communeObject = response.data.DATA; // array
							$("#INSTITUTION_PAGIN").bootpag({
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
					};

					$scope.getDataOfInstitution();

					$('#POSITION_PAGIN').on("page",
							function(event, currentPage) {
								$scope.filter.page = currentPage;
								$scope.getDataOfPosition();
							});

					$scope.getDataOfPosition = function() {
						$http({
							url : 'http://localhost:3333/rest/position',
							method : 'GET',
							params : {
								page : $scope.filter.page,
								limit : 10
							}
						}).then(function(response) {
							console.log("this is position");
							console.log(response)
							$scope.positionObject = response.data.DATA; // array
							$scope.communeObject = response.data.DATA; // array
							$("#POSITION_PAGIN").bootpag({
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
					};

					$scope.getDataOfPosition();

					$scope.getDataOfInstitution();

					// current Job

					$scope.currentJobOfExpert = [ {
						EXPERT_ID : 0,
						INSTITUTIOIN_NAME : "",
						INSTITUTION_ADDRESS : "",
						INSTITUTION_EMAIL : "",
						INSTITUTION_ID : 0,
						INSTITUTION_PHONE : "",
						POSITION_ID : 0,
						POSITION_NAME : "",
						SALARY : 0
					} ];

					$scope.addTempCurrentJobOfExpert = function() {
						$scope.currentJobOfExpert.push({
							EXPERT_ID : 0,
							INSTITUTIOIN_NAME : "",
							INSTITUTION_ADDRESS : "",
							INSTITUTION_EMAIL : "",
							INSTITUTION_ID : 0,
							INSTITUTION_PHONE : "",
							POSITION_ID : 0,
							POSITION_NAME : "",
							SALARY : 0
						})
					}

					// current job

					// language

					$scope.langOfExpert = [ {
						EXPERT_ID : 0,
						LANGUAGE_ID : 0,
						LANGUAGE_NAME : "",
						MENTION : ""
					} ];

					$scope.addTempLanguageOfExpert = function() {
						$scope.langOfExpert.push({
							EXPERT_ID : 0,
							LANGUAGE_ID : 0,
							LANGUAGE_NAME : "",
							MENTION : ""
						});
					}

					// language

					// job expectation
					$scope.jobExpectationOfExpert = [ {
						EXPERT_ID : 0,
						LOCATION : "",
						MAX_SALARY : 0,
						MIN_SALARY : 0,
						POSITION_ID : 0,
						POSITION_NAME : ""
					} ];

					$scope.addTempjobExpectationOfExpert = function() {
						$scope.jobExpectationOfExpert.push({
							EXPERT_ID : 0,
							LOCATION : "",
							MAX_SALARY : 0,
							MIN_SALARY : 0,
							POSITION_ID : 0,
							POSITION_NAME : ""
						});
					}
					// job expectation

					// skill
					$scope.whenMainSkillchange = function(id) {
						$http(
								{
									url : 'http://localhost:3333/rest/subject/bysubjectcategory/'
											+ id,
									method : 'GET'
								}).then(function(response) {
							console.log("this is sub skill")
							console.log(response)
							$scope.subSkillObject = response.data.DATA; // array
						}, function(response) {

						});
					};

					$scope.subjectOfExpert = [ {
						EXPERT_ID : 0,
						EXPERT_SUBJECT_DETAIL_LEVEL : "",
						SUBJECT_CATEGORY_ID : "",
						SUBJECT_CATEGORY_NAME : "",
						SUBJECT_ID : 0,
						SUBJECT_NAME : ""
					} ]

					$scope.addTempsubjectOfExpertOfExpert = function() {
						$scope.subjectOfExpert.push({
							EXPERT_ID : 0,
							EXPERT_SUBJECT_DETAIL_LEVEL : "",
							SUBJECT_CATEGORY_ID : "",
							SUBJECT_CATEGORY_NAME : "",
							SUBJECT_ID : 0,
							SUBJECT_NAME : ""
						})
					}

					// skill

					// file doc
					$scope.fileDocOfExpert = [ {
						DESCRIPTION : "",
						EXPERT_ID : 0,
						FILE_DOCUMENT_ID : 0,
						FILE_NAME : "",
						FILE_PATH : 0
					} ];

					$scope.addfileDocOfExpertOfExpert = function() {
						$scope.fileDocOfExpert.push({
							DESCRIPTION : "",
							EXPERT_ID : 0,
							FILE_DOCUMENT_ID : 0,
							FILE_NAME : "",
							FILE_PATH : 0
						})
					}
					// file doc

					$scope.showEduTest = function() {
						$scope.insertExpertAllTheTime();
					}

					// function add

					/* ADD IMAGE */

					var storePath = [];

					$scope.addFileExpert = function() {
						var uploadUrl = "http://localhost:3333/rest/uploadfile";
						for (var i = 0; i < $scope.fileDocOfExpert.length; i++) {
							uploadFile.uploadFileToUrl(
									$scope.fileDocOfExpert[i].FILE_PATH,
									uploadUrl, function(response) {
										console.log(response)
										storePath.push({
											PATH : response.FILE_PATH1
										});
									});
						}
					}

					clear = function() {

						var storePath = [];
					}

					$scope.addImage = function() {
						var file = $scope.photoUpload;
						console.log('file is');
						console.dir(file);

						var uploadUrl = "http://localhost:3333/rest/uploadphoto";
						uploadFile
								.uploadFileToUrl(
										file,
										uploadUrl,
										function(response) {
											// insert path to file doc of expert
											for (var i = 0; i < storePath.length; i++) {
												console
														.log(
																"File Doc of Expert",
																$scope.fileDocOfExpert[i]);
												$scope.fileDocOfExpert[i].FILE_PATH = storePath[i].PATH;
											}

											console.log("After Assigned: ",
													$scope.fileDocOfExpert);

											// if insert photo success

											alert("called add Expert")

											$scope.expertAllTheTimes = {
												DOB : $scope.dateOfBirth,
												EDUCATIONS : $scope.eduOfExpert,
												EXPERT_ADVANCE_COURSE : $scope.advanceCourse,
												EXPERT_CURRENT_ADDRESS : {
													CITY_OR_PROVINCE_ID : $scope.objectCommuneOfCurrentAddress.CITY_OR_PROVINCE_ID,
													CITY_OR_PROVINCE_NAME : "",
													COMMUNE_ID : $scope.objectCommuneOfCurrentAddress.COMMUNE_ID,
													COMMUNE_NAME : "",
													COUNTRY_ID : $scope.objectCommuneOfCurrentAddress.COUNTRY_ID,
													COUNTRY_NAME : "",
													DISTRICT_ID : $scope.objectCommuneOfCurrentAddress.DISTRICT_ID,
													DISTRICT_NAME : "",
													EXPERT_ID : 0
												},
												EXPERT_CURRENT_JOBS : $scope.currentJobOfExpert,
												EXPERT_DOCUMENTS : $scope.fileDocOfExpert,
												EXPERT_EMAIL : $scope.email,
												EXPERT_EXPERIENCES : $scope.expOfExpert,
												EXPERT_FIRST_NAME : $scope.firstName,
												EXPERT_GENDER : $scope.gender,
												EXPERT_GENDERATION : $scope.generation,
												EXPERT_ID : 0,
												EXPERT_JOB_EXPECTATIONS : $scope.jobExpectationOfExpert,
												EXPERT_LAST_NAME : $scope.lastName,
												EXPERT_PHONE1 : $scope.phone1,
												EXPERT_PHONE2 : $scope.phone2,
												EXPERT_PHOTO : response.THUMBNAIL_IMAGE,
												EXPERT_STATUS : "",
												KA_ID : 0,
												LANGUAGES : [ {
													LANGUAGE_DESCRIPTION : "",
													LANGUAGE_ID : 0,
													LANGUAGE_NAME : ""
												} ],
												MAX_AGE : 0,
												MAX_SALARY : 0,
												MIN_AGE : 0,
												MIN_SALARY : 0,
												PLACE_OF_BIRTH : {
													CITY_OR_PROVINCE_ID : $scope.objectCommuneOfPlaceOfBirth.CITY_OR_PROVINCE_ID,
													CITY_OR_PROVINCE_NAME : "",
													COMMUNE_ID : $scope.objectCommuneOfPlaceOfBirth.COMMUNE_ID,
													COMMUNE_NAME : "",
													COUNTRY_ID : $scope.objectCommuneOfPlaceOfBirth.COUNTRY_ID,
													COUNTRY_NAME : "",
													DISTRICT_ID : $scope.objectCommuneOfPlaceOfBirth.DISTRICT_ID,
													DISTRICT_NAME : "",
													EXPERT_ID : 0
												},
												PROJECT_LINK_DEMO : $scope.projectLinkDemo,
												SUBJECTS : [ {
													NUMBER_OF_EXPERT_EACH_SKILL : 0,
													NUM_OF_SKILLS : 0,
													SUBJECT_CATEGORY_ID : 0,
													SUBJECT_CATEGORY_NAME : "",
													SUBJECT_ID : 0,
													SUBJECT_NAME : ""
												} ],
												EXPERT_LANGUAGE_DETAIL : $scope.langOfExpert,
												EXPERT_SUBJECT_DETAIL : $scope.subjectOfExpert
											};

											console
													.log($scope.expertAllTheTimes);

											$http(
													{
														url : 'http://localhost:3333/rest/expert',
														method : "POST",
														data : $scope.expertAllTheTimes

													})
													.then(
															function(response) {
																clear();
																swal({
																	title : "Inserted",
																	text : "Inserted Successfully",
																	timer : 600,
																	showConfirmButton : false
																});

															},
															function(response) {
																clear();
																swal({
																	title : "Failed To Insert",
																	text : "Inserted Unsuccessfully",
																	timer : 600,
																	showConfirmButton : false
																});

															});

										});

					}

					$scope.insertExpertAllTheTime = function() {
						alert("called add file");
						$scope.addFileExpert();
						console.log(storePath);
						alert("called add image");
						$scope.addImage();

					}

				});
