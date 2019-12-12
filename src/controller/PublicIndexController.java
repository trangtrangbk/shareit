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

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PublicIndexController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		NewsDAO newsDAO=new NewsDAO();
		System.out.println(request.getServletContext().getRealPath(""));
		ArrayList<News> listNews= newsDAO.getItems();
		request.setAttribute("allListNews", listNews);		
		//lấy 3 danh mục chứa 3 tin trở lên
		ArrayList<Integer> listIDCats= newsDAO.getCats(3);
		//lấy item của mỗi danh mục
		ArrayList<News> list1=newsDAO.getItemsbyCatID(listIDCats.get(0),4);
		ArrayList<News> list2=newsDAO.getItemsbyCatID(listIDCats.get(1),4);
		ArrayList<News> list3=newsDAO.getItemsbyCatID(listIDCats.get(2),4);
		request.setAttribute("ListNews1", list1);	
		request.setAttribute("ListNews2", list2);	
		request.setAttribute("ListNews3", list3);	
		RequestDispatcher rd=request.getRequestDispatcher("/public/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
