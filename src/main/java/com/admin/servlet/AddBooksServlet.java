package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/add_books")
@MultipartConfig
public class AddBooksServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String bookName = req.getParameter("bookName");
			String authorName = req.getParameter("authorName");
			String price = req.getParameter("price");
			String bookCategory = req.getParameter("bookType");
			String bookStatus = req.getParameter("bookStatus");
			Part bookImage = req.getPart("bookImage");
			String fileName = bookImage.getSubmittedFileName();
			
			BookDetails b = new BookDetails(bookName,authorName,price,bookCategory,bookStatus,fileName,"admin");
			//System.out.println(b);
			
			BookDAOImpl DAO = new BookDAOImpl(DBConnect.getConn());
				
			boolean f = DAO.addBooks(b);
			
			HttpSession session = req.getSession();
			
			if(f) {
				String path = getServletContext().getRealPath("") + "book";
				//System.out.println(path);
				
				File file = new File(path);
				bookImage.write(path + File.separator + fileName);	
				
				session.setAttribute("succMsg", "Book Add Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
}
