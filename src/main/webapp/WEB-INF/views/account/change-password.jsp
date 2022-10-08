<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <jsp:include page="../_shared.jsp"></jsp:include>
    <title>Change Password</title>
</head>

<body>
    <jsp:include page="../_navbar.jsp"></jsp:include>
    <div class="container">
        <div class="form-container-outside">
            <div class="title-form">Change Password </div>
            <div class="detail-form">
                <div class="form-container-inside">
                    <div class="detail-medicine">
                        <form id="change-password-form" name="change-password" autocomplete="off">
                            <div class="col">
                                <div class="item">
                                    <label for="oldPassword" class="text-label">Old Password</label>
                                    <input type="password" name="oldPassword" id="oldPassword" class="input text-input"
                                        placeholder="Password" required>
                                    <label for="oldPassword" class="error-msg text-danger"
                                        id="oldPassword-error"></label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="item">
                                    <label for="newPassword" class="text-label">New Password</label>
                                    <input type="password" name="newPassword" id="newPassword" class="input text-input"
                                        placeholder="New Password" required>
                                    <label for="newPassword" class="error-msg text-danger"
                                        id="newPassword-error"></label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="item">
                                    <label for="confirmNewPassword" class="text-label">Confirm New Password</label>
                                    <input type="password" name="confirmNewPassword" id="confirmNewPassword" class="input text-input"
                                        placeholder="Confirm New Password" required>
                                    <label for="confirmNewPassword" class="error-msg text-danger"
                                        id="confirmNewPassword-error"></label>
                                </div>
                            </div>
                            <div class="item d-flex justify-content-end mt-2">
                                <button type="button" id="btn-submit" class="btn btn-primary">Save</button>
                                <button type="button" id="btn-back" class="btn btn-light ml-2"
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
                    <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
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
                    <button type="button" class="btn btn-primary" onclick="goBackToDashboard()">Back to dashboard</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Javascript -->
    <script type="text/javascript" src="/js/account/change-password.js"></script>
</body>

</html>