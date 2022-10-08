<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <jsp:include page="../_shared.jsp"></jsp:include>
    <title>Create Account</title>
    <link rel="stylesheet" href="/css/test_form.css" type="text/css">
</head>

<body>
    <jsp:include page="../_navbar.jsp"></jsp:include>
    <div class="container">
        <div class="form-container-outside">
            <div class="title-form">Create Account</div>
            <div class="detail-form">
                <div class="form-container-inside">
                    <div class="sub-title-container d-flex justify-content-end mb-3">
                        <button class="btn btn-primary" id="btn-doctor">Find Doctor</button>
                    </div>

                    <div class="detail-account">
                        <form id="account" name="account" autocomplete="off">
                            <div class="col">
                                <div class="item">
                                    <label for="username" class="text-label">User name</label>
                                    <input type="text" name="username" id="username" class="input text-input"
                                        placeholder="Enter username">
                                    <label for="username" class="error-msg text-danger" id="name-error"></label>
                                </div>
                            </div>

                            <div class="col">
                                <input type="hidden" name="doctorId">
                                <div class="item">
                                    <label for="name" class="text-label">Doctor name</label>
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
                                    <input type="text" name="phoneNumber" id="phoneNumber"
                                        class="input text-input" placeholder="Eg: 0918464495" disabled>
                                    <label for="phoneNumber" class="error-msg text-danger"
                                        id="phoneNumber-error"></label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="item">
                                    <label for="address" class="text-label">Address</label>
                                    <input type="text" name="address" id="address" class="input text-input"
                                        placeholder="Eg: Ho Chi Minh city, Viet Nam" disabled>
                                    <label for="address" class="error-msg text-danger"
                                        id="address-error"></label>
                                </div>
                            </div>
                            
                    </div>

                    <div class="item d-flex justify-content-end mt-3">
                        <button type="button" id="submit" class="btn btn-primary">Save</button>
                        <button type="button" id="cancel" class="btn btn-light ml-2"
                            onclick="goBack()">Back</button>
                    </div>
                    </form>
                </div>
            </div>

        </div>

    </div>

    <jsp:include page="../_footer.jsp"></jsp:include>

    <!-- Modal alertModal -->
    <div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create Account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modal-body">...</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="btn-continue">Continue</button>
                    <button type="button" class="btn btn-primary" onclick="goBack();">Back to
                        list</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal searchDoctorModel -->
    <div class="modal fade" id="searchDoctorModel" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Find Doctor</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="doctor-filter">
                        <div class="col p-0">
                            <input type="text" name="name" id="name" class="input text-input"
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
                                <th>Full Name</th>
                                <th>Phone Number</th>
                                <th>Date of birth</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody id="doctor-list">
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

    <!-- Javascript -->
    <script type="text/javascript" src="/js/_search/search-doctor.js"></script>
    <script type="text/javascript" src="/js/account/create-account.js"></script>
</body>

</html>