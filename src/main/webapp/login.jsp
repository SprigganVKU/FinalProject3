<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<%@include file="all_component/allCSS.jsp" %>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>
	
	<div class="login-form-container">	
	    <form action="login" method="post">
	        <h3>sign in</h3>
	        <h2>
	        	<c:if test="${not empty failedMsg }">
	         	 	<p style="color:red" class="">${failedMsg }</p>
	         	 	<c:remove var="failedMsg" scope="session"/>
	         	</c:if>
	        </h2>
	        <span>email</span>
	        <input type="email" name="email" class="box" placeholder="Enter your email" id="">
	        <span>password</span>
	        <input type="password" name="password" class="box" placeholder="Enter your password" id="">
	        <div class="checkbox">
	            <input type="checkbox" name="" id="remember-me">
	            <label for="remember-me"> remember me</label>
	        </div>
	        <input type="submit" value="sign in" class="btn">
	        <p>forget password ? <a href="forgotPassword.jsp">click here</a></p>
	        <p>don't have an account ? <a href="register.jsp">create one</a></p>
	    </form>
	</div>

	<%@include file="all_component/footer.jsp" %>

</body>
</html>