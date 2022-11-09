package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet{ 
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_project","root","19062003");
				PreparedStatement pst = con.prepareStatement("update user set password = ? where email = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));
	
				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					session.setAttribute("succMsg", "Password change successfully!");
					response.sendRedirect("newPassword.jsp");
				} else {
					session.setAttribute("failedMsg", "Password change failed!");	
					response.sendRedirect("newPassword.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			session.setAttribute("failedMsg", "Please enter the correct re-password!");
			response.sendRedirect("newPassword.jsp");
		}
	}
}
