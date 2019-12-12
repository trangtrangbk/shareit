package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Category;
import model.bean.News;
import model.bean.User;
import util.DBConnectionUtil;
import util.DefineUtil;

public class NewsDAO {
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private PreparedStatement pst=null;
	public ArrayList<News> getItems(int number) {
		ArrayList<News> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName "
					+ "from new AS n "
					+ "INNER JOIN cat AS c "
					+ "ON n.cat_id=c.id "
					+ "INNER JOIN user  AS u "
					+ "ON n.user_id=u.id where state=true "
					+ "ORDER BY n.id DESC LIMIT ?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, number);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category category=new Category(rs.getInt("n.cat_id"), rs.getString("catName"),0);
				User user=new User(rs.getInt("n.user_id"), rs.getString("u.username"), "", "", "");
				News obj=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category,user,rs.getBoolean("state"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public ArrayList<News> getItems() {
		ArrayList<News> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName "
					+ "from new AS n "
					+ "INNER JOIN cat AS c "
					+ "ON n.cat_id=c.id "
					+ "INNER JOIN user  AS u "
					+ "ON n.user_id=u.id where state=true "
					+ "ORDER BY n.id DESC";
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while (rs.next()) {
				Category category=new Category(rs.getInt("n.cat_id"), rs.getString("catName"),0);
				User user=new User(rs.getInt("n.user_id"), rs.getString("u.username"), "", "", "");
				News obj=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category,user,rs.getBoolean("state"));
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
			String sql="select COUNT(*) as count FROM new";
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
	public ArrayList<News> getItemsPagination(int offset) {
		ArrayList<News> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName,c.parent_id "
					+ "from new AS n "
					+ "INNER JOIN cat AS c "
					+ "ON n.cat_id=c.id "
					+ "INNER JOIN user  AS u "
					+ "ON n.user_id=u.id  ORDER BY n.id DESC LIMIT ?,?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category category=new Category(rs.getInt("n.cat_id"), rs.getString("catName"), rs.getInt("parent_id"));
				User user=new User(rs.getInt("n.user_id"), rs.getString("u.username"), "", "", "");
				News obj=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category, user, rs.getBoolean("n.state"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public int addItem(News news) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="insert into new(name,preview_text,detail_text,picture,cat_id,user_id,state) VALUES(?,?,?,?,?,?,?)";
			pst=conn.prepareStatement(sql);
			pst.setString(1, news.getName());
			pst.setString(2, news.getPreview_text());
			pst.setString(3, news.getDetail_text());
			pst.setString(4, news.getPicture());
			pst.setInt(5, news.getCat().getId());
			pst.setInt(6, news.getUser().getId());
			pst.setBoolean(7, news.isState());
			result=pst.executeUpdate();
		} catch ( SQLException e) {
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
			String sql="delete from new where id=?";
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
	public News getItem(int id) {
		News news=null;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName,c.parent_id " + 
					" from new AS n " + 
					" INNER JOIN cat AS c " + 
					" ON n.cat_id=c.id " + 
					" INNER JOIN user  AS u " + 
					" ON n.user_id=u.id  where n.id=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			if (rs.next()) {
				Category category=new Category(rs.getInt("cat_id"), rs.getString("catName"), 1);				
				news=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category, new User(rs.getInt("user_id"), rs.getString("u.username"), "", "", ""), rs.getBoolean("state"));
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return news;
	}
	public int editItem(News item) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="update new set name=?,preview_text=?,detail_text=?,picture=?,cat_id=?,user_id=?,state=? where id=?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getPreview_text());
			pst.setString(3, item.getDetail_text());
			pst.setString(4, item.getPicture());
			pst.setInt(5, item.getCat().getId());
			pst.setInt(6, item.getUser().getId());
			pst.setBoolean(7, item.isState());
			pst.setInt(8, item.getId());
			result=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public void active(int id, int b) {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="update new set state=? where id=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, b);
			pst.setInt(2, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		
	}
	public ArrayList<Integer> getCats(int i) {
		ArrayList<Integer> listIDCat= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="SELECT cat_id FROM new group by cat_id HAVING COUNT(cat_id)>=2 ORDER by cat_id ASC LIMIT ?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, i);
			rs=pst.executeQuery();
			while (rs.next()) {
				listIDCat.add(rs.getInt("cat_id"));
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listIDCat;
	}
	public ArrayList<News> getItemsbyCatID(int id,int number) {
		ArrayList<News> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName "
					+ "from new AS n "
					+ "INNER JOIN cat AS c "
					+ "ON n.cat_id=c.id "
					+ "INNER JOIN user  AS u "
					+ "ON n.user_id=u.id where state=true && cat_id=? "
					+ "ORDER BY n.id DESC LIMIT ?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setInt(2, number);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category category=new Category(rs.getInt("n.cat_id"), rs.getString("catName"),0);
				User user=new User(rs.getInt("n.user_id"), rs.getString("u.username"), "", "", "");
				News obj=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category,user,rs.getBoolean("state"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public ArrayList<News> getItemsbyCatID(int id) {
		ArrayList<News> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName "
					+ "from new AS n "
					+ "INNER JOIN cat AS c "
					+ "ON n.cat_id=c.id "
					+ "INNER JOIN user  AS u "
					+ "ON n.user_id=u.id where state=true &&(cat_id=? or parent_id=?) "
					+ "ORDER BY n.id DESC ";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setInt(2, id);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category category=new Category(rs.getInt("n.cat_id"), rs.getString("catName"),0);
				User user=new User(rs.getInt("n.user_id"), rs.getString("u.username"), "", "", "");
				News obj=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category,user,rs.getBoolean("state"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public ArrayList<News> getRelatedItems(News news, int i) {
		ArrayList<News> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();		
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName "
					+ "from new AS n "
					+ "INNER JOIN cat AS c "
					+ "ON n.cat_id=c.id "
					+ "INNER JOIN user  AS u "
					+ "ON n.user_id=u.id  "
					+"Where n.cat_id=? && n.id!=?&& state=true ORDER BY n.id DESC LIMIT ?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, news.getCat().getId());
			pst.setInt(2, news.getId());
			pst.setInt(3, i);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category category=new Category(rs.getInt("n.cat_id"), rs.getString("catName"),0);
				User user=new User(rs.getInt("n.user_id"), rs.getString("u.username"), "", "", "");
				News obj=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category,user,rs.getBoolean("state"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public int numberOfItems(int cat_id) {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select COUNT(*) as count FROM news as n INNER JOIN cat as c ON n.cat_id=c.id where (cat_id=? or parent_id=?)&& state=true";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, cat_id);
			pst.setInt(2, cat_id);
			rs=pst.executeQuery();
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
	public ArrayList<News> getItemsByCatPagination(int offset, int id) {
		ArrayList<News> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName,c.parent_id "
					+ "from new AS n "
					+ "INNER JOIN cat AS c "
					+ "ON n.cat_id=c.id "
					+ "INNER JOIN user  AS u "
					+ "ON n.user_id=u.id where state=true &&(n.cat_id=? or c.parent_id=?) "
					+ "ORDER BY n.id DESC LIMIT ?,?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setInt(2, id);
			pst.setInt(3, offset);
			pst.setInt(4, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category category=new Category(rs.getInt("n.cat_id"), rs.getString("catName"),0);
				User user=new User(rs.getInt("n.user_id"), rs.getString("u.username"), "", "", "");
				News obj=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category,user,rs.getBoolean("state"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public ArrayList<News> getItemsByKeyWord(int offset, String key) {
		ArrayList<News> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String tmp="%"+key+"%";
			String sql="select n.id,n.name AS newsName,n.preview_text,n.detail_text,n.date_create,n.picture,n.counter,n.cat_id,n.user_id,n.state,u.username,c.name AS catName,c.parent_id "
					+ "from new AS n "
					+ "INNER JOIN cat AS c "
					+ "ON n.cat_id=c.id "
					+ "INNER JOIN user  AS u "
					+ "ON n.user_id=u.id where state=true &&(n.name LIKE \""+tmp+"\" ) "
					+ "ORDER BY n.id DESC LIMIT ?,?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category category=new Category(rs.getInt("n.cat_id"), rs.getString("catName"),0);
				User user=new User(rs.getInt("n.user_id"), rs.getString("u.username"), "", "", "");
				News obj=new News(rs.getInt("id"), 
						rs.getString("newsName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getTimestamp("date_create"),
						rs.getString("picture"),
						rs.getInt("counter"),category,user,rs.getBoolean("state"));
				listItem.add(obj);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public int numberOfItemsbyKeyWord(String key) {
		try {
			conn=DBConnectionUtil.getConnection();
			String tmp="%"+key+"%";
			String sql="select COUNT(*) as count FROM new as n where state=true &&(n.name LIKE \""+tmp+"\" ) ";
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
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
	public void increaseView(int id) {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="update new set counter=counter+1 where id=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}	
		
	}
	
}
