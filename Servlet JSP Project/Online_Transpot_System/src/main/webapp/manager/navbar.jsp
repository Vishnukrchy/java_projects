
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand text-white" href="index.jsp"><i
			class="fa-solid fa-truck"></i> Transport System</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">



			<!-- start manager navbar  -->

			<c:if test="${managerObj.role == 'manager' }">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<c:if test="${empty userObj }">
						<li class="nav-item"><a class="nav-link" href="add_truck.jsp">Add
								Truck</a></li>
						<li class="nav-item"><a class="nav-link"
							href="view_truck.jsp">View Truck</a></li>
						<li class="nav-item"><a class="nav-link"
							href="book_truck.jsp">Booked Truck</a></li>
						<li class="nav-item"><a class="nav-link"
							href="avail_truck.jsp">Available Truck</a></li>

						<li class="nav-item"><a class="nav-link"
							href="booking.jsp">User Booking</a></li>
					</c:if>

				</ul>


				<!-- end manager navbar  -->


				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

					<li class="nav-item"><a class="nav-link" href="../logout"><i
							class="fas fa-sign-in-alt"></i> Logout</a></li>

				</ul>

			</c:if>

		</div>
	</div>
</nav>