package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Category;
import model.bean.Comment;
import model.bean.News;
import model.bean.User;
import util.DBConnectionUtil;
import util.DefineUtil;

public class CommentDAO {
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private PreparedStatement pst=null;
	public ArrayList<Comment> getItems() {
		ArrayList<Comment> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select c.id,c.email,c.content,c.state,c.news_id,c.date_create,n.name "
					+"from comments as c "
					+"INNER JOIN news as n "
					+"ON c.news_id= n.id "
					+"ORDER BY id DESC";
			st= conn.createStatement();
			rs=st.executeQuery(sql);
			while (rs.next()) {
				News news=new News(rs.getInt("news_id"),rs.getString("n.name"),"","",null,"",0,null,null,true);
				Comment obj=new Comment(rs.getInt("id"), rs.getString("email"), rs.getString("content"), rs.getBoolean("state"),news,rs.getTimestamp("date_create"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public ArrayList<Comment> getCommentsbyNewsID(int id) {
		ArrayList<Comment> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select c.id,c.email,c.content,c.state,c.news_id,c.date_create,n.name "
					+"from comments as c "
					+"INNER JOIN news as n "
					+"ON c.news_id= n.id "
					+"where c.news_id=? && c.state=true "
					+"ORDER BY c.id DESC";
			pst= conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while (rs.next()) {
				News news=new News(rs.getInt("news_id"),rs.getString("n.name"),"","",null,"",0,null,null,true);
				Comment obj=new Comment(rs.getInt("id"), rs.getString("email"), rs.getString("content"), rs.getBoolean("state"),news,rs.getTimestamp("date_create"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public int numberOfItems() {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select COUNT(*) as count FROM comments";
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			if (rs.next()) {
				int count=rs.getInt("count");
				return count;
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//Ä‘Ã³ng káº¿t ná»‘i
			DBConnectionUtil.close(conn,st,rs);
		}
		return 0;
	}
	public ArrayList<Comment> getItemsPagination(int offset) {
		ArrayList<Comment> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select c.id,c.email,c.content,c.state,c.news_id,c.date_create,n.name "
					+"from comments as c "
					+"INNER JOIN news as n "
					+"ON c.news_id= n.id "
					+"ORDER BY c.id DESC LIMIT ?,?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while (rs.next()) {
				News news=new News(rs.getInt("news_id"),rs.getString("n.name"),"","",null,"",0,null,null,true);
				Comment obj=new Comment(rs.getInt("id"), rs.getString("email"), rs.getString("content"), rs.getBoolean("state"),news,rs.getTimestamp("date_create"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//Ä‘Ã³ng káº¿t ná»‘i
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public Comment getItem(int id) {
		Comment comment=null;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select c.id,c.email,c.content,c.state,c.news_id,c.date_create,n.name "
					+"from comments as c "
					+"INNER JOIN news as n "
					+"ON c.news_id= n.id "
					+" where c.id=? "
					+"ORDER BY c.id DESC";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			if (rs.next()) {
				News news=new News(rs.getInt("news_id"),rs.getString("n.name"),"","",null,"",0,null,null,true);
				comment=new Comment(rs.getInt("id"), rs.getString("email"), rs.getString("content"), rs.getBoolean("state"),news,rs.getTimestamp("date_create"));			
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return comment;
	}
	public void active(int id, int i) {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="update comments set state=? where id=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, i);
			pst.setInt(2, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		
	}
	public int addItem(Comment comment) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="insert into comments (email,content,state,news_id) VALUES (?,?,?,?)";
			pst=conn.prepareStatement(sql);
			pst.setString(1, comment.getEmail());
			pst.setString(2, comment.getContent());
			pst.setBoolean(3, comment.isState());
			pst.setInt(4, comment.getNews().getId());
			result=pst.executeUpdate();	
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//Ä‘Ã³ng káº¿t ná»‘i
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
}
