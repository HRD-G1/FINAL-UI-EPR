<%@ page
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>

<!DOCTYPE html ><!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
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
    <!--cutom-->
    <link href="${pageContext.request.contextPath}/resources/experts/css/custom.css" rel="stylesheet" type="text/css">
    <!-- Angular -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.6/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/experts/js/login.js"></script>
    <style>
    	.btn-fb
    	{
    		padding-bottom: 40px;
    	}
    </style>
  	</head>
  <body>

   
    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header ">
          <button type="button" class="navbar-toggle " data-toggle="collapse" data-target="#navbar-ex-collapse">
            <span class="sr-only ">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand">
          		<img alt="EPSEEKER" class="logo" src="${pageContext.request.contextPath}/resources/experts/img/logo11.png">
          	</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
           <li class="menu">
              <a href="/" class="waves-effect waves-light " class="nav-custom"><i class="fa fa-home "></i> ទំព័រដើម</a>
            </li>
            <li class="menu">
              <a href="/contact" class="waves-effect waves-light "><i class="fa fa-phone " ></i> ទំនាក់ទំនង</a>
            </li>
            <li class=" menu">
              <a href="/about" class="waves-effect waves-light"><i class="fa fa-user-secret" ></i> អំពីយើង</a>
            </li>
            
            <li class="menu"><a href="/signup" class="waves-effect waves-light "> <i class="fa fa-user-plus"></i> ចុះឈ្មោះ</a></li>
            <li class=" active menu"><a href="/login" class="waves-effect waves-light "><i class="fa fa-sign-in " ></i> ចូល</a></li>
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
            <div class="panel-heading login-header">ចូលប្រើប្រាស់</div>
            <div class="panel-body">
              <div class="row">
                <form class="col s12 text-center"  method="POST">
                  <div class="row">
                    <div class="input-field col s12">
                      <i class="material-icons prefix">email</i>
                      <input id="icon_prefix" type="email" name="email" required>
                      <label for="icon_prefix" style="font-family: 'khmer os battambang', cursive"; class="login-label">អ៊ីម៉ែល</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <i class="material-icons prefix">vpn_key</i>
                      <input id="icon_prefix" type="password" name="password"  required>
                      <label for="icon_prefix" style="font-family: 'khmer os battambang', cursive"; class="login-label">ពាក្យសម្ងាត់</label>
                    </div>
                  </div>
                  <button class="btn waves-effect waves-light login-header" type="submit">ចូលប្រើ</button>
<!--                   <fb:login-button scope="public_profile, email" onlogin="checkLoginState();" class="btn btn-fb"></fb:login-button> -->
                  <br><br>
                  		<p></p>
                  		<div class="col-md-12"><br>
			    		<p class="well text-center note">បើមិនទាន់មានគណនី សូម <a href="/signup">បង្កើតនៅ ទីនេះ</a>
			    		<br>If you Don't have account yet <a href="/signup">create here!</a></p>
			    	</div><br>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br>
    <br>
   <jsp:include page="expert/fragements/footer/footer.jsp"></jsp:include>  

</body></html>