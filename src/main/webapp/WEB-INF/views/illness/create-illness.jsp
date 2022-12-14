<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="../_shared.jsp"></jsp:include>
    <title>Insert Illness</title>
</head>

<body>
<jsp:include page="../_navbar.jsp"></jsp:include>
<div class="container">
    <div class="form-container-outside">
        <div class="title-form">Insert Illness </div>
        <div class="detail-form">
            <div class="form-container-inside">
                <div class="detail-illness">
                    <form id="illness-form" name="illness" autocomplete="off">
                        <div class="col">
                            <div class="item">
                                <label for="illnessName" class="text-label">Illness name</label>
                                <input type="text" name="name" id="illnessName" class="input text-input"
                                       placeholder="Eg: Acetaminophen">
                                <label for="name" class="error-msg text-danger"
                                       id="illnessName-error"></label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="item">
                                <label for="illnessDescription" class="text-label">Description</label>
                                <textarea rows="5" name="description" id="illnessDescription" class="input text-input"
                                       placeholder="Eg: Acetaminophen"></textarea>
                                <label for="description" class="error-msg text-danger"
                                       id="illnessDescription-error"></label>
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
<jsp:include page="../_footer.jsp"></jsp:include>

<!-- Modal -->
<div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Insert Illness</h5>
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
                <button type="button" class="btn btn-primary" onclick="goToIllnessList();">Back to list</button>
            </div>
        </div>
    </div>
</div>


<!-- Javascript -->
<script type="text/javascript" src="/js/illness/validate-illness.js"></script>
<script type="text/javascript" src="/js/illness/create-illness.js"></script>
</body>

</html>