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

public class AdminAddCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AdminAddCatController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		CategoryDAO catDAO=new CategoryDAO();
		//ArrayList<Category> listCAT=catDAO.getItemsbyParent_id(0);
		ArrayList<Category> listCAT= catDAO.getItems();
		request.setAttribute("listCat", listCAT);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/cat/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		CategoryDAO categoryDAO=new CategoryDAO();
		String catName=request.getParameter("name");
		int parentId=Integer.parseInt(request.getParameter("category"));
		Category category=new Category(0, catName, parentId);
		if (categoryDAO.addItem(category)>0) {
			response.sendRedirect(request.getContextPath()+"/admin/cat/index?msg=1");
			return;
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/cat/add?msg=0");
			return;
		}
	}
}
