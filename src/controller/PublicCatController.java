package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.bean.News;
import model.dao.CategoryDAO;
import model.dao.NewsDAO;
import util.DefineUtil;

public class PublicCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDAO;
    public PublicCatController() {
        super();
        categoryDAO=new CategoryDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		int currentPage=1;
		NewsDAO newsDAO=new NewsDAO();
		try {
			currentPage= Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			 currentPage=1;
		}
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/404");
			return;
		}
		Category category=categoryDAO.getItem(id);
		if (category==null) {
			response.sendRedirect(request.getContextPath()+"/404");
			return;
		}
		int numberOfItems=newsDAO.numberOfItems(id);
		int numberOfPages=(int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		if (currentPage > numberOfPages || currentPage <1) {
			currentPage=1;
		}
		int offset= (currentPage-1)* DefineUtil.NUMBER_PER_PAGE;
		ArrayList<News> listNews=newsDAO.getItemsByCatPagination(offset,id);
		request.setAttribute("category", category);
		request.setAttribute("listNews", listNews);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		RequestDispatcher rd=request.getRequestDispatcher("/public/cat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
