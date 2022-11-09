<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
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
	<section class="shopping-cart">
	
	 	<h1 class="heading"> <span>All book</span> </h1>
	 	
	 	<h3 style=" font-size: 2.5rem;
		    text-transform: uppercase;
		    text-align: center;">
		    
         	<c:if test="${not empty succMsg }">
         	 	<p style="color:red" class="">${succMsg }</p>
         		<c:remove var="succMsg" scope="session"/>
         	</c:if>
         	
         	<c:if test="${not empty failedMsg }">
         	 	<p style="color:red" class="">${failedMsg }</p>
         	 	<c:remove var="failedMsg" scope="session"/>
         	</c:if>
        </h3>
	
	    <div class="all-book-container">
	        <table>
	            <thead>
	               <th>ID</th>
	               <th>image</th>
	               <th>book name</th>
	               <th>author</th>
	               <th>price</th>
	               <th>categories</th>
	               <th>status</th>
	               <!-- <th>quantity</th> -->
	               <th>action</th>
	            </thead>
	 <%
	  	BookDAOImpl DAO= new BookDAOImpl(DBConnect.getConn());
	  	List<BookDetails> list = DAO.getAllBooks();
	  	for(BookDetails b : list){
	 %>
	  	 <tr>
	        		<td id="id" name="id"><%=b.getBookId() %></td>
	       			<td id="image"><img src="../book/<%=b.getPhotoName() %>" height="100" alt=""></td>
	    			<td id="nbook"><%=b.getBookName() %></td>
					<td id="author"><%=b.getAuthor() %></td>
	   				<td id="price"><%=b.getPrice() %></td>
	           		<!-- <td>
		               <form action="" method="post">
		                  <input type="hidden" name="update_quantity_id"  value="" >
		                  <input type="number" name="update_quantity" min="1"  value="" >
		                  <input type="submit" value="update" name="update_update_btn">
		               </form>   
	       			</td> -->
	       			<td id="category"><%=b.getBookCategory() %></td>
	        		<td id="status"><%=b.getStatus() %></td>
	    			<td>
	             		<a href="edit_books.jsp?id=<%=b.getBookId()%>" class="delete-btn"> <i class="fas fa-edit"></i> edit</a>
	       				<a href="../delete?id=<%=b.getBookId()%>" class="delete-btn"> <i class="fas fa-trash"></i> delete</a>
	        		</td>
	    </tr>
	  		
	<%
	  	}
	%>
				<tbody>
				</tbody>
	        </table>
	        <div class="checkout-btn">
	           <a href="" class="btn "> more
	           </a>
	        </div>
		</div>
	 </section>


	<%@include file="footer.jsp" %>
	
    <script src="js/script.js"></script>
</body>