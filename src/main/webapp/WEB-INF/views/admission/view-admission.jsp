<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<jsp:include page="../_shared.jsp"></jsp:include>
	<title>View Admission Form</title>
	<!--   <link rel="stylesheet" href=""> -->
</head>

<body>
	<jsp:include page="../_navbar.jsp"></jsp:include>
	<div class="container">
		<div class="form-container-outside">
			<div class="title-form">View Admission Form</div>
			<div class="detail-form">
				<div class="form-container-inside">

					<div class="detail-patient">
						<c:set var="patient" value="${ admission.patient }"></c:set>
						<form id="patient-form" name="admission" autocomplete="off">
							<input type="hidden" name="admissionId" value="${ admission.id }">
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
										<option value="true" ${ patient.gender==true ? 'selected' :'' }>Female</option>
										<option value="false" ${ patient.gender==false ? 'selected' :'' }>Male</option>
									</select>
									<label for="gender" class="error-msg text-danger" id="gender-error"></label>
								</div>
							</div>
							<div class="col">
								<div class="item">
									<label for="dateOfBirth" class="text-label">Day of Birth</label>
									<input type="date" name="dateOfBirth" id="birth" class="input text-input"
										placeholder="Eg: 22/7/1990" disabled value="${ patient.dateOfBirth }">
									<label for="dateOfBirth" class="error-msg text-danger"
										id="dateOfBirth-error"></label>
								</div>
								<div class="item">
									<label for="phoneNumber" class="text-label">Phone Number</label>
									<input type="text" name="phoneNumber" id="phoneNumber" class="input text-input"
										placeholder="Eg: 0918464495" disabled value="${ patient.phoneNumber }">
									<label for="phoneNumber" class="error-msg text-danger"
										id="phoneNumber-error"></label>
								</div>
							</div>
							<div class="col">
								<div class="item">
									<label for="address" class="text-label">Address</label>
									<input type="text" name="address" id="address" class="input text-input"
										placeholder="" disabled value="${ patient.address }">
									<label for="address" class="error-msg text-danger" id="address-error"></label>
								</div>
							</div>
							<div class="col">
								<div class="item">
									<label for="dateIn" class="text-label">Day In</label>
									<input type="date" name="dateIn" id="dateIn" class="input text-input"
										value="${admission.dateIn}" disabled>
									<label for="dateIn" class="error-msg text-danger" id="dateIn-error"></label>
								</div>
								<div class="item">
									<label for="dateOut" class="text-label">Day Out</label>
									<input type="date" name="dateOut" id="dateOut" class="input text-input"
										placeholder="Eg: 22/7/1990" value="${admission.dateOut}" disabled>
									<label for="dateOut" class="error-msg text-danger" id="dateOut-error"></label>
								</div>

							</div>
							<div class="item d-flex justify-content-end">
								<button type="button" id="cancel" class="btn btn-light ml-2"
									onclick="goBack()">Back</button>
							</div>
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>


	<!-- Javascript -->
	<script type="text/javascript" src="/js/admission/view-admission.js"></script>
</body>


</html>