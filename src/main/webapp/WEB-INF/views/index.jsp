<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
	<jsp:include page="./_shared.jsp"></jsp:include>
	<link href="/css/main.css" rel="stylesheet">
</head>
<body>
<jsp:include page="./_navbar.jsp"></jsp:include>

<c:if test="${ isAdmin }">
	<jsp:include page="./_admin-dashboard.jsp"></jsp:include>
</c:if>

<c:if test="${ isDoctor }">
	<jsp:include page="./_doctor-dashboard.jsp"></jsp:include>
</c:if>

<jsp:include page="./_footer.jsp"></jsp:include>

<script type="text/javascript" src="/public/js/dashboard.js"></script>
</body>
</html>