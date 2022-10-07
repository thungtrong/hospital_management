<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <jsp:include page="../_shared.jsp"></jsp:include>
        <title>Update Patient</title>
        <!--   <link rel="stylesheet" href=""> -->
    </head>

    <body>
    	<jsp:include page="../_navbar.jsp"></jsp:include>
        <div class="container">
            <div class="form-container-outside">
                <div class="title-form">Update Patient Form</div>
                <div class="detail-form">
                    <div class="form-container-inside">
                        <div class="detail-patient">
                            <form id="update-patient-form" name="patient" autocomplete="off">
                            	<input type="hidden" name="id" value="${ patient.id }">
                                <div class="col">
                                    <div class="item">
                                        <label for="name" class="text-label">Patient name</label>
                                        <input type="text" name="name" id="name" class="input text-input"
                                            placeholder="Eg: John Doe" value="${ patient.name }">
                                         <label for="name" class="error-msg text-danger" id="name-error"></label>
                                    </div>
                                    <div class="item">
                                        <label for="gender" class="text-label">Gender</label>
                                        <select name="gender" class="input" >
                                            <option value="true" ${ patient.gender == true ? 'selected':'' }>Female</option>
                                            <option value="false" ${ patient.gender == false ? 'selected':'' }>Male</option>
                                        </select>
                                        <label for="gender" class="error-msg text-danger" id="gender-error"></label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="item">
                                        <label for="dateOfBirth" class="text-label">Day of Birth</label>
                                        <input type="date" name="dateOfBirth" id="birth" class="input text-input" value="${ patient.dateOfBirth }">
                                         <label for="dateOfBirth" class="error-msg text-danger" id="dateOfBirth-error"></label>
                                    </div>
                                    <div class="item">
                                        <label for="phoneNumber" class="text-label">Phone Number</label>
                                        <input type="text" name="phoneNumber" id="phoneNumber" class="input text-input"
                                            placeholder="Eg: 0918464495" value="${ patient.phoneNumber }">
                                        <label for="phoneNumber" class="error-msg text-danger" id="phoneNumber-error"></label>
                                    </div>
                                </div>
                                <div class="col">
	                                <div class="item">
	                                    <label for="address" class="text-label">Address</label>
	                                    <input type="text" name="address" id="address" class="input text-input"
	                                        placeholder="" value="${ patient.address }">
										<label for="address" class="error-msg text-danger" id="address-error"></label>
	                                </div>
	                            </div>
                                <div class="item d-flex justify-content-end">
                                    <button type="button" id="submit" class="btn btn-primary">Save</button>
                                    <button type="button" id="cancel" class="btn btn-light ml-2" onclick="goBack()">Back</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
		<jsp:include page="../_footer.jsp"></jsp:include>
		
		<!-- Modal -->
		<div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Update Patient</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" id="modal-body">
		        ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Continues</button>
		        <button type="button" class="btn btn-primary" onclick="goToPatientList();">Back to list</button>
		      </div>
		    </div>
		  </div>
		</div>
				
		
        <!-- Javascript -->
        <script type="text/javascript" src="/js/patient/validate-patient.js"></script>
        <script type="text/javascript" src="/js/patient/update-patient.js"></script>
    </body>

    </html>