	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
		<%@ page import="org.springframework.data.domain.Page" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Health Record List</title>
	<jsp:include page="../_shared.jsp"></jsp:include>

</head>

<body>
	<jsp:include page="../_navbar.jsp"></jsp:include>
	<c:set var="base" value="health-record"></c:set>
	<input type="hidden" id="health-record-id" />

	<div class="container">

		<div class="table-container-outside">
			<div class="title-table">List Health Record</div>
			<div class="d-flex justify-content-end">
				<a href="/${base}/create" class="btn btn-success" id="create-button">
					Create <i class="fa fa-plus" aria-hidden="true"></i>
				</a>
			</div>
			<div class="detail-table">
				<div class="table-container-inside table-responsive">
					<table class="table table-striped" id="health-record-table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Doctor Name</th>
								<th scope="col">Patient Name</th>
								<th scope="col">Creation Date</th>
								<th scope="col">Re Date</th>
								<th></th>
							</tr>
						</thead>

						<tbody id="health-record-list">
							<c:if test="${ empty healthRecordList}">
								<tr>
									<td colspan="6" class="text-center text-danger">Nothing to show</td>
								</tr>
							</c:if>	
							<c:forEach var="healthRecord" items="${ healthRecordList }">
									<th scope="row">${ healthRecord.id }</th>
									<td>${ healthRecord.doctor.name }</td>
									<td>${ healthRecord.patient.name }</td>
									<td>
										${ healthRecord.creationDate }
									</td>
									<td>
										${ healthRecord.reDate }
									</td>
									<td class="group-action">
										<a href="/${base}/view/${ healthRecord.id }" type="button"
											class="btn btn-secondary"> <i class="fa fa-eye"
												aria-hidden="true"></i></a>
										<a href="/${base}/update/${ healthRecord.id }" type="button"
											class="btn btn-primary">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
										</a>
										
                                   		<c:if test="${ isAdmin }">
											<a onclick="deleteTestFormModal(this)" type="button" class="btn btn-danger">
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
						<li class="page-item"><a class="page-link" href="/${base}/list?page=${ currentPage - 1 }"
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
						<li class="page-item"><a class="page-link" href="/${base}/list?page=${pageNumber}">${
								pageNumber }</a></li>
					</c:forEach>


					<!-- Next Button -->
					<c:if test="${ currentPage < totalPage }">
						<li class="page-item"><a class="page-link" href="/${base}/list?page=${ currentPage + 1 }"
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
					<h5 class="modal-title" id="exampleModalLabel">Delete Health Record</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" onclick="deleteTestForm();">Delete</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Javascript -->
	<c:if test="${ isAdmin }">
		<script type="text/javascript" src="/js/${base}/list-health-record.js"></script>
	</c:if>

</body>

</html>