<%@page import="util.DefineUtil"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V4</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" action=""  method="post">
					<span class="login100-form-title p-b-49" style="color : #9b4ad3">
						LOGIN
					</span>
						<%
				       String msg=request.getParameter("msg");
				       if ("1".equals(msg)){
				        	out.print("<span style=\"font-style:italic;color:red; padding:5px\">Username và Password không đúng</span>");
				        }
				    	%>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" placeholder="Type your username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="pass" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<div class="container-login100-form-btn" style="margin : 10px" >
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" >
								Login
							</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/daterangepicker/moment.min.js"></script>
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/<%=DefineUtil.URL_AUTH %>/js/main.js"></script>

</body>
</html>