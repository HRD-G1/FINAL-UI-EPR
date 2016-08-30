/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = angular.module('exApp', []);

app.controller('expertDetailInfoController', function($scope, $http) {
	$scope.getDataDetail = function(expertID) {
		$http({
			url : 'http://localhost:3333/rest/expert/' + expertID,
			method : 'GET'
		}).then(function(response) {
			console.log(response.data);
			$scope.expert = response.data;
		}, function(response) {
		});
	}
});

//
// var date_input = $('input[name="date"]'); //our date input has the name
// "date"
// var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso
// form').parent() : "body";
// date_input.datepicker({
// format: 'mm/dd/yyyy',
// container: container,
// todayHighlight: true,
// autoclose: true
// });
// $scope.pFName = "Devid";
// $scope.pLName = "Handerson";
// $scope.pGender = "Male";
// $scope.pMS = "Single";
// $scope.pNationality = "Cambodian";
// $scope.pDoB = "1995/01/12";
// $scope.pPoB = "Phnom Penh, Cambodia";
// $scope.pCPoB = "Phnom Penh, Cambodia";
// $scope.pEmail = "d.handerson@gmail.com";
// $scope.pPhone = "010 030 939";
//
// $scope.updateInfo = function () {
// $scope.pFName = $("#exFName").val();
// $scope.pLName = $("#exLName").val();
// $scope.pGender = $("#exGender").val();
// $scope.pMS = $("#exMS").val();
// $scope.pNationality = $("#exNationality").val();
// $scope.pDoB = $("#exDoB").val();
// $scope.pPoB = $("#exPoB").val();
// $scope.pCPoB = $("#exCPoB").val();
// $scope.pEmail = $("#exEmail").val();
// $scope.pPhone = $("#exPhone").val();
// };
// });
//
//
// app.controller('EduAndExpController', function ($scope) {
// $scope.edu = [
// {id: 1, university: "RUPP University", sYear: "2010-02-02", eYear:
// "2014-02-02", major: "MIS", des: "Add Des HereAdd Des HereAdd Des HereAdd Des
// HereAdd Des HereAdd Des Here"},
// {id: 2, university: "SETEC Intitute", sYear: "2010-02-02", eYear:
// "2014-02-02", major: "Computer Science", des: "Add Des Here Add Des Here Add
// Des HereAdd Des HereAdd Des HereAdd Des HereAdd Des HereAdd Des HereAdd Des
// HereAdd Des HereAdd Des HereAdd Des HereAdd Des HereAdd Des HereAdd Des Here
// "},
// {id: 3, university: "NORTON University", sYear: "2010-02-02", eYear:
// "2014-02-02", major: "Software Engineer", des: "Add Des Here"}
// ];
//
// $scope.curJob = [
// {id: 1, institution: "World Bank", contactPhone: "023 400 949", email:
// "worldBank@gmail.com", address: "Boeung Kak II, Toul Kork, Phnom Penh",
// position: "DBA", salary: 850},
// {id: 2, institution: "Blue Technology", contactPhone: "023 450 343", email:
// "blueTech@gmail.com", address: "Boeung Kak II, Toul Kork, Phnom Penh",
// position: "Spring Developer", salary: 950}
// ];
//
// $scope.exp = [
// {id: 1, institution: "ANZ Bank", contactPhone: "023 400 949", email:
// "worldBank@gmail.com", startDate: "2013-02-30", endDate: "2014-02-30",
// position: "DBA"},
// {id: 2, institution: "BIZ Technology", contactPhone: "023 450 343", email:
// "bizTech@gmail.com", startDate: "2014-02-30", endDate: "2015-02-30",
// position: "Spring Developer"},
// {id: 2, institution: "PNN TV Station", contactPhone: "023 450 343", email:
// "PNNTV@gmail.com", startDate: "2015-02-30", endDate: "2016-02-30", position:
// "Spring Developer"}
// ];
//
// $scope.getUpdate = function (expandedu, obj) {
// console.log(expandedu);
// $scope.modeUpdate = true;
// $scope.modeInsert = false;
// if (obj === "ed") {
// $scope.mode = "edu";
// $scope.uid = expandedu.ed.id;
// $scope.uPlace = expandedu.ed.place;
// $scope.uSYear = expandedu.ed.sYear;
// $scope.uEYear = expandedu.ed.eYear;
// $scope.uDes = expandedu.ed.des;
// } else {
// $scope.mode = "exp";
// $scope.uid = expandedu.ex.id;
// $scope.uPlace = expandedu.ex.place;
// $scope.uSYear = expandedu.ex.sYear;
// $scope.uEYear = expandedu.ex.eYear;
// $scope.uDes = expandedu.ex.des;
// }
//
// };
//
// $scope.updateEduAndExp = function () {
// if ($scope.mode === "edu") {
// for (var i = 0; $scope.edu.length; i++) {
// if ($scope.edu[i].id === $scope.uid) { // problem is here ;/ but solve
// $scope.edu[i].place = $scope.uPlace;
// $scope.edu[i].sYear = $scope.uSYear;
// $scope.edu[i].eYear = $scope.uEYear;
// $scope.edu[i].des = $scope.uDes;
//
// $scope.uPlace = "";
// $scope.uSYear = "";
// $scope.uEYear = "";
// $scope.uDes = "";
// break;
// }
// }
// } else {
// for (var i = 0; $scope.exp.length; i++) {
// if ($scope.exp[i].id === $scope.uid) {
// $scope.exp[i].place = $scope.uPlace;
// $scope.exp[i].sYear = $scope.uSYear;
// $scope.exp[i].eYear = $scope.uEYear;
// $scope.exp[i].des = $scope.uDes;
//
// $scope.uPlace = "";
// $scope.uSYear = "";
// $scope.uEYear = "";
// $scope.uDes = "";
// break;
// }
// }
// }
// };
//
// $scope.deleteEduAndExp = function (education, mode) {
// if (mode === "edu") {
// for (var i = 0; $scope.edu.length; i++) {
// if ($scope.edu[i].id === education.ed.id) {
// $scope.edu.splice(i, 1);
// break;
// }
// }
// } else {
// for (var i = 0; $scope.exp.length; i++) {
// if ($scope.exp[i].id === education.ex.id) {
// $scope.exp.splice(i, 1);
// break;
// }
// }
// }
// };
//
// $scope.insertEduAndExp = function () {
// var obj = {
// id: $scope.edu.length+1, // just cheat
// place: $scope.uPlace,
// sYear: $scope.uSYear,
// eYear: $scope.uEYear,
// des: $scope.uDes
// };
// if ($scope.mode === "edu") {
// $scope.edu[$scope.edu.length] = obj;
// } else {
// obj.id = $scope.exp.length+1;
// $scope.exp[$scope.exp.length] = obj;
// }
// };
//
// $scope.insertMode = function (patt) {
// $scope.modeInsert = true;
// $scope.modeUpdate = false;
// $scope.mode = patt;
// };
//
// $scope.getUpdateExpAndExp = function (experience) {
// $scope.uPlace = experience.ex.place;
// $scope.uSYear = experience.ex.sYear;
// $scope.uEYear = experience.ex.eYear;
// $scope.uDes = experience.ex.des;
// };
//
// });
//
// app.controller('SkillController', function ($scope) {
//
// /* $scope.mainSkills = [
// {SCateID: 1, SCateName: "Programming", Description: ""},
// {SCateID: 2, SCateName: "Database", Description: ""}
// ];
//
// $scope.subSkill = [
// {SID: 1, SName: "JAVA", Description: "", SCateID: 1},
// {SID: 2, SName: "SQLServer", Description: "", SCateID: 2},
// {SID: 3, SName: "ORACLE", Description: "", SCateID: 2},
// {SID: 4, SName: "ASP.Net", Description: "", SCateID: 1},
// {SID: 5, SName: "PHP", Description: "", SCateID: 1},
// {SID: 6, SName: "C#", Description: "", SCateID: 1}
// ];*/
//
// $scope.expertSkill = [
// {id: 1, exSkill: "JAVA", mention: "High", level: 75, mainSkill:
// "Programming"},
// {id: 2, exSkill: "SQLServer", mention: "High", level: 75, mainSkill:
// "Database"},
// {id: 3, exSkill: "ORACLE", mention: "Midium", level: 50, mainSkill:
// "Database" },
// {id: 4, exSkill: "ASP.Net", mention: "Low", level: 25, mainSkill:
// "Programming"}
// ];
//    
// /* $scope.insertSkill = function(){
// verifySkillLevel();
// var obj = {
// id: $scope.expertID,
// exSkill: $scope.skill.SName,
// mention: $scope.skillMention,
// level: $scope.skillLevel
// };
// $scope.expertSkill[$scope.expertSkill.length] = obj;
// }
//
// $scope.update = function(){
// verifySkillLevel();
// var obj = {
// id: $scope.expertID,
// exSkill: $scope.skill.SName,
// mention: $scope.skillMention,
// level: $scope.skillLevel
// };
// console.log($scope.expertID);
// $scope.expertSkill[$scope.expertID-1] = obj;
// }
//
// $scope.delete = function(id){
// $scope.expertSkill.splice(id-1, 1);
// }
//
// function verifySkillLevel(){
// if($scope.skillLevel === 20){
// $scope.skillMention = "Fair";
// }else if($scope.skillLevel === 40){
// alert(1);
// $scope.skillMention = "Average";
// }else if($scope.skillLevel === 60){
// $scope.skillMention = "Good";
// }else{
// $scope.skillMention = "Perfect";
// }
// }
//
// $scope.getUpdate = function(k){ // k = skill , update skill
// console.log(k);
// findLevelSkill(k);
// findMainAndSubSkill(k);
// };
//
// function findLevelSkill(k){
// //Find Level
// $scope.expertID = k.eSkill.id;
// $scope.skill = k.eSkill.exSkill;
// $scope.skillLevel = k.eSkill.level;
//
// if($scope.skillLevel == $("#option1").val()){
// $scope.fair = true;
// $scope.average = false;
// $scope.good = false;
// $scope.perfect =false;
// }else if($scope.skillLevel == $("#option2").val()){
// $scope.fair = false;
// $scope.average = true;
// $scope.good = false;
// $scope.perfect = false;
// }else if($scope.skillLevel == $("#option3").val()){
// $scope.fair = false;
// $scope.average = false;
// $scope.good = true;
// $scope.perfect = false;
// }else{
// $scope.fair = false;
// $scope.average = false;
// $scope.good = false;
// $scope.perfect = true;
// }
// }
//
// function findMainAndSubSkill(k){
// //Find Category
// for(var i = 0; i < $scope.subSkill.length; i++){
// console.log(k.eSkill.exSkill + "===" + $scope.subSkill[i].SName);
// if(k.eSkill.exSkill === $scope.subSkill[i].SName){ // match skill name
// for(var j = 0; j < $scope.mainSkills.length; j++){ // find its master
// if($scope.subSkill[i].SCateID === $scope.mainSkills[j].SCateID){
// //main place to do.....
// $scope.MSID = $scope.mainSkills[j]; // match main skill name
// $scope.skill = $scope.subSkill[i]; // match skill name
// //main place to do.....
// break;
// }
// }
// }
// }
// }
// */
// });
//
//
// app.controller("languageController", function($scope){
// /*$scope.language = [
// {LID: 1, LName: "Khmer", Des: ""},
// {LID: 2, LName: "English", Des: ""},
// {LID: 3, LName: "Korean", Des: ""},
// {LID: 4, LName: "Japanse", Des: ""},
// {LID: 5, LName: "Russain", Des: ""},
// {LID: 6, LName: "Spainish", Des: ""}
// ];*/
//	
// $scope.expertLanguage = [
// {id: 1, exLang: "English", mention: "High", level: 75},
// {id: 2, exLang: "KHMER", mention: "High", level: 75},
// {id: 3, exLang: "Japanse", mention: "Midium", level: 50}
// ];
//	
// /*$scope.getUpdate = function(lang) {
// console.log(lang);
// }
//	
// $scope.insertLanguage = function() {
// $scope.LID = $scope.expertLanguage.length+1;
// $scope.ELName = $scope.LANG.LName;
//		
// var obj = {ELID: $scope.LID,
// ELName: $scope.ELName,
// ELSpeaking: $scope.SL,
// ELListening: $scope.LL,
// ELWriting: $scope.WL,
// ELReading: $scope.RL};
//	
// $scope.expertLanguage[$scope.expertLanguage.length] = obj;
// }
//	
// $scope.getUpdate = function(EL){
// matchLanguageName(EL);
// matchSWLR(EL);
// setLanguageLevel(EL);
// }
//	
// $scope.updateLanguage = function() {
// var obj = {ELID: $scope.ELID,
// ELName: $scope.LANG.LName,
// ELSpeaking: $scope.SL,
// ELListening: $scope.LL,
// ELWriting: $scope.WL,
// ELReading: $scope.RL};
// console.log(obj);
// $scope.expertLanguage[$scope.ELID-1] = obj;
// }
//	
// $scope.deleteLanguage = function(id) {
// console.log(id);
// $scope.expertLanguage.splice(id-1, 1);
// }
//	
// function matchLanguageName(EL) {
// $scope.ELID = EL.el.ELID;
// for(var i = 0; i < $scope.language.length; i++){
// if(EL.el.ELName === $scope.language[i].LName){
// $scope.LANG = $scope.language[i];
// break;
// }
// }
// }
//	
// function setLanguageLevel(EL) {
// $scope.SL = EL.el.ELSpeaking;
// $scope.LL = EL.el.ELListening;
// $scope.WL = EL.el.ELWriting;
// $scope.RL = EL.el.ELReading;
// }
//	
// function matchSWLR(EL) {
//		
// // Speaking
// if(EL.el.ELSpeaking == "Fair"){
// $scope.sFair = true; $scope.sAverage = false; $scope.sGood = false;
// $scope.sPerfect = false;
// }else if(EL.el.ELSpeaking == "Average"){
// $scope.sFair = false; $scope.sAverage = true; $scope.sGood = false;
// $scope.sPerfect = false;
// }else if(EL.el.ELSpeaking == "Good"){
// $scope.sFair = false; $scope.sAverage = false; $scope.sGood = true;
// $scope.sPerfect = false;
// }else{
// $scope.sFair = false; $scope.sAverage = false; $scope.sGood = false;
// $scope.sPerfect = true;
// }
//		
// // Listening
// if(EL.el.ELListening == "Fair"){
// $scope.lFair = true; $scope.lAverage = false; $scope.lGood = false;
// $scope.lPerfect = false;
// }else if(EL.el.ELListening == "Average"){
// $scope.lFair = false; $scope.lAverage = true; $scope.lGood = false;
// $scope.lPerfect = false;
// }else if(EL.el.ELListening == "Good"){
// $scope.lFair = false; $scope.lAverage = false; $scope.lGood = true;
// $scope.lPerfect = false;
// }else{
// $scope.lFair = false; $scope.lAverage = false; $scope.lGood = false;
// $scope.lPerfect = true;
// }
//		
// // Writing
// if(EL.el.ELWriting == "Fair"){
// $scope.wFair = true; $scope.wAverage = false; $scope.wGood = false;
// $scope.wPerfect = false;
// }else if(EL.el.ELWriting == "Average"){
// $scope.wFair = false; $scope.wAverage = true; $scope.wGood = false;
// $scope.wPerfect = false;
// }else if(EL.el.ELWriting == "Good"){
// $scope.wFair = false; $scope.wAverage = false; $scope.wGood = true;
// $scope.wPerfect = false;
// }else{
// $scope.wFair = false; $scope.wAverage = false; $scope.wGood = false;
// $scope.wPerfect = true;
// }
//		
// // Reading
// if(EL.el.ELReading == "Fair"){
// $scope.rFair = true; $scope.rAverage = false; $scope.rGood = false;
// $scope.rPerfect = false;
// }else if(EL.el.ELReading == "Average"){
// $scope.rFair = false; $scope.rAverage = true; $scope.rGood = false;
// $scope.rPerfect = false;
// }else if(EL.el.ELReading == "Good"){
// $scope.rFair = false; $scope.rAverage = false; $scope.rGood = true;
// $scope.rPerfect = false;
// }else{
// $scope.rFair = false; $scope.rAverage = false; $scope.rGood = false;
// $scope.rPerfect = true;
// }
// }*/
//	
// });
//
// app.controller('jobExpectaion', function ($scope, $http) {
// $scope.jobExpectation = [
// {id: 1, postion: "Adroid Developer", minSalary: 500, maxSalary: 800,
// location: "Phnom Penh"},
// {id: 2, postion: "Spring Developer", minSalary: 800, maxSalary: 1500,
// location: "Phnom Penh"}
// ];
// });
//
// app.controller('documentController', function ($scope, $http) {
//	
// });
