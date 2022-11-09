<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>All New Book</title>
	<%@include file="all_component/allCss.jsp" %>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>
	<section class="new_books" id="featured">

    <h1 class="heading"> <span>new books</span> </h1>

    <div class="new_books-slider">

        <div class="swiper-wrapper">

			<%
				BookDAOImpl DAO = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list = DAO.getNewBooks();
		  		for(BookDetails b : list){
			%>
			 	<div class="swiper-slide box">
                <div class="icons">
                    <a href="#" class="fas fa-search"></a>
                    <a href="#" class="fas fa-heart"></a>
                    <a href="#" class="fas fa-eye"></a>
                </div>
                <div class="image">
                    <img src="../images/<%=b.getPhotoName() %>" alt="">
                </div>
                <div class="content">
                    <h3><%=b.getBookName() %> (<%=b.getBookCategory() %>)</h3> 
                    <div class="price">$<%=b.getPrice() %> <span>$<%=b.getPrice() %></span></div>
                    <a href="#" class="btn">add to cart</a>
                </div>
            	</div>
			<%
		  		}
			%>


            
            
        </div>
    </div>

</section>
</body>
</html>