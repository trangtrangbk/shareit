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
import util.StringUtil;

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
				Category objDM=new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"));
				listItem.add(objDM);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public Category getItem(int id) {
		Category category=null;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from cat where id=?";
			pst= conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			if (rs.next()) {
				category=new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"));
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//Ä‘Ã³ng káº¿t ná»‘i
			DBConnectionUtil.close(conn,st,rs);
		}
		return category;
	}
	public ArrayList<Category> getItemsbyParent_id(int id) {
		ArrayList<Category> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from cat where parent_id=? order by id DESC";
			pst= conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category objDM=new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"));
				listItem.add(objDM);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//đóng kết nối
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public int addItem(Category category) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="insert into cat(name,parent_id) VALUES(?,?)";
			pst=conn.prepareStatement(sql);
			pst.setString(1, category.getName());
			pst.setInt(2,category.getParent_id());
			result=pst.executeUpdate();
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//Ä‘Ã³ng káº¿t ná»‘i
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public int delItem(int id) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="delete from cat where id=? or parent_id=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setInt(2, id);
			result=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//Ä‘Ã³ng káº¿t ná»‘i
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public int editItem(Category item) {
		int result=0;
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="update cat set name=?, parent_id=? where id=?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setInt(2, item.getParent_id());
			pst.setInt(3, item.getId());
			result=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//Ä‘Ã³ng káº¿t ná»‘i
			DBConnectionUtil.close(conn,st,rs);
		}
		return result;
	}
	public int numberOfItems() {
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select COUNT(*) as count FROM cat where parent_id=0";
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
	public ArrayList<Category> getItemsPagination(int offset) {
		ArrayList<Category> listItem= new ArrayList<>();
		try {
			conn=DBConnectionUtil.getConnection();
			String sql="select * from cat WHERE parent_id=0 ORDER BY id ASC LIMIT ?,? ";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while (rs.next()) {
				Category objDM=new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"));
				listItem.add(objDM);
			}
			
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {//Ä‘Ã³ng káº¿t ná»‘i
			DBConnectionUtil.close(conn,st,rs);
		}
		return listItem;
	}
	public void ShowCategory(ArrayList<Category> listcat,int parent_id,HttpServletRequest request,HttpServletResponse response, javax.servlet.jsp.JspWriter out) throws IOException {
		CategoryDAO catDAO=new CategoryDAO();
		//lấy danh sách category con
		ArrayList<Category> list= catDAO.getItemsbyParent_id(parent_id);
		if (list.size()>0) {
			out.println("<ul>");
			for (Category item:list) {
				listcat.remove(item);
				out.println("<li class=\"\" style=\"margin-left: 20px;\">"+item.getName()+
						"<a href="+request.getContextPath() +"/admin/cat/edit?id="+item.getId() +" ><i class=\"fa fa-edit \"></i></a>\r\n" + 
						"<a href="+request.getContextPath() +"/admin/cat/del?id="+item.getId() +"  onclick=\"return confirm('Bạn có chắc muốn xoá?')\"><i class=\"fas fa-trash-alt\"></i></a>");
				ShowCategory(listcat, item.getId(), request, response,out);
				out.println("</li>");
			}
			out.println("</ul>");
		}
	}
	public void ShowCategoryPublic(ArrayList<Category> listcat,int parent_id,HttpServletRequest request,HttpServletResponse response, javax.servlet.jsp.JspWriter out) throws IOException {
		CategoryDAO catDAO=new CategoryDAO();
		//lấy danh sách category con
		ArrayList<Category> list= catDAO.getItemsbyParent_id(parent_id);		
		if (list.size()>0) {
			out.println("<ul>");
			for (Category item:list) {
				listcat.remove(item);
				out.println("<li class=\"cat-item cat-item-40\" style=\"margin-left: 20px;\"><a href="+request.getContextPath()+"/danh-muc/"+StringUtil.makeSlug(item.getName())+"-"+item.getId()+" >"+item.getName() +"</a>	");	
				ShowCategoryPublic(listcat, item.getId(), request, response,out);
				out.println("</li>");
			}
			out.println("</ul>");
		}
	}
}
