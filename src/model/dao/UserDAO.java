package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.User;
import util.DBConnectionUtil;
import util.DefineUtil;

public class UserDAO {
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private PreparedStatement pst=null;
	public ArrayList<User> getItems() {
		ArrayList<User> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from user ORDER BY id DESC";
			//tạo đối tượng statement
			st= conn.createStatement();
			//thực thi câu lệnh truy vấn
			rs=st.executeQuery(sql);
			while (rs.next()) {
				User obj=new User(rs.getInt("id"),rs.getString("username"),rs.getString("password"),rs.getString("fullname"), rs.getString("position"));
				listItem.add(obj);
			}
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public int addItem(User user) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="insert into user(username,password,fullname,position) VALUES(?,?,?,?)";
			pst=conn.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getFullname());
			pst.setString(4, user.getPosition());
			result=pst.executeUpdate();
		} catch ( SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public boolean hasUser(String username) {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from user where username=?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			if (rs.next())
				return true;
		} catch ( SQLException e) {
			e.printStackTrace();
		} catch ( Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return false;
	}
	public User getItem(int id) {
		User obj = null;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from user where id=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			if (rs.next()) {
				obj=new User(rs.getInt("id"),rs.getString("username"),rs.getString("password"),rs.getString("fullname"), rs.getString("position"));
			}
		} catch ( SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return obj;
	}
	public int editItem(User item) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="update user set password=?,fullname=?,position=? where id=?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, item.getPassword());
			pst.setString(2, item.getFullname());
			pst.setString(3, item.getPosition());
			pst.setInt(4, item.getId());
			result=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public int delItem(int id) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="delete from user where id=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			result=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public User checkLoginByUserAndPass(String username, String password) {
		System.out.println(username + password);
		User user=null;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="SELECT * from user where username=? and password=?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs=pst.executeQuery();
			if (rs.next()) {
				user=new User(rs.getInt("id"),rs.getString("username"),rs.getString("password"),rs.getString("fullname"), rs.getString("position"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return user;
	}
	public int numberOfItems() {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select COUNT(*) as count FROM user";
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
	public ArrayList<User> getItemsPagination(int offset) {
		ArrayList<User> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from user  ORDER BY id DESC LIMIT ?,?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while (rs.next()) {
				User obj=new User(rs.getInt("id"),rs.getString("username"),rs.getString("password"),rs.getString("fullname"), rs.getString("position"));
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
