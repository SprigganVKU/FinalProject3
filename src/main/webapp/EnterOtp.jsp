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
	
    <div class="forgot-form-container-otp">
    
        <form action="validateOTP" role="form" autocomplete="off">
            <div class="icons-forgot">
                <i href="#" class="fas fa-lock fa-3x"></i>
            </div>
            <h3>Enter OTP</h3>
            <br>
            <p> OTP is sent to your email id </p>
            <br>
            <br>
            <div class="otp-input">
                <i class="fas fa-envelope-open fa-3x icon"></i>
                <input type="number" name="otp" class="box" placeholder="Enter OTP" id="otp-input">
            </div>
            <br>

            <input type="submit" value="Reset Password" class="btn">
        </form>
    
    </div>
    
     <%@include file="all_component/footer.jsp" %>
	
	<script src="js/script.js"></script>
</body>
</html>