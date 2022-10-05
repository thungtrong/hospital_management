    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <jsp:include page="../_shared.jsp"></jsp:include>
    <title>Update Medicine</title>
</head>

<body>
    <jsp:include page="../_navbar.jsp"></jsp:include>
    <div class="container">
        <div class="form-container-outside">
            <div class="title-form">Update Medicine </div>
            <div class="detail-form">
                <div class="form-container-inside">
                    <div class="detail-medicine">
                        <form id="medicine-form" name="medicine" autocomplete="off">
                            <div class="col">
                            	<input type="hidden" name="id" value="${ medicine.id }">
                                <div class="item">
                                    <label for="medicineName" class="text-label">Medicine name</label>
                                    <input type="text" name="name" id="medicineName" class="input text-input"
                                        placeholder="Eg: Acetaminophen" value="${ medicine.name }">
                                    <label for="name" class="error-msg text-danger"
                                        id="medicineName-error"></label>
                                </div>
                                <div class="item">
                                    <label for="unit" class="text-label">Unit</label>
                                    <input type="text" name="unit" id="unit" class="input text-input"
                                        placeholder="Eg: pellet" value="${ medicine.unit }">
                                    <label for="unit" class="error-msg text-danger" id="unit-error"></label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="item">
                                    <label for="instruction" class="text-label">Instruction</label>
                                    <textarea rows="5" name="instruction" id="instruction"
                                        class="input text-input" placeholder="Add the instruction" value="${ medicine.instruction }">${ medicine.instruction }</textarea>
                                    <label for="instruction" class="error-msg text-danger"
                                        id="instruction-error"></label>
                                </div>
                            </div>
                            <div class="item d-flex justify-content-end mt-2">
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

    <!-- Modal -->
    <div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create Medicine</h5>
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
                    <button type="button" class="btn btn-primary" onclick="goToTestList();">Back to list</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Javascript -->
    <script type="text/javascript" src="/js/medicine/validate-medicine.js"></script>
    <script type="text/javascript" src="/js/medicine/update-medicine.js"></script>
</body>

</html>