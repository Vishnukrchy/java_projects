
<%@page import="com.dao.CartDAO"%>

<%@page import="com.db.DBConnect"%>
<%@page import="com.entites.Movies"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.MoviesDAO"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All VCD</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid p-5" style="background-color: #f0f1f2;">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<form action="movie_search.jsp" method="post">
					<div class="input-group">
						<input type="text" class="form-control" name="ch">
						<button class="btn bg-custom ms-2 text-white">Search</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12 p-0">
				<p class="fs-3 text-center">All VCD</p>
				<c:if test="${not empty errorMsg}">
					<p class="fs-5 text-center text-danger">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>
				<c:if test="${not empty succMsg}">
					<div class="alert alert-success text-center" role="alert">${succMsg}</div>
					<c:remove var="succMsg" scope="session" />
				</c:if>
				<c:if test="${not empty errorMsg}">
					<p class="fs-5 text-center text-danger">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>
				<c:if test="${not empty succMsg}">
					<div class="alert alert-success text-center" role="alert">${succMsg}</div>
					<c:remove var="succMsg" scope="session" />
				</c:if>
				<div class="row">


					<%
					String ch = request.getParameter("ch");
								MoviesDAO dao = new MoviesDAO(DBConnect.getConn());
								List<Movies> list = dao.getAllMoviesBySeach(ch);
								for (Movies m : list) {
					%>
					<div class="col-md-3">
						<div class="card paint-card mt-2">
							<div class="card-body text-center">
								<img alt="" src="movies_img/<%=m.getImg()%>" height="170px"
									width="100%">

								<h4><%=m.getMoviesName()%></h4>
								<p class="fs-7">
									Category:
									<%=m.getCategory()%><br> Price :
									<%=m.getCost()%>
								</p>
								<a href="view_movie.jsp?id=<%=m.getId()%>"
									class="btn btn-primary btn-sm">View</a>


								<c:if test="${empty userObj }">
									<a href="login.jsp" class="btn btn-danger btn-sm">Add To
										Cart</a>
								</c:if>
								<c:if test="${not empty userObj }">

									<%
									User user = (User) session.getAttribute("userObj");
																CartDAO dao2 = new CartDAO(DBConnect.getConn());
																if (dao2.checkCart(m.getId(), user.getId())) {
									%>
									<button disabled class="btn btn-danger btn-sm">Added
										To Cart</button>
									<%
									} else {
									%>
									<a href="cart?mid=<%=m.getId()%>&&uid=${userObj.id}&&pg=all"
										class="btn btn-danger btn-sm">Add To Cart</a>
									<%
									}
									%>


								</c:if>



							</div>
						</div>
					</div>
					<%
					}
					%>





				</div>

			</div>
		</div>
	</div>

	<div style="margin-top: 50px">
		<%@include file="component/footer.jsp"%>
	</div>




</body>
</html>