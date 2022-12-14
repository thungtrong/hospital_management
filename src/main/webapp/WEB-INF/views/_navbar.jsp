<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.springframework.data.domain.Page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/public/css/nav.css">


<!--Navbar -->
<nav class="mb-4 navbar navbar-expand-lg navbar-dark cyan" style="font-size: 20px;">
<!--	insert icon hopital -->
	<a class="navbar-brand" href="/"><img src="/public/images/logo.png" alt="logo" style="width: 50px; height: 50px;"> <b>Hospital Management</b></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4" aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent-4">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active">
				<a class="nav-link" href="#"><i class="fa fa-envelope"></i> Contact <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#"><i class="fa fa-gear"></i> Settings</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-user"></i> 
					
						<c:out value="${name}"></c:out>
					
				</a>
				<div class="dropdown-menu dropdown-menu-right dropdown-cyan" aria-labelledby="navbarDropdownMenuLink-4">
					<a class="dropdown-item" href="/account/profile">My account</a>
					<a class="dropdown-item" href="/account/change-password">Change password</a>
					<a class="dropdown-item" href="/logout">Log out</a>
				</div>
			</li>
		</ul>
	</div>
</nav>
<!--/.Navbar -->
