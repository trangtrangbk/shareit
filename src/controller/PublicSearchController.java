package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.News;
import model.dao.NewsDAO;
import util.DefineUtil;

public class PublicSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicSearchController() {
        super();        
    }
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage=1;
		NewsDAO newsDAO=new NewsDAO();
		try {
			currentPage= Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			 currentPage=1;
		}
		String key= request.getParameter("s");
		int numberOfItems=newsDAO.numberOfItemsbyKeyWord(key);
		int numberOfPages=(int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		if (currentPage > numberOfPages || currentPage <1) {
			currentPage=1;
		}
		int offset= (currentPage-1)* DefineUtil.NUMBER_PER_PAGE;
		ArrayList<News> listNews=newsDAO.getItemsByKeyWord(offset,key);
		request.setAttribute("listNews", listNews);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		RequestDispatcher rd=request.getRequestDispatcher("/public/search.jsp");
		rd.forward(request, response);
	}

}
