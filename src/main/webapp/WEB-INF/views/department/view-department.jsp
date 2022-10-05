<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <jsp:include page="../_shared.jsp"></jsp:include>
    <title>View Department Form</title>
    <!--   <link rel="stylesheet" href=""> -->
</head>

<body>
<jsp:include page="../_navbar.jsp"></jsp:include>
<div class="container">
    <div class="form-container-outside">
        <div class="title-form">View Department Form</div>
        <div class="detail-form">
            <div class="form-container-inside">

                <div class="detail-patient">
                    <form id="patient-form" name="department" autocomplete="off">
                        <input type="hidden" name="departmentId" value="${ department.id }">
                        <div class="col">
                            <input type="hidden" name="departmentId" value="${ department.id }">
                            <div class="item">
                                <label for="name" class="text-label">Patient name</label>
                                <input type="text" name="name" id="name" class="input text-input"
                                       placeholder="Eg: John Doe" disabled value="${ department.name }">
                                <label for="name" class="error-msg text-danger" id="name-error"></label>
                            </div>

                        </div>
                        <div class="col">
                            <div class="item">
                                <label for="description" class="text-label">Description</label>
                                <input type="text" name="description" id="description" class="input text-input"
                                       placeholder="" disabled value="${ patient.address }">
                                <label for="description" class="error-msg text-danger" id="address-error"></label>
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
<script type="text/javascript" src="/js/department/view-department.js"></script>
</body>


</html>