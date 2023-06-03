<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bank: Open Account</title>

<%@include file="all_component/allCss_file.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}

.error {
	color: red;
}
</style>
</head>
<body style="background-color: #DCDCDC">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${not empty SucessMsg}">
		<div class="alert alert-warning text-center" role="alert">
			<i class="fas fa-clock "></i>${SucessMsg}</div>
		<c:remove var="SucessMsg" scope="session" />
	</c:if>
	<c:if test="${not empty ErrorMsg}">
		<div class="alert alert-warning text-center" role="alert">
			<i class="fas fa-clock "></i>${ErrorMsg}</div>
		<c:remove var="ErrorMsg" scope="session" />
	</c:if>

	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-body">
						<form action="create_account" method="post" id="register"
							novalidate>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">First Name</label> <input name="fn"
										type="text" class="form-control" 
										placeholder="First Name" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Last Name</label> <input name="ln"
										type="text" class="form-control" 
										placeholder="Last Name" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input name="em"
										type="email" class="form-control" 
										placeholder="Email" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="Phonenumber">Phone Number</label> <input
										type="number" class="form-control" name="ph"
										required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">DOB</label> <input name="dob"
										type="date" class="form-control" 
										placeholder="dd-mm-yyyy" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Adhar Number</label> <input
										name="adh" type="number" class="form-control"
										 placeholder="" required="required">
								</div>
							</div>


							<div class="form-group">
								<label for="inputAddress">Address</label> <input name="add"
									type="text" class="form-control" 
									required="required">
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input name="city"
										type="text" class="form-control" 
										required="required">
								</div>
								<div class="form-group col-md-4">
									<label for="inputCity">State</label> <input name="st"
										type="text" class="form-control" 
										required="required">
								</div>
								<div class="form-group col-md-2">
									<label for="inputZip">Zip</label> <input type="number"
										required="required" class="form-control" name="zip">
								</div>
							</div>
							<div class="form-group">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" 
										name="check"> <label class="form-check-label"
										for="gridCheck"> Agree Terms & Condition </label>
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Sign in</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 100px;">
		<%@include file="/all_component/footer.jsp"%>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>