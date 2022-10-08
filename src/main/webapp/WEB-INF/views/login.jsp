    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,700;1,100;1,600&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="/public/css/login.css">
    <script type="text/javascript" src="/public/js/login.js"></script>
    <title>Log In</title>
</head>
<body>
    <c:set var="ROLE_DOCTOR" value="ROLE_DOCTOR" scope="application"></c:set>
    <c:set var="ROLE_ADMIN" value="ROLE_ADMIN" scope="application"></c:set>

    <div class="container">
        <div class="login-card">
            <div class="login">
                <div class="title-login">
                    <span>MEMBER LOGIN</span>
                </div>
                <form action="/login" method="POST" class="login-form">
                    <div id="error-message">
                        <c:if test="${error}">
                            <span class="error-text">Invalid username or password</span>
                        </c:if>
                    </div>
                    <div class="input-user">
                        <input type="text" name="username" class="form-input" placeholder="Username">
                    </div>
                    <div class="input-pass">
                        <input type="password" name="password" class="form-input" placeholder="Password">
                    </div>
                    <div class="btn">
                        <!--  <div class="btn-in">LOGIN</div>  -->
                        <button type="submit" class="btn-in">LOGIN</button>
                    </div>
                </form>
                <div class="link-container text-center d-flex justify-content-center">
                    <a class="link-primary" id="forgot-password" href="/forgot-password">Forgot
                        Password</a>
                </div>
            </div>
            <div class="ad">
                <img src="/public/images/banner-login.jpg" alt="" class="banner">
                <span class="banner-title">HOSPITAL MANAGEMENT</span>
                <p class="banner-slogan">Higher standards of care every day.</p>
            </div>
        </div>
    </div>
</body>

</html>