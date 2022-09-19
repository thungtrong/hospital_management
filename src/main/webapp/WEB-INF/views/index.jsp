<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,700;1,100;1,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/login.css">

    <title>Log In</title>
</head>
<body>
    <div class="container">
        <div class="login-card">
            <div class="login">
                <div class="title-login">
                    <span>MEMBER LOGIN</span>
                </div>
                <form action="#" class="login-form">
                        <div class="input-user">
                            <input type="text" class="form-input" placeholder="Username">
                        </div>
                        <div class="input-pass">
                            <input type="text" class="form-input" placeholder="Password">
                        </div>
                </form>
                <div class="btn">
                    <div class="btn-in">LOGIN</div>
                    <!-- <button class="btn-in">LOGIN</button> -->
                <a href="/signup" class="sign-up">Sign up</a>
                </div>
                
                
            </div>
            <div class="ad">
                <img src="/images/banner-login.jpg" alt="" class="banner">
                <span class="banner-title">HOSPITAL MANAGEMENT</span>
                <p class="banner-slogan">Higher standards of care every day.</p>
            </div>
        </div>
    </div>
</body>
</html>