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
    
        <form action="newPassword" method="post">
        
            <div class="icons-forgot">
                <i href="#" class="fas fa-user-lock fa-3x"></i>
            </div>
            
            <h3>Reset Password</h3>
            <br>
            <c:if test="${not empty succMsg }">
         	 			<p style="color:red" class="">${succMsg }</p>
         	 			<c:remove var="succMsg" scope="session"/>
         			</c:if>
         	
         			<c:if test="${not empty failedMsg }">
         	 			<p style="color:red" class="">${failedMsg }</p>
         	 			<c:remove var="failedMsg" scope="session"/>
         	</c:if>
            <br>
            <br>
            
            <div class="otp-input">
                <i class="fas fa-lock fa-3x icon"></i>
                <input type="text" name="password" class="box" placeholder="Enter new password" id="otp-input">
            </div>
            
            <div class="otp-input">
                <i class="fas fa-lock fa-3x icon"></i>
                <input type="text" name="confPassword" class="box" placeholder="Confirm new password" id="otp-input">
            </div>
            
            <br>
            <input type="submit" value="reset" class="btn">
        </form>
    
    </div>
    
    <%@include file="all_component/footer.jsp" %>
    
	<script src="js/script.js"></script>
</body>
</html>