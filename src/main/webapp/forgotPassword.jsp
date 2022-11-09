<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Forgot Password</title>
	
	<%@include file="all_component/allCSS.jsp" %>
</head>
<body> 
 	<%@include file="all_component/navbar.jsp" %>
 	
    <div class="forgot-form-container">
    
        <form action="forgotPassword" method="post">
            <h3>Forgot your password?</h3>
            <br>
            <h> Change your password in three easy steps. This will help you to secure your password!</h>
            <br>
            <br>
            <h> <h style="color:#27ae60">1.</h> Enter your email address below.<br>
                <h style="color:#27ae60">2.</h> Our system will send you an OTP to your email.<br>
                <h style="color:#27ae60">3.</h> Enter to OTP on the next page.
            </h>
            <br>
            <br>
            <br>
            <span>Enter your email address</span>
            <input type="email" name="email" class="box" placeholder="Enter your email" id="">
            <br>
            <br>
            <br>
            <a href="login.jsp">
             	<input  type="button" value="back to login" class="btn1">
            </a>
            
            <input type="submit" value="get new password" class="btn">
        </form>
    
    </div>
    
    <%@include file="all_component/footer.jsp" %>
	
	<script src="js/script.js"></script>
</body>
</html>