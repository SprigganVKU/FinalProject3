package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			UserDAOImpl DAO = new UserDAOImpl(DBConnect.getConn());
			HttpSession session = req.getSession();
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userObj", us);
				resp.sendRedirect("admin/home.jsp");
			}else {
				User us = DAO.userLogin(email, password);
				if(us != null) {
					session.setAttribute("userObj", us);
					resp.sendRedirect("user.jsp");
				}else {
					session.setAttribute("failedMsg", "Email & Password Invalid");
					resp.sendRedirect("login.jsp");
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			
	 
	}
}
