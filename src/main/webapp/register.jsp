<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Register</title>
	<%@include file="all_component/allCSS.jsp" %>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>



	<div class="register-form-container">
	
	    <form action="register" method="post">
	        <h3>sign up</h3>
	      	<h2 style="text-transform: uppercase;
    		text-align: center;">
	      	 	<c:if test="${not empty succMsg }">
         	 		<p style="color:red" class="">${succMsg }</p>
         	 		<c:remove var="succMsg" scope="session"/>
         		</c:if>
         	
         		<c:if test="${not empty failedMsg }">
         	 		<p style="color:red" class="">${failedMsg }</p>
         	 		<c:remove var="failedMsg" scope="session"/>
         		</c:if>
	      	</h2>
	      	
	        <span>name</span>
	        <input type="text" name="name" class="box" placeholder="Enter your name" required="required" id="">
	        <span>email</span>
	        <input type="email" name="email" class="box" placeholder="Enter your email" required="required" id="">
	        <span>password</span>
	        <input type="password" name="password" class="box" placeholder="Enter your password" required="required" id="">
	        <span>re-password</span>
	        <input type="password" name="re_password" class="box" placeholder="Repeat your password" required="required" id="">
	        <span>phone</span>
	        <input type="number" name="phone" class="box" placeholder="Enter your phone" required="required" id="">
	        <div class="checkbox">
	            <input type="checkbox" name="check" id="remember-me">
	            <label for="agree-term">I agree all statements in <a href="#" class="term-service">Terms of service</a></label>
	        </div>
	        <input type="submit" value="sign up" class="btn">
	        <p>already have an account? <a href="login.jsp">login now</a></p>
	    </form>
	
	</div>


	<%@include file="all_component/footer.jsp" %>

</body>
</html>