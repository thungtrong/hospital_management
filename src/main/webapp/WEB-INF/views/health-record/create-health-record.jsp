<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="ISO-8859-1">
			<jsp:include page="../_shared.jsp"></jsp:include>
			<title>Create Health Record</title>
			<link rel="stylesheet" href="/css/health-record.css" type="text/css">
		</head>

		<body>
			<jsp:include page="../_navbar.jsp"></jsp:include>
			<div id="alert-container" class="d-flex flex-column justify-content-center">
			</div>
			<div class="container">

				<div class="form-container-outside">
					<div class="title-form">Create Health Record</div>
					<div class="detail-form">
						<div class="form-container-inside">
							<!-- Doctor Part -->
							<div id="doctor-information-container" class="mb-3">
								<div class="sub-title-container d-flex justify-content-between mb-3">
									<h5>Doctor Information</h5>
									<button class="btn btn-primary" id="btn-doctor">CHANGE</button>
								</div>
								<form onsubmit="return false" name="doctor-form">
									<div class="col">
										<input type="hidden" name="doctorId">
										<div class="item">
											<label for="doctorName" class="text-label">Doctor name</label>
											<input type="text" name="doctorName" id="doctorName"
												class="input text-input" placeholder="Eg: John Doe" disabled>
											<label for="doctorName" class="error-msg text-danger"
												id="name-error"></label>
										</div>
										<div class="item">
											<label for="doctorPhoneNumber" class="text-label">Phone number</label>
											<input type="text" name="doctorPhoneNumber" id="doctorPhoneNumber"
												class="input text-input" placeholder="Eg: 0918464495" disabled>
											<label for="doctorPhoneNumber" class="error-msg text-danger"
												id="phoneNumber-error"></label>
										</div>
									</div>
								</form>

							</div>
							<!-- Patient Part -->
							<div id="patient-information-container" class="mb-3">
								<div class="sub-title-container d-flex justify-content-between mb-3">
									<h5>Patient Information</h5>
									<button class="btn btn-primary" id="btn-patient">CHANGE</button>
								</div>
								<div class="detail-patient-form">
									<form id="patient-form" name="patient-form" autocomplete="off">
										<div class="col">
											<input type="hidden" name="patientId">
											<div class="item">
												<label for="patientName" class="text-label">Patient name</label>
												<input type="text" name="patientName" id="patientName"
													class="input text-input" placeholder="Eg: John Doe" disabled>
												<label for="patientName" class="error-msg text-danger"
													id="name-error"></label>
											</div>
											<div class="item">
												<label for="patientGender" class="text-label">Gender</label>
												<select name="patientGender" class="input" disabled>
													<option value="false">Male</option>
													<option value="true">Female</option>
												</select> <label for="patientGender" class="error-msg text-danger"
													id="gender-error"></label>
											</div>
										</div>
										<div class="col">
											<div class="item">
												<label for="patientDateOfBirth" class="text-label">Day of Birth</label>
												<input type="date" name="patientDateOfBirth" id="birth"
													class="input text-input" placeholder="Eg: 22/7/1990" disabled>
												<label for="patientDateOfBirth" class="error-msg text-danger"
													id="patientDateOfBirth-error"></label>
											</div>
											<div class="item">
												<label for="patientPhoneNumber" class="text-label">Phone Number</label>
												<input type="text" name="patientPhoneNumber" id="patientPhoneNumber"
													class="input text-input" placeholder="Eg: 0918464495" disabled>
												<label for="patientPhoneNumber" class="error-msg text-danger"
													id="patientPhoneNumber-error"></label>
											</div>
										</div>
										<div class="col">
											<div class="item">
												<label for="patientAddress" class="text-label">Address</label>
												<input type="text" name="patientAddress" id="patientAddress"
													class="input text-input"
													placeholder="Eg: Ho Chi Minh city, Viet Nam" disabled>
												<label for="patientAddress" class="error-msg text-danger"
													id="patientAddress-error"></label>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- Diagnostics  -->
							<div class="diagnostics" class="mb-5">
								<div class="health-record-head">
									<div class="sub-title-container d-flex justify-content-between mb-3">
										<h5>Health Record Details</h5>
										<button type="button" class="btn btn-primary" id="btn-illness">ADD</button>
									</div>
								</div>
								<div class="detail-health-record-form">
									<form id="health-record-form" name="health-record-form" autocomplete="off">
										<div class="col">
											<div class="item">
												<label for="creationDate" class="text-label">Creation Date</label>
												<fmt:formatDate pattern="yyyy-MM-dd" value="${toDay}" var="formatDay" />
												<input type="date" name="creationDate" id="creationDate"
													class="input text-input" value="${ formatDay }">
												<label for="creationDate" class="error-msg text-danger"
													id="creationDate-error"></label>
											</div>
											<div class="item">
												<label for="reDate" class="text-label">Re Date</label>
												<input type="date" name="reDate" id="reDate" class="input text-input">
												<label for="reDate" class="error-msg text-danger"
													id="reDate-error"></label>
											</div>
										</div>
									</form>
								</div>
								<div id="health-record-detail">
									<table class="table table-striped p-3" id="health-record-detail-table">
										<thead>
											<tr>
												<th>Illness Name</th>
												<th>Description</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="tbody-list-illness">
											<tr class="nothing">
												<td class="text-center" colspan="3">Nothing to show</td>
											</tr>
										</tbody>

									</table>

								</div>
							</div>

							<!-- Prescription -->
							<div id="prescription-detail">
								<div class="health-record-head">
									<div class="sub-title-container d-flex justify-content-between mb-3">
										<h5>Prescription Details</h5>
										<button type="button" class="btn btn-primary"
											id="btn-prescription-detail">ADD</button>
									</div>
								</div>
								<table class="table table-striped p-3" id="prescription-detail-table">
									<thead>
										<tr>
											<th>Medicine Name</th>
											<th>Quantity</th>
											<th>Unit</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="list-prescription-detail">
										<tr class="nothing">
											<td class="text-center" colspan="4">Nothing to show</td>
										</tr>
									</tbody>

								</table>

							</div>


							<div class="item d-flex justify-content-end mt-3">
								<button type="button" id="submit" class="btn btn-primary">Save</button>
								<button type="button" id="cancel" class="btn btn-light ml-2"
									onclick="goBack()">Back</button>
							</div>

						</div>
					</div>

				</div>

			</div>
			</div>
			<jsp:include page="../_footer.jsp"></jsp:include>

			<!-- Modal alertModal -->
			<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertModal"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Create Health Record</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal"
								id="btn-continue">Continue</button>
							<button type="button" class="btn btn-primary" onclick="goToHealthRecordList();">Back to
								list</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal searchPatientModel -->
			<div class="modal fade" id="searchPatientModel" tabindex="-1" role="dialog"
				aria-labelledby="searchPatientModel" aria-hidden="true">
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
								<div class="text-center text-danger" id="patient-filter-message">

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

			<!-- Modal searchDoctorModel -->
			<div class="modal fade" id="searchDoctorModel" tabindex="-1" role="dialog"
				aria-labelledby="searchDoctorModel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="searchDoctorModelLabel">Find Doctor</h5>

							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form name="doctor-filter" onsubmit="return false;">
								<div class="col p-0">
									<input type="text" name="name" id="doctorName" class="input text-input"
										placeholder="Eg: John Doe">
									<button class="btn btn-primary" type="button" id="btn-doctor-search"><i
											class="fa fa-search" aria-hidden="true"></i>
									</button>
								</div>
								<div class="text-center text-danger" id="doctor-filter-message">

								</div>
							</form>
						</div>
						<div class="modal-body" id="modal-filter-body">
							<table class="table table-striped" id="doctor-table">
								<thead>
									<tr>
										<th>Doctor Name</th>
										<th>Phone Number</th>
										<th>Department</th>
										<th></th>
									</tr>
								</thead>

								<tbody id="doctor-list">
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

			<!-- Modal searchIllnessModel -->
			<div class="modal fade" id="searchIllnessModel" tabindex="-1" role="dialog"
				aria-labelledby="searchIllnessModel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="searchIllnessModelLabel">Find Illness</h5>

							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form name="illness-filter" onsubmit="return false;">
								<div class="col p-0">
									<input type="text" name="name" id="illnessName" class="input text-input"
										placeholder="Eg: Acetaminophen">
									<button class="btn btn-primary" type="button" id="btn-illness-search"><i
											class="fa fa-search" aria-hidden="true"></i>
									</button>
								</div>
								<div class="text-center text-danger" id="illness-filter-message"></div>
							</form>
						</div>
						<div class="modal-body" id="modal-filter-body">
							<table class="table table-striped" id="illness-table">
								<thead>
									<tr>
										<th>Illness Name</th>
										<th>Description</th>
										<th></th>
									</tr>
								</thead>

								<tbody id="illness-list">
									<tr>
										<td colspan="3" class="text-center">Nothing to show </t>
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

			<!-- Modal searchMedicineModel -->
			<div class="modal fade" id="searchMedicineModel" tabindex="-1" role="dialog"
				aria-labelledby="searchMedicineModel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="searchMedicineModelLabel">Find Medicine</h5>

							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form name="medicine-filter" onsubmit="return false;">
								<div class="col p-0">
									<input type="text" name="name" id="medicineName" class="input text-input"
										placeholder="Eg: Acetaminophen">
									<button class="btn btn-primary" type="button" id="btn-medicine-search"><i
											class="fa fa-search" aria-hidden="true"></i>
									</button>
								</div>
								<div class="text-center text-danger" id="medicine-filter-message"></div>
							</form>
						</div>
						<div class="modal-body" id="modal-filter-body">
							<table class="table table-striped" id="medicine-table">
								<thead>
									<tr>
										<th>Medicine Name</th>
										<th>Instruction</th>
										<th></th>
									</tr>
								</thead>

								<tbody id="medicine-list">
									<tr>
										<td colspan="3" class="text-center">Nothing to show </t>
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
			<script type="text/javascript" src="/js/_alert/alert.js"></script>
			<script type="text/javascript" src="/js/health-record/validate-health-record.js"></script>
			<script type="text/javascript" src="/js/_search/search-patient.js"></script>
			<script type="text/javascript" src="/js/_search/search-doctor.js"></script>
			<script type="text/javascript" src="/js/_search/search-illness.js"></script>
			<script type="text/javascript" src="/js/_search/search-medicine.js"></script>
			<script type="text/javascript" src="/js/health-record/create-health-record.js"></script>
		</body>

		</html>