<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.data.domain.Page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="../_shared.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="../_navbar.jsp"></jsp:include>

	<div class="container">

		<div class="table-container-outside">
			<div class="title-table">List Patient</div>
			<div class="detail-table">
				<div class="table-container-inside table-responsive">
					<c:if test="${patientListSize == 0 }">
						<h2>No things to show</h2>
					</c:if>
					<c:if test="${ patientListSize != 0 }">
						<table class="table table-striped">
							<tr>
								<th scope="col">#</th>
								<th scope="col">First</th>
								<th scope="col">Last</th>
								<th scope="col">Handle</th>
							</tr>
							<!-- <c:forEach var="patient" items="${ patientList }">
								<tr>
									<th scope="row">${ patient.id }</th>
									<td>${ patient.name }</td>
									<td>${ patient.address }</td>
									<td>${ patient.phoneNumber }</td>
								</tr>
								
							</c:forEach>-->

							<c:forEach var="i" begin="0" end="20">
								<tr>
									<th scope="row">2</th>
									<td>Patient One</td>
									<td>Ho Chi Minh city</td>
									<td>0987654321</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>


			</div>
			<p></p>
			<nav aria-label="Page navigation example" class="mt-3 d=flex">



				<div class="float-left mt-3"
					aria-label="Page ${ currentPage + 1 } among ${ totalPage } page(s)">Page
					${ currentPage + 1 } among ${ totalPage } page(s)</div>
				<ul class="pagination justify-content-end ali">

					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>

		</div>


	</div>
</body>
</html>