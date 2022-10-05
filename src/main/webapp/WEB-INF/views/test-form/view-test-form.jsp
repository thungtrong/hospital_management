	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<jsp:include page="../_shared.jsp"></jsp:include>
	<title>View Test Form</title>
	<link rel="stylesheet" href="/css/test_form.css" type="text/css">
</head>

<body>
	<jsp:include page="../_navbar.jsp"></jsp:include>
	<div class="container">
		<div class="form-container-outside">
			<div class="title-form">Create Test Form</div>
			<div class="detail-form">
				<div class="form-container-inside">
					<div class="sub-title-container d-flex justify-content-start mb-3">
						<h5>Patient Information</h5>
					</div>

					<div class="detail-test-form">
						<form id="test-form" name="test-form" autocomplete="off">
							<input type="hidden" name="testFormId" value="${ testForm.id }" disabled>
							<c:set var="patient" value="${ testForm.patient }"></c:set>
							<div class="col">
								<input type="hidden" name="patientId" value="${ patient.id }">
								<div class="item">
									<label for="name" class="text-label">Patient name</label>
									<input type="text" name="name" id="name" class="input text-input"
										placeholder="Eg: John Doe" disabled value="${ patient.name }">
									<label for="name" class="error-msg text-danger" id="name-error"></label>
								</div>
								<div class="item">
									<label for="gender" class="text-label">Gender</label>
									<select name="gender" class="input" disabled>
										<option value="true" ${ patient.gender==true ? 'selected' :'' }>
											Female</option>
										<option value="false" ${ patient.gender==false ? 'selected' :'' }>
											Male</option>
									</select>
									<label for="gender" class="error-msg text-danger" id="gender-error"></label>
								</div>
							</div>
							<div class="col">
								<div class="item">
									<label for="dateOfBirth" class="text-label">Day of Birth</label>
									<input type="date" name="dateOfBirth" id="birth" class="input text-input"
										placeholder="Eg: 22/7/1990" value="${ patient.dateOfBirth }" disabled>
									<label for="dateOfBirth" class="error-msg text-danger"
										id="dateOfBirth-error"></label>
								</div>
								<div class="item">
									<label for="phoneNumber" class="text-label">Phone Number</label>
									<input type="text" name="phoneNumber" id="phoneNumber" class="input text-input"
										placeholder="Eg: 0918464495" value="${ patient.phoneNumber }" disabled>
									<label for="phoneNumber" class="error-msg text-danger"
										id="phoneNumber-error"></label>
								</div>
							</div>
							<div class="col">
								<div class="item">
									<label for="address" class="text-label">Address</label>
									<input type="text" name="address" id="address" class="input text-input"
										placeholder="Eg: Ho Chi Minh city, Viet Nam" value="${ patient.address }"
										disabled>
									<label for="address" class="error-msg text-danger" id="address-error"></label>
								</div>
								<div class="item">
									<label for="creationDate" class="text-label">Creation Date</label>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${ testForm.creationDate }"
										var="formatDay" />
									<input type="date" name="creationDate" id="creationDate" class="input text-input"
										value="${ formatDay }" disabled>
									<label for="creationDate" class="error-msg text-danger"
										id="creationDate-error"></label>
								</div>
							</div>
							<div class="test-info">
								<div class="test-head">
									<div class="sub-title-container d-flex justify-content-start mb-3">
										<h5>Test Form Details</h5>
									</div>
								</div>
								<div class="test-detail">
									<table class="table table-striped p-3" id="test-form-detail-table">
										<thead>
											<tr>
												<th>Test Name</th>
												<th>Normal Result</th>
												<th>Result</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="list-test-form-detail">
											<c:set var="details" value="${ testForm.details }"></c:set>
											<c:if test="${ empty details  }">
												<tr class="nothing">
													<td class="text-center" colspan="4">Nothings to show
													</td>
												</tr>
											</c:if>
											<c:if test="${ not empty details  }">
												<c:forEach var="detail" items="${ details }">
													<tr>
														<td>${detail.test.testName}</td>
														<td>${detail.test.normalResult}</td>
														<td class="test-form-detail-data">
															<input type="hidden" value="${detail.test.id}" disabled>
															<input class="input" type="text" name="result"
																placeholder="Fill test result"
																value="${ detail.result }" disabled>
															<input type="hidden" value="${detail.id}" disabled>
														</td>
														<td>
															<button type="button" class="btn-remove-row"><i
																	class="fa fa-times" aria-hidden="true"></i></button>
														</td>
													</tr>
												</c:forEach>
											</c:if>

										</tbody>

									</table>

								</div>
							</div>
					</div>

					<div class="item d-flex justify-content-end mt-3">
						<button type="button" id="cancel" class="btn btn-light ml-2" onclick="goBack()">Back</button>
					</div>
					</form>
				</div>
			</div>

		</div>

	</div>
	</div>


	<!-- Javascript -->
	<script type="text/javascript" src="/js/test-form/view-test-form.js"></script>
</body>

</html>