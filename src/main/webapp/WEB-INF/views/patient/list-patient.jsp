<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.data.domain.Page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient List</title>
<jsp:include page="../_shared.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="../_navbar.jsp"></jsp:include>
	<div class="container">

		<div class="table-container-outside">
			<div class="title-table">List Patient</div>
			<div class="d-flex justify-content-end">
				<a href="/patient/create" class="btn btn-success" id="create-button">
					Create <i class="fa fa-plus" aria-hidden="true"></i>
				</a>
			</div>
			<div class="detail-table">
				<div class="table-container-inside table-responsive">
					<c:if test="${patientListSize == 0 }">
						<h2>No things to show</h2>
					</c:if>
					<c:if test="${ patientListSize != 0 }">
						<table class="table table-striped">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Full Name</th>
								<th scope="col">Address</th>
								<th scope="col">Phone Number</th>
								<th scope="col">Date of birth</th>
								<th></th>
							</tr>
							<c:forEach var="patient" items="${ patientList }">
								<tr>
									<th scope="row">${ patient.id }</th>
									<td>${ patient.name }</td>
									<td>${ patient.address }</td>
									<td>${ patient.phoneNumber }</td>
									<td><fmt:formatDate value="${ patient.dateOfBirth }"
											type="date" /></td>
									<td class="group-action">
									<!-- <a href="/patient/view/${ patient.id }"
										type="button" class="btn btn-secondary"> <i
											class="fa fa-eye" aria-hidden="true"></i>
									</a> -->
									 <a href="/patient/update/${ patient.id }" type="button"
										class="btn btn-primary"> <i class="fa fa-pencil-square-o"
											aria-hidden="true"></i>
									</a> <a onclick="deletePatient(${patient.id})" type="button" class="btn btn-danger"> <i
											class="fa fa-trash-o" aria-hidden="true"></i>
									</a></td>
								</tr>

							</c:forEach>


						</table>
					</c:if>
				</div>


			</div>
			<p></p>
			<nav aria-label="Page navigation example" class="mt-3 d=flex">

				<div class="float-left mt-3"
					aria-label="Page ${ currentPage } among ${ totalPage } page(s)">Page
					${ currentPage } among ${ totalPage } page(s)</div>
				<ul class="pagination justify-content-end ali">
					<!-- Previous button -->
					<c:if test="${ currentPage > 1 }">
						<li class="page-item">
						<a class="page-link" href="/patient?page=${ currentPage - 1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
					</li>
					</c:if>
					
					
					<!-- 5 page begin from currentPage -->
					<c:set var="end" value="${ currentPage + 5 }"></c:set>
					<c:if test="${ end > totalPage }">
						<c:set var="end" value="${ totalPage }"></c:set>
					</c:if>
					<c:forEach var="pageNumber" begin="${ currentPage }" end="${ end }">
						<li class="page-item"><a class="page-link" href="/patient?page=${pageNumber}">${ pageNumber }</a></li>
					</c:forEach>
					
					
					<!-- Next Button -->					
					<c:if test="${ currentPage < totalPage }">
						<li class="page-item">
					<a class="page-link" href="/patient?page=${ currentPage + 1 }"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>	
					</c:if>
					
				</ul>
			</nav>

		</div>
	</div>
	
	
</body>
</html>