<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <jsp:include page="../_shared.jsp"></jsp:include>
    <title>Create Admission Form</title>
</head>

<body>
<jsp:include page="../_navbar.jsp"></jsp:include>
<div class="container">
    <div class="form-container-outside">
        <div class="title-form">Create Department Form</div>
        <div class="detail-form">
            <div class="form-container-inside">
                <div class="sub-title-container d-flex justify-content-end mb-3">
                    <button class="btn btn-primary" id="btn-department">CHANGE</button>
                </div>

                <div class="detail-department">
                    <form id="department-form" name="department" autocomplete="off">
                        <div class="col">
                            <input type="hidden" name="departmentId">
                            <div class="item">
                                <label for="name" class="text-label">Department name</label>
                                <input type="text" name="name" id="name" class="input text-input"
                                        >
                                <label for="name" class="error-msg text-danger" id="name-error"></label>
                            </div>

                        </div>

                        <div class="col">
                            <div class="item">
                                <label for="description" class="text-label">Description</label>
                                <input type="text" name="description" id="description" class="input text-input"
                                       placeholder="" >
                                <label for="description" class="error-msg text-danger" id="description-error"></label>
                            </div>
                        </div>

                        </div>
                        <div class="item d-flex justify-content-end">
                            <button type="button" id="submit" href=""  class="btn btn-primary">Save</button>
                            <button type="button" id="cancel" class="btn btn-light ml-2"
                                    onclick="goBack()">Back</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Department</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="modal-body">...</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="btn-continue">Continue</button>
                <button type="button" class="btn btn-primary" onclick="goToDepartmentList();">Back to
                    list</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="searchModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Find Department</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="department-filter">
                    <div class="col p-0">
                        <input type="text" name="name" id="name" class="input text-input">
                        <input type="text" name="description" id="description" class="input text-input"
                               placeholder="Eg: something">
                        <button class="btn btn-primary" type="button" id="btn-department-search"><i
                                class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="modal-body" id="modal-filter-body">
                <table class="table table-striped" id="department-table">
                    <thead>
                    <tr>
                        <th>Department Name</th>
                        <th>Description</th>
                        <th></th>
                    </tr>
                    </thead>

                    <tbody id="department-list">
                    <td colspan="4" class="text-center">Nothing to show </td>
                    </tbody>

                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                >Cancel</button>
            </div>
        </div>
    </div>
</div>

<!-- Javascript -->
<script type="text/javascript" src="/js/department/create-department.js"></script>
<script type="text/javascript" src="/js/department/validate-department.js"></script>
</body>

</html>