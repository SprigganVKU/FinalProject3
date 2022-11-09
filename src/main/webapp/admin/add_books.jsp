<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title>Admin: Add Books</title>

	<%@include file="allCSS.jsp" %>

</head>
<body>

	<%@include file="navbar.jsp" %> 	
 	
 	<c:if test="${empty userObj }">
	 	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
 	<section class="add-book-form" id="">

        <h1 class="heading"> <span>add book</span> </h1>

        <div class="add-form-container">
        
            <form action="../add_books" method="post" enctype="multipart/form-data">
                <h3>
                 	<c:if test="${not empty succMsg }">
         	 			<p style="color:red" class="">${succMsg }</p>
         	 			<c:remove var="succMsg" scope="session"/>
         			</c:if>
         	
         			<c:if test="${not empty failedMsg }">
         	 			<p style="color:red" class="">${failedMsg }</p>
         	 			<c:remove var="failedMsg" scope="session"/>
         			</c:if>
                </h3>

                <span>book name<h style="color: red;">*</h></span>
                <input type="text" name="bookName" class="box" placeholder="" id="">
                <span>author name<h style="color: red;">*</h></span>
                <input type="text" name="authorName" class="box" placeholder="" id="">
                <span>price<h style="color: red;">*</h></span>
                <input type="number" name="price" class="box" placeholder="" id="">
                <span>book categories<h style="color: red;">*</h></span>
                <div class="book-cate">
                    <label for="inputState" class=""></label>
                    <select id="inputState" name="bookType" style="font-size: 1.5rem; width:100%">
                        <option selected>----------------Select---------------</option>
                        <option value="New">New</option>
                        <option value="Old">Old</option>
                    </select>
                </div>

                <span>book status<h style="color: red;">*</h></span>
                <div class="book-status">
                    <label for="inputState" class=""></label>
                    <select id="inputState" name="bookStatus" style="font-size: 1.5rem; width:100%">
                        <option selected>----------------Select---------------</option>
                        <option value="New">New Book</option>
                        <option value="Old">Old Book</option>
                    </select>
                </div>

                <span>Upload Photo</span>
                <div class="">
                    <label for="uploadPhoto"></label>
                    <input lang="en" name="bookImage" type="file" class="uploadPhoto" id="">
                </div>

                <input type="submit" value="Add" class="btn">
            </form>
        </div>

    </section>

	<%@include file="footer.jsp" %>
	
	<script src="js/script.js"></script>
</body>
</html>