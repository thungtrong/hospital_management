<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <jsp:include page="../_shared.jsp"></jsp:include>
    <title>Update Department</title>
</head>

<body>
<jsp:include page="../_navbar.jsp"></jsp:include>
<div class="container">
    <div class="form-container-outside">
        <div class="title-form">Update Department Form</div>
        <div class="detail-form">
            <div class="form-container-inside">
                <div class="detail-department">
                    <form id="update-department-form" name="department" autocomplete="off">
                        <input type="hidden" name="id" value="${ department.id }">
                        <div class="col">
                            <div class="item">
                                <label for="name" class="text-label">Department name</label>
                                <input type="text" name="name" id="name" class="input text-input"
                                       placeholder="Eg: John Doe" value="${ department.name }">
                                <label for="name" class="error-msg text-danger" id="name-error"></label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="item">
                                <label for="description" class="text-label">Description</label>
                                <input type="text" name="description" id="description" class="input text-input"
                                       placeholder="" value="${ department.description }">
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

<!-- Modal -->
<div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Update Department</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Continues</button>
                <button type="button" class="btn btn-primary" onclick="goToDepartmentList();">Back to list</button>
            </div>
        </div>
    </div>
</div>


<!-- Javascript -->
<script type="text/javascript" src="/js/department/validate-department.js"></script>
<script type="text/javascript" src="/js/department/update-department.js"></script>
</body>

</html>