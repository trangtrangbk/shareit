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
}
