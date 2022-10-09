<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.springframework.data.domain.Page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Admission Form List</title>
	<jsp:include page="../_shared.jsp"></jsp:include>	

</head>

<body>
	<jsp:include page="../_navbar.jsp"></jsp:include>
	
	
	<input type="hidden" id="admission-id" />
	
	<div class="container">

		<div class="table-container-outside">
			<div class="title-table">List Admission</div>
			<div class="d-flex justify-content-end">
				<a href="/admission/create" class="btn btn-success" id="create-button">
					Create <i class="fa fa-plus" aria-hidden="true"></i>
				</a>
			</div>
			<div class="detail-table">
				<div class="table-container-inside table-responsive">
						<table class="table table-striped" id="admission-table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Full Name</th>
									<th scope="col">Address</th>
									<th scope="col">Phone Number</th>
									<th scope="col">Date In</th>
									<th scope="col">Date Out</th>
									<th></th>
								</tr>
							</thead>

							<tbody id="admission-list">
								<c:if test="${ empty admissionList}">
									<tr>
										<td colspan="7" class="text-center text-danger">Nothing to show</td>
									</tr>
								</c:if>
								<c:forEach var="admission" items="${ admissionList }">
									<c:set var="patient" value="${ admission.patient }"></c:set>
				 					<tr>
										<th scope="row">${ admission.id }</th>
										<td>${ patient.name }</td>
										<td>${ patient.address }</td>
										<td>${ patient.phoneNumber }</td>
										<td>
											<fmt:formatDate value="${ admission.dateIn }" type="date" />
										</td>
										<td>
											<fmt:formatDate value="${ admission.dateOut }" type="date" />
										</td>
										<td class="group-action">
											<a href="/admission/view/${ admission.id }" type="button"
												class="btn btn-secondary"> <i class="fa fa-eye"
													aria-hidden="true"></i></a>
											<a href="/admission/update/${ admission.id }" type="button"
												class="btn btn-primary">
												<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											</a>
											
											<c:if test="${ isAdmin }">
												<a onclick="deletePatientModal(this)" type="button" class="btn btn-danger">
													<i class="fa fa-trash-o" aria-hidden="true"></i>
												</a>
											</c:if>
										</td>
									</tr>

								</c:forEach>
							</tbody>

						</table>
				</div>


			</div>
			<p></p>
			<nav aria-label="Page navigation example" class="mt-3 d=flex">

				<div class="float-left mt-3" aria-label="Page ${ currentPage } among ${ totalPage } page(s)">
					Page ${ currentPage } among ${ totalPage } page(s)
				</div>
				<ul class="pagination justify-content-end ali">
					<!-- Previous button -->
					<c:if test="${ currentPage > 1 }">
						<li class="page-item"><a class="page-link" href="/admission/list?page=${ currentPage - 1 }"
								aria-label="Previous">
								<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
							</a></li>
					</c:if>


					<!-- 5 page begin from currentPage -->
					<c:set var="end" value="${ currentPage + 5 }"></c:set>
					<c:if test="${ end > totalPage }">
						<c:set var="end" value="${ totalPage }"></c:set>
					</c:if>
					<c:forEach var="pageNumber" begin="${ currentPage }" end="${ end }">
						<li class="page-item"><a class="page-link" href="/admission/list?page=${pageNumber}">${
								pageNumber }</a></li>
					</c:forEach>


					<!-- Next Button -->
					<c:if test="${ currentPage < totalPage }">
						<li class="page-item"><a class="page-link" href="/admission/list?page=${ currentPage + 1 }"
								aria-label="Next">
								<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a></li>
					</c:if>

				</ul>
			</nav>

		</div>
	</div>
	<jsp:include page="../_footer.jsp"></jsp:include>
	
	<!-- Modal -->
	<div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Delete Admission</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" onclick="deleteAdmission();">Delete</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Javascript -->
	<c:if test="${ isAdmin }">
		<script type="text/javascript" src="/js/admission/list-admission.js"></script>
	</c:if>
</body>

</html>