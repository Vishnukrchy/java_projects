<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TESS-Password Recovery</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@include file="common_nav/link.jsp"%>
<body style="background-color: #eceff1;">
	<div class="loginbox">
		<div class="container padding-bottom-3x mb-2 mt-5">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-md-10">
					<h2 class="display-5">Forgot Your Password?</h2>
					<div class="forgot">
						<p>NO Problem!!! Enter your details and we will share your
							password ....</p>
							<c:if test="${not empty failedMsg}">
						<h5 class="text-center text-danger">${failedMsg}</h5>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

					<c:if test="${not empty succMsg}">
						<h5 class="text-center text-success">Your Password- ${succMsg}</h5>
						<c:remove var="succMsg" scope="session" />
					</c:if>
							
					</div>
					<form class="card mt-4" action="getpass" method="post">
						<div class="card-body">
							<div class="form-group">
								<label for="id">User Id</label> <input class="form-control"
									type="text" id="empid" required name="un">
							</div>
							<div class="form-group">
								<label for="email-for-pass">Enter your email address</label> <input
									class="form-control" type="text" id="email-for-pass" name="em"
									required>
							</div>
						</div>
						<div class="card-footer">
							<button class="btn btn-info" type="submit">Get Password</button></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>