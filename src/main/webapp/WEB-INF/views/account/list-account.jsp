	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ page import="org.springframework.data.domain.Page" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Account List</title>
	<jsp:include page="../_shared.jsp"></jsp:include>

</head>

<body>
	<jsp:include page="../_navbar.jsp"></jsp:include>
	<input type="hidden" id="username" />
	<div id="alert-container" class="d-flex flex-column justify-content-center">
		
	</div>
	<div class="container">
		
		<div class="table-container-outside">
			<div class="title-table">List Account</div>
			<div class="d-flex justify-content-end">
				<a href="/account/create" class="btn btn-success" id="create-button">
					Create <i class="fa fa-plus" aria-hidden="true"></i>
				</a>
			</div>
			<div class="detail-table">
				<div class="table-container-inside table-responsive">
					<table class="table table-striped" id="account-table">
						<thead>
							<tr>
								<th scope="col">User Name</th>
								<th scope="col">Full Name</th>
								<th scope="col">Phone Number</th>
								<th>Role</th>
								<th>Status</th>
								<th></th>
							</tr>
						</thead>

						<tbody id="account-list">
							<c:if test="${ empty accountList}">
								<tr>
									<td colspan="6" class="text-center text-danger">Nothing to show</td>
								</tr>
							</c:if>
							<c:forEach var="account" items="${ accountList }">
								<c:set var="person" value="${ account.doctor }"></c:set>
								<tr>
									<td scope="row">${ account.username }</td>
									<td>${ person.name }</td>
									<td>${ person.phoneNumber }</td>
									<td>${ account.role }</td>
									<td>${ account.enable ? 'Enabled' : 'Disabled' }</td>
									<td class="group-action">
										<c:if test="${ currentAccount != account.username }">
										<c:if test="${account.enable}">
											<a type="button" class="btn btn-warning btn-toggle-account-modal">
												<i class="fa fa-toggle-on" aria-hidden="true"></i>
											</a>
										</c:if>
										<c:if test="${ not account.enable}">
											<a type="button" class="btn btn-info btn-toggle-account-modal">
												<i class="fa fa-toggle-off" aria-hidden="true"></i>
											</a>
										</c:if>
										</c:if>
									</td>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
			</div>

			<nav aria-label="Page navigation example" class="mt-3 d=flex">

				<div class="float-left mt-3" aria-label="Page ${ currentPage } among ${ totalPage } page(s)">Page
					${ currentPage } among ${ totalPage } page(s)</div>
				<ul class="pagination justify-content-end ali">
					<!-- Previous button -->
					<c:if test="${ currentPage > 1 }">
						<li class="page-item"><a class="page-link" href="/account?page=${ currentPage - 1 }"
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
						<li class="page-item"><a class="page-link" href="/account?page=${pageNumber}">${
								pageNumber
								}</a></li>
					</c:forEach>


					<!-- Next Button -->
					<c:if test="${ currentPage < totalPage }">
						<li class="page-item"><a class="page-link" href="/account?page=${ currentPage + 1 }"
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
	<div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalLabel">...</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="btn-toggle-account">Toggle</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Javascript -->
	<script type="text/javascript" src="/js/account/toggle-account.js"></script>
	<script type="text/javascript" src="/js/_alert/alert.js"></script>
</body>

</html>