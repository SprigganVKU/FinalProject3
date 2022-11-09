package com.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.BookDetails;

public class BookDAOImpl implements BookDAO{

	private Connection conn;
	
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDetails b) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql="insert into book_dtls(bookName,author,price,bookCategory,status,photo,user_email) values (?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, b.getBookName());
			pst.setString(2, b.getAuthor());
			pst.setString(3, b.getPrice());
			pst.setString(4, b.getBookCategory());
			pst.setString(5, b.getStatus());
			pst.setString(6, b.getPhotoName());
			pst.setString(7, b.getEmail());
			
			int rowCount = pst.executeUpdate();
			if(rowCount > 0) {
				f = true;
			}
			//System.out.println(f);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}	
	
	
	public List<BookDetails> getAllBooks() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		
		BookDetails b = null;
		
		try {
			String sql="select *from book_dtls";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	

	public BookDetails getBookById(int id) {
		
		BookDetails b = null;
		
		try {
			String sql="select *from book_dtls where bookId=?";
			PreparedStatement pst = conn.prepareStatement(sql);	
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return b;
	}
	

	public boolean updateEditBooks(BookDetails b) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql="update book_dtls set bookName=?,author=?,price=?,bookCategory=?,status=? where bookId=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, b.getBookName());
			pst.setString(2, b.getAuthor());
			pst.setString(3, b.getPrice());
			pst.setString(4, b.getBookCategory());
			pst.setString(5, b.getStatus());
			pst.setInt(6, b.getBookId());
			
			int rowCount = pst.executeUpdate();	
			if(rowCount > 0) {
				f = true;
			} 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteBooks(int id) {
		boolean f = false;
		
		try {
			String sql="delete from book_dtls where bookId=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			int rowCount = pst.executeUpdate();	
			if(rowCount > 0) {
				f = true;
			} 
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}
	
	public List<BookDetails> getNewBooks(){
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_dtls where bookCategory=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "New");
			pst.setString(2, "Active");
			ResultSet rs = pst.executeQuery();
			int i = 1;
			while(rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
