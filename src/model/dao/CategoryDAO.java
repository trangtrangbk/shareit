package model.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import util.DBConnectionUtil;
import util.DefineUtil;

public class CategoryDAO {
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private PreparedStatement pst=null;
	public ArrayList<Category> getItems() {
		ArrayList<Category> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from cat ORDER BY id DESC";
			st= conn.createStatement();
			rs=st.executeQuery(sql);
			while (rs.next()) {
				Category objDM=new Category(rs.getInt("id"), rs.getString("name"));
				listItem.add(objDM);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}


}
