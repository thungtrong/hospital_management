<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <jsp:include page="../_shared.jsp"></jsp:include>
        <title>Insert Test</title>
    </head>

    <body>
    	<jsp:include page="../_navbar.jsp"></jsp:include>
        <div class="container">
            <div class="form-container-outside">
                <div class="title-form">Insert Test </div>
                <div class="detail-form">
                    <div class="form-container-inside">
                        <div class="detail-test">
                            <form id="test-form" name="test" autocomplete="off">
                                <div class="col">
                                    <div class="item">
                                        <label for="testName" class="text-label">Test name</label>
                                        <input type="text" name="testName" id="testName" class="input text-input"
                                            placeholder="Eg: White blood cells">
                                         <label for="testName" class="error-msg text-danger" id="testName-error"></label>
                                    </div>
                                    <div class="item">
                                        <label for="normalResult" class="text-label">Normal Result</label>
                                        <input type="text" name="normalResult" id="normalResult" class="input text-input"
                                            placeholder="Eg: 4,500 to 11,000 WBCs per microliter">
                                        <label for="normalResult" class="error-msg text-danger" id="normalResult-error"></label>
                                    </div>
                                </div>
                                <div class="col">
	                                <div class="item">
	                                    <label for="description" class="text-label">Description</label>
	                                    <textarea rows="5" type="text" name="description" id="description" class="input text-input" placeholder="Add the description"></textarea>
										<label for="description" class="error-msg text-danger" id="description-error"></label>
	                                </div>
                                </div>
                                <div class="item d-flex justify-content-end mt-2">
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
		        <h5 class="modal-title" id="exampleModalLabel">Insert Test</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" id="modal-body">
		        ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-continue">Continue</button>
		        <button type="button" class="btn btn-primary" onclick="goToTestList();">Back to list</button>
		      </div>
		    </div>
		  </div>
		</div>
				
		
        <!-- Javascript -->
        <script type="text/javascript" src="/js/test/validate-test.js"></script>
        <script type="text/javascript" src="/js/test/create-test.js"></script>
    </body>

    </html>