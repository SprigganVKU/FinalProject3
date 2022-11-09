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


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String uname = req.getParameter("name");
			String uemail = req.getParameter("email");
			String upassword = req.getParameter("password");
			String ure_password = req.getParameter("re_password");
			String uphone = req.getParameter("phone");
			String check = req.getParameter("check");
			
			User us = new User();
			us.setName(uname);
			us.setEmail(uemail);
			us.setPassword(upassword);
			us.setPhone(uphone);
			
			HttpSession session = req.getSession();
			
			if(check != null) {
				if(!(upassword.equals(ure_password))) {
					session.setAttribute("failedMsg", "Please enter the correct re-password!");
					resp.sendRedirect("register.jsp");
				}else if(uphone.length() > 10){
					session.setAttribute("failedMsg", "Invalid phone number!");
					resp.sendRedirect("register.jsp");
				}else {
					UserDAOImpl DAO = new UserDAOImpl(DBConnect.getConn());
					boolean f = DAO.userRegister(us);
					
					if(f) {
						session.setAttribute("succMsg", "Registration Successful!");
						resp.sendRedirect("register.jsp");
					}else {
						session.setAttribute("failedMsg", "Something wrong on server!");
						resp.sendRedirect("register.jsp");
					}
				}
			}else {
				session.setAttribute("failedMsg", "Please Check Agree & Terms Condition!");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
