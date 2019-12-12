package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.dao.CategoryDAO;
import util.AuthUtil;

public class AdminEditCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDAO;
    public AdminEditCatController() {
        super();
        categoryDAO=new CategoryDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		int id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/cat/index?err=1");
			return;
		}
		Category item= categoryDAO.getItem(id);
		if (item==null) {
				response.sendRedirect(request.getContextPath()+"/admin/cat/index?err=1");
				return;
		}
		ArrayList<Category> listCAT=categoryDAO.getItems();
		request.setAttribute("listCat", listCAT);
		request.setAttribute("category", item);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/cat/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		int id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/cat/index?err=1");
			return;
		}
		Category item= categoryDAO.getItem(id);
		if (item==null) {
				response.sendRedirect(request.getContextPath()+"/admin/cat/index?err=1");
				return;
		}
		String catName=request.getParameter("name");
		int parentId=Integer.parseInt(request.getParameter("category"));
		item.setName(catName);
		item.setParent_id(parentId);
		if (categoryDAO.editItem(item)>0) {
				response.sendRedirect(request.getContextPath()+"/admin/cat/index?msg=2");
				return;
			}else {
				RequestDispatcher rd=request.getRequestDispatcher("/admin/cat/edit.jsp?err=1");
				rd.forward(request, response);
				return;
			}				
	}

}
