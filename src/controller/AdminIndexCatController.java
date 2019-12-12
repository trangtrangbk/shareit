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
import util.DefineUtil;

public class AdminIndexCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDAO;
    public AdminIndexCatController() {
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
		// lấy tổng số danh mục
				int numberOfItems= categoryDAO.numberOfItems();
				int numberOfPages=(int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
				int currentPage= 1;
				try {
					currentPage=Integer.parseInt( request.getParameter("page"));
				} catch (Exception e) {
				}
				if (currentPage > numberOfPages || currentPage <1) {
					currentPage=1;
				}
				int offset= (currentPage-1)* DefineUtil.NUMBER_PER_PAGE;
		ArrayList<Category> categories= categoryDAO.getItemsPagination(offset);
		request.setAttribute("categories", categories);		
		request.setAttribute("numberOfItems", numberOfItems);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/cat/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
