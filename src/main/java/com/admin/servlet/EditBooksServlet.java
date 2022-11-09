package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/edit_books")

public class EditBooksServlet extends HttpServlet{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	try {
		int id = Integer.parseInt(req.getParameter("id"));
		String bookName = req.getParameter("bookName");
		String authorName = req.getParameter("authorName");
		String price = req.getParameter("price");
		String bookCategory = req.getParameter("bookType");
		String bookStatus = req.getParameter("bookStatus");
		
		
		
		BookDetails b = new BookDetails();
		b.setBookId(id);
		b.setBookName(bookName);
		b.setAuthor(authorName);
		b.setPrice(price);
		b.setBookCategory(bookCategory);
		b.setStatus(bookStatus);
		
		
		BookDAOImpl DAO = new BookDAOImpl(DBConnect.getConn());
		boolean f = DAO.updateEditBooks(b);
		//System.out.println(b);
		//System.out.println(f);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book Update Successfully...");
			resp.sendRedirect("admin/all_books.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on Server");
			resp.sendRedirect("admin/edit_books.jsp");
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}
}
