<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="_shared.jsp"></jsp:include>
    
    <title>Test Form</title>
    
    <link rel="stylesheet" href="./css/test_form.css" />
</head>
<body>
    <div class="container">
        <div class="form-container-outside">
            <div class="title-form">Add Test Form</div>
            <div class="detail-form">
                <div class="form-container-inside">
                    <div class="head-box">
                        <div class="sub-title">Patient Information</div>
                        <button class="btn btn-patient">CHANGE</button>
                    </div>
                    <div class="detail-patient">
                        <form action="#" id="patient-form" autocomplete="off">
                           <div class="col">
                            <div class="item">
                                <label for="name" class="text-label">Patient name</label>
                                <input type="text" id="name" class="test-input" placeholder="Eg: John Doe">
                            </div>
                            <div class="item">
                                <label for="gender" class="text-label">Gender</label>
                                <input type="text" id="gender" class="text-input" placeholder="Eg: Male/Female">
                            </div>
                           </div>
                           <div class="col">
                            <div class="item">
                                <label for="birth" class="text-label">Day of Birth</label>
                                <input type="text" id="birth" class="text-input" placeholder="Eg: 22/7/1990">
                            </div>
                            <div class="item">
                                <label for="phone" class="text-label">Phone Number</label>
                                <input type="text" id="number" class="text-input" placeholder="Eg: 0918464495">
                            </div>
                           </div>
                            <div class="item1">
                                <label for="address" class="text-label">Address</label>
                                <input type="text" id="address" class="text-input" placeholder="">
                            </div>
                            
                            
                            <div class="test-info">
			                    <div class="head-box">
			                        <span class="sub-title">Test Form Information</span>
			                        <button class="btn btn-info">Add Test</button>
			                    </div>
			                    <div class="test-detail">
			                        <div class="text-show">Nothings to show</div>
			                        
			                    </div>
			                </div>
                          </form>
                    </div>
                </div>
                
            </div>
           
        </div>
    </div>
</body>
</html>