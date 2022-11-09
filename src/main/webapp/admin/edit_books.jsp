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
	<title>Admin: Edit Books</title>

<%@include file="allCSS.jsp" %>
</head>

<body>

	<%@include file="navbar.jsp" %> 

 	<c:if test="${empty userObj }">
	 	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
 	<section class="add-book-form" id="">
        <h1 class="heading"> <span>Edit book</span> </h1>
        
        <div class="add-form-container">
     
         	<%
         	 int id = Integer.parseInt(request.getParameter("id"));
         	 BookDAOImpl DAO = new BookDAOImpl(DBConnect.getConn());
         	 BookDetails b = DAO.getBookById(id);
         	%>

            <form action="../edit_books" method="post">
                <h3 style="font-size: 1.5rem;">
         			<c:if test="${not empty failedMsg }">
         	 			<p style="color:red" class="">${failedMsg }</p>
         	 			<c:remove var="failedMsg" scope="session"/>
         			</c:if>
                </h3>
                <input type="hidden" name="id" value="<%=b.getBookId()%>">
                <span>book name<h style="color: red;">*</h></span>
                <input type="text" name="bookName" class="box" placeholder="" id="" value="<%=b.getBookName()%>">
                <span>author name<h style="color: red;">*</h></span>
                <input type="text" name="authorName" class="box" placeholder="" id="" value="<%=b.getAuthor()%>">
                <span>price<h style="color: red;">*</h></span>
                <input type="number" name="price" class="box" placeholder="" id="" value="<%=b.getPrice()%>">
                <span>book categories<h style="color: red;">*</h></span>
                <div class="book-cate">
                    <label for="inputState" class=""></label>
                    <select id="inputState" name="bookType" style="font-size: 1.5rem; width:100%">
                        <% 
                        if("Comic".equals(b.getBookCategory())){
                        %>
                        <option value="Comic">Comic</option>
                        <option value="Thriller">Thriller</option>
                        <option value="Dictionary">Dictionary</option>
                        <%}else if("Thriller".equals(b.getBookCategory())){%>
                        <option value="Thriller">Thriller</option>
                        <option value="Comic">Comic</option>
                        <option value="Dictionary">Dictionary</option>
                        <%}else if("Dictionary".equals(b.getBookCategory())){%>  
                        <option value="Dictionary">Dictionary</option>
                        <option value="Comic">Comic</option>
                        <option value="Thriller">Thriller</option>
                        <%}else{%>
                        <option selected>----------------Select---------------</option>
                        <option value="Dictionary">Dictionary</option>
                        <option value="Comic">Comic</option>
                        <option value="Thriller">Thriller</option>
                        <%}%>
                    </select>
                </div>

                <span>book status<h style="color: red;">*</h></span>
                <div class="book-status">
                    <label for="inputState" class=""></label>
                    <select id="inputState" name="bookStatus" style="font-size: 1.5rem; width:100%">
                      	<% 
                       	if("New".equals(b.getStatus())){
                        %>
                        <option value="New">New Book</option>
                        <option value="Old">Old Book</option>
                        <%}else if("Old".equals(b.getStatus())){%>
                        <option value="Old">Old Book</option>
                        <option value="New">New Book</option>
                        <%}else{%>
                        <option selected>----------------Select---------------</option>
                        <option value="New">New Book</option>
                        <option value="Old">Old Book</option>
                        <%}%>
                    </select>
                </div>
                
                <input type="submit" value="update" class="btn">
            </form>
        </div>
    </section>
    
    <%@include file="footer.jsp" %>
    <script src="js/script.js"></script>
</body>
</html>