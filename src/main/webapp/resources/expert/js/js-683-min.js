/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
	
    $("#c-nav").addClass("nav-effect");
    $("#logo").hide();
    setULRight();
    setSubNavImgHide(false);
    
    
    if ($(window).innerWidth() < 950) {
    	$("#alwaysTop").css("margin-top", "20px");
    } else {
    	$("#alwaysTop").css("margin-top", "60px");
    }

    $("#c-button").click(function () {
        $("#c-nav ul").toggle();
    });
});

function setImageCenter() {
    var myWidth = $("body").prop("clientWidth");
    $("#image-slide img").css("width", myWidth);
}

function setULCenter() {
    var myScreenWidth = $("body").prop("clientWidth");
    var myUlWidth = $("#c-nav ul").width();
    var myLeft = (myScreenWidth - myUlWidth) / 2;
    $("#c-nav ul").css("marginRight", myLeft);
}

function setULRight() {
    var myScreenWidth = $("body").prop("clientWidth");
    var myUlWidth = $("#c-nav ul").width();
    var myLeft = (myScreenWidth - myUlWidth) / 2;
    $("#c-nav ul").css("marginRight", "10px");
}


function whenSizeChanged() {
    $("#image-slide img").css("width", "100%");
    $("#c-nav ul").show();
    if ($(window).innerWidth() < 950) {
        setSubNavImgHide(false);
        $("#c-nav ul").hide();
        $("#c-nav").css("position", "fixed");
    } else {

        $("#c-nav").addClass("nav-effect");
        $("#logo").hide();
        setULRight();
        setSubNavImgHide(true);
    }
}

function setSubNavImgHide(bool) {
    if (bool === true) {
        $("#sub-c-nav").hide();
    } else {
        $("#sub-c-nav").show();
    }
}

$(window).resize(function () {
    $("#c-nav ul").show();
    if ($(window).innerWidth() < 950) {
    	$("#alwaysTop").css("margin-top", "20px");
        setSubNavImgHide(false);
        $("#c-nav ul").hide();
        $("#c-nav").css("position", "fixed");
    } else {
    	$("#alwaysTop").css("margin-top", "60px");
        setULCenter();
        setSubNavImgHide(true);
    }

    if ($(window).innerWidth() < 950) {

    } else {
        $("#c-nav").addClass("nav-effect");
            $("#logo").hide();
            setULRight();
            setSubNavImgHide(false);
    }
});

