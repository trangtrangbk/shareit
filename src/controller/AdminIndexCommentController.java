package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.bean.Comment;
import model.dao.CategoryDAO;
import model.dao.CommentDAO;
import util.AuthUtil;
import util.DefineUtil;

public class AdminIndexCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexCommentController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		CommentDAO commentDAO=new CommentDAO();
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		// lấy tổng số danh mục
				int numberOfItems= commentDAO.numberOfItems();
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
		ArrayList<Comment> comments= commentDAO.getItemsPagination(offset);
		request.setAttribute("comments", comments);		
		request.setAttribute("numberOfItems", numberOfItems);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/comments/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
