<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="../_shared.jsp"></jsp:include>
    <title>Insert Doctor</title>
    <!--   <link rel="stylesheet" href=""> -->
</head>

<body>
    <jsp:include page="../_navbar.jsp"></jsp:include>
    <div class="container">
        <div class="form-container-outside">
            <div class="title-form">Insert Doctor Form</div>
            <div class="detail-form">
                <div class="form-container-inside">
                    <div class="detail-doctor">
                        <form id="doctor-form" name="doctor" autocomplete="off">
                            <div class="col">
                                <div class="item">
                                    <label for="name" class="text-label">Doctor name</label>
                                    <input type="text" name="name" id="name" class="input text-input"
                                        placeholder="Eg: John Doe">
                                    <label for="name" class="error-msg text-danger" id="name-error"></label>
                                </div>
                                <div class="item">
                                    <label for="gender" class="text-label">Gender</label>
                                    <select name="gender" class="input">
                                        <option value="false">Male</option>
                                        <option value="true">Female</option>
                                    </select>
                                    <label for="gender" class="error-msg text-danger" id="gender-error"></label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="item">
                                    <label for="dateOfBirth" class="text-label">Day of Birth</label>
                                    <input type="date" name="dateOfBirth" id="birth" class="input text-input"
                                        placeholder="Eg: 22/7/1990">
                                    <label for="dateOfBirth" class="error-msg text-danger"
                                        id="dateOfBirth-error"></label>
                                </div>
                                <div class="item">
                                    <label for="phoneNumber" class="text-label">Phone Number</label>
                                    <input type="text" name="phoneNumber" id="phoneNumber"
                                        class="input text-input" placeholder="Eg: 0918464495">
                                    <label for="phoneNumber" class="error-msg text-danger"
                                        id="phoneNumber-error"></label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="item">
                                    <label for="address" class="text-label">Address</label>
                                    <input type="text" name="address" id="address" class="input text-input"
                                        placeholder="">
                                    <label for="address" class="error-msg text-danger"
                                        id="address-error"></label>
                                </div>
                                <div class="item">
                                    <label for="departmentId" class="text-label">Department</label>
                                    <select name="departmentId" class="input">
                                        <option value="">Please select department</option>
                                        <c:forEach var="department" items="${ departmentList }">
                                            <option value="${ department.id }">${department.name }</option>
                                        </c:forEach>
                                    </select>
                                    <label for="departmentId" class="error-msg text-danger"
                                        id="departmentId-error"></label>
                                </div>
                            </div>
                            <div class="item d-flex justify-content-end">
                                <button type="button" id="submit" class="btn btn-primary">Save</button>
                                <button type="button" id="cancel" class="btn btn-light ml-2"
                                    onclick="goBack()">Back</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>
    </div>
	<jsp:include page="../_footer.jsp"></jsp:include>
	
    <!-- Modal -->
    <div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create Doctor</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="btn-continue">Continue</button>
                    <button type="button" class="btn btn-primary" onclick="goToDoctorList();">Back to
                        list</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Javascript -->
    <script type="text/javascript" src="/js/doctor/validate-doctor.js"></script>
    <script type="text/javascript" src="/js/doctor/create-doctor.js"></script>
</body>

</html>