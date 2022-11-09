<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title>Admin: Home</title>

	<%@include file="allCSS.jsp" %>

</head>

<body>
	<%@include file="navbar.jsp" %>
	
	<c:if test="${empty userObj }">
	 	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="manager.jsp" %>
	
	<%@include file="footer.jsp" %>
	
	<script src="js/script.js"></script>
</body>