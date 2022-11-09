<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>EBook Store</title>
	<%@include file="all_component/allCSS.jsp" %>
</head>
<body>

	<%@include file="all_component/navbar.jsp" %>
	
	<%@include file="home.jsp" %>
	
	<%@include file="recent_books.jsp" %>
	
	<%@include file="contact.jsp" %>
	
	<%@include file="new_arrivals.jsp" %>
	
	<%@include file="deal.jsp" %>
	
	<%@include file="reviews.jsp" %>
	
	<%@include file="all_component/footer.jsp" %>
	
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	
	<script src="js/script.js"></script>

</body>
</html>