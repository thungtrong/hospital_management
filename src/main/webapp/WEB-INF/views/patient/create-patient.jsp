<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <jsp:include page="../_shared.jsp"></jsp:include>
        <title>Insert title here</title>
        <!--   <link rel="stylesheet" href=""> -->
    </head>

    <body>
    	<jsp:include page="../_navbar.jsp"></jsp:include>
        <div class="container">
            <div class="form-container-outside">
                <div class="title-form">Add Patient Form</div>
                <div class="detail-form">
                    <div class="form-container-inside">
                        <div class="detail-patient">
                            <form id="patient-form" name="patient" autocomplete="off">
                                <div class="col">
                                    <div class="item">
                                        <label for="name" class="text-label">Patient name</label>
                                        <input type="text" name="name" id="name" class="input text-input"
                                            placeholder="Eg: John Doe">
                                    </div>
                                    <div class="item">
                                        <label for="gender" class="text-label">Gender</label>
                                        <select name="gender" class="input">
                                            <option value="false">Male</option>
                                            <option value="true">Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="item">
                                        <label for="birth" class="text-label">Day of Birth</label>
                                        <input type="date" name="dateOfBirth" id="birth" class="input text-input"
                                            placeholder="Eg: 22/7/1990">
                                    </div>
                                    <div class="item">
                                        <label for="phoneNumber" class="text-label">Phone Number</label>
                                        <input type="text" name="phoneNumber" id="phoneNumber" class="input text-input"
                                            placeholder="Eg: 0918464495">
                                    </div>
                                </div>
                                <div class="item">
                                    <label for="address" class="text-label">Address</label>
                                    <input type="text" name="address" id="address" class="input text-input"
                                        placeholder="">
                                </div>
                                <div class="item d-flex justify-content-end">
                                    <button type="button" id="submit" class="btn btn-primary">Save</button>
                                    <button type="button" id="cancel" class="btn btn-light ml-2">Back</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <!-- Javascript -->
        <script type="text/javascript" src="/js/patient/create.js"></script>
    </body>

    </html>