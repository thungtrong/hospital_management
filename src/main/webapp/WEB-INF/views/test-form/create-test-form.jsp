<>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<jsp:include page="../_shared.jsp"></jsp:include>
	<title>Create Test Form</title>
	<link rel="stylesheet" href="/css/test_form.css" type="text/css">
</head>

<body>
	<jsp:include page="../_navbar.jsp"></jsp:include>
	<div class="container">
		<div class="form-container-outside">
			<div class="title-form">Create Test Form</div>
			<div class="detail-form">
				<div class="form-container-inside">
					<div class="sub-title-container d-flex justify-content-between mb-3">
						<h5>Patient Information</h5>
						<button class="btn btn-primary" id="btn-patient">CHANGE</button>
					</div>

					<div class="detail-test-form">
						<form id="test-form" name="test-form" autocomplete="off">
							<div class="col">
								<input type="hidden" name="patientId">
								<div class="item">
									<label for="name" class="text-label">Patient name</label>
									<input type="text" name="name" id="name" class="input text-input"
										placeholder="Eg: John Doe" disabled>
									<label for="name" class="error-msg text-danger" id="name-error"></label>
								</div>
								<div class="item">
									<label for="gender" class="text-label">Gender</label>
									<select name="gender" class="input" disabled>
										<option value="false">Male</option>
										<option value="true">Female</option>
									</select> <label for="gender" class="error-msg text-danger"
										id="gender-error"></label>
								</div>
							</div>
							<div class="col">
								<div class="item">
									<label for="dateOfBirth" class="text-label">Day of Birth</label>
									<input type="date" name="dateOfBirth" id="birth" class="input text-input"
										placeholder="Eg: 22/7/1990" disabled>
									<label for="dateOfBirth" class="error-msg text-danger"
										id="dateOfBirth-error"></label>
								</div>
								<div class="item">
									<label for="phoneNumber" class="text-label">Phone Number</label>
									<input type="text" name="phoneNumber" id="phoneNumber" class="input text-input"
										placeholder="Eg: 0918464495"  disabled>
									<label for="phoneNumber" class="error-msg text-danger"
										id="phoneNumber-error"></label>
								</div>
							</div>
							<div class="col">
								<div class="item">
									<label for="address" class="text-label">Address</label>
									<input type="text" name="address" id="address" class="input text-input"
										placeholder="Eg: Ho Chi Minh city, Viet Nam" disabled>
									<label for="address" class="error-msg text-danger" id="address-error"></label>
								</div>
								<div class="item">
									<label for="creationDate" class="text-label">Creation Date</label>
									 <fmt:formatDate pattern = "yyyy-MM-dd" value = "${toDay}" var="formatDay" />
									<input type="date" name="creationDate" id="creationDate" class="input text-input" value="${ formatDay }">
									<label for="creationDate" class="error-msg text-danger"
										id="creationDate-error" ></label>
								</div>
							</div>
							<div class="test-info">
								<div class="test-head">
									<div class="sub-title-container d-flex justify-content-between mb-3">
										<h5>Test Form Details</h5>
										<button type="button" class="btn btn-primary" id="btn-test-detail">ADD</button>
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
											<tr class="nothing">
												<td class="text-center" colspan="4">Nothings to show</td>
											</tr>

										</tbody>

									</table>

								</div>
							</div>
					</div>

					<div class="item d-flex justify-content-end mt-3">
						<button type="button" id="submit" class="btn btn-primary">Save</button>
						<button type="button" id="cancel" class="btn btn-light ml-2" onclick="goBack()">Back</button>
					</div>
					</form>
				</div>
			</div>

		</div>

	</div>
	</div>

	<!-- Modal alertModal -->
	<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Admission</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal"
						id="btn-continue">Continue</button>
					<button type="button" class="btn btn-primary" onclick="goToAdmissionList();">Back to
						list</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal searchPatientModel -->
	<div class="modal fade" id="searchPatientModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Find Patient</h5>

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="patient-filter">
						<div class="col p-0">
							<input type="text" name="name" id="name" class="input text-input"
								placeholder="Eg: John Doe">
							<input type="text" name="phoneNumber" id="phoneNumber" class="input text-input"
								placeholder="Eg: 0918464495">
							<button class="btn btn-primary" type="button" id="btn-patient-search"><i
									class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
						<div class="col text-center text-danger" id="patient-filter-message">

						</div>
					</form>
				</div>
				<div class="modal-body" id="modal-filter-body">
					<table class="table table-striped" id="patient-table">
						<thead>
							<tr>
								<th>Full Name</th>
								<th>Phone Number</th>
								<th>Date of birth</th>
								<th></th>
							</tr>
						</thead>

						<tbody id="patient-list">
							<td colspan="4" class="text-center">Nothing to show </td>
						</tbody>

					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal searchTestModel -->
	<div class="modal fade" id="searchTestModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Find Test</h5>

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="test-filter">
						<div class="col p-0">
							<input type="text" name="testName" id="testName" class="input text-input"
								placeholder="Eg: White Blood Test">
							<button class="btn btn-primary" type="button" id="btn-test-search"><i class="fa fa-search"
									aria-hidden="true"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="modal-body" id="modal-filter-body">
					<table class="table table-striped" id="test-table">
						<thead>
							<tr>
								<th>Test Name</th>
								<th>Normal Result</th>
								<th></th>
							</tr>
						</thead>

						<tbody id="test-list">
							<tr>
								<td colspan="4" class="text-center">Nothing to show </t>
							</tr>
						</tbody>

					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<script type="text/javascript" src="/js/test-form/create-test-form.js"></script>
	<script type="text/javascript" src="/js/test-form/validate-test-form.js"></script>
</body>

</html>