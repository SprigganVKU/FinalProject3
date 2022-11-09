package com.DAO;

import java.sql.Connection;
import com.entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImpl implements UserDAO{
	
	private Connection conn;
	
	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegister(User us) {
		
		boolean f = false;
		
		try {
			String sql="insert into user(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, us.getName());
			pst.setString(2, us.getEmail());
			pst.setString(3, us.getPhone());
			pst.setString(4, us.getPassword());
			
			int rowCount = pst.executeUpdate();
			if(rowCount > 0) {
				f = true;
			}
	
		} catch (Exception e) {		
			e.printStackTrace();	
		}
		//System.out.println(f);
		
		return f;
	}
	
	public User userLogin(String email, String password) {	
		
		User us = null;
		
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}
}
