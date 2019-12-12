package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Contact;
import model.bean.User;
import util.DBConnectionUtil;
import util.DefineUtil;

public class ContactDAO {
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private PreparedStatement pst=null;
	public ArrayList<Contact> getItems() {
		ArrayList<Contact> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from contacts ORDER BY id DESC";
			//tạo đối tượng statement
			st= conn.createStatement();
			//thực thi câu lệnh truy vấn
			rs=st.executeQuery(sql);
			while (rs.next()) {
				Contact obj=new Contact(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("subject"), rs.getString("message"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public int delItem(int id) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="delete from contacts where id=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			result=pst.executeUpdate();	
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public int addItem(Contact contact) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="insert into contacts (name,email,subject,message) VALUES (?,?,?,?)";
			pst=conn.prepareStatement(sql);
			pst.setString(1, contact.getName());
			pst.setString(2, contact.getEmail());
			pst.setString(3, contact.getSubject());
			pst.setString(4, contact.getMessage());
			result=pst.executeUpdate();	
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public int numberOfItems() {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select COUNT(*) as count FROM contacts";
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			if (rs.next()) {
				int count=rs.getInt("count");
				return count;
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return 0;
	}
	public ArrayList<Contact> getItemsPagination(int offset) {
		ArrayList<Contact> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from contacts  ORDER BY id DESC LIMIT ?,?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while (rs.next()) {
				Contact obj=new Contact(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("subject"), rs.getString("message"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
}
