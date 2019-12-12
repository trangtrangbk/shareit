package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.News;
import model.dao.NewsDAO;

public class AdminActiveNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminActiveNewsController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		int id=0;
		try {
			id= Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/news/index?err=1");
			return;
		}
		NewsDAO newsDAO=new NewsDAO();
		News item= newsDAO.getItem(id);
		if (item!=null) {
			if (item.isState())
				{newsDAO.active(id,0);}
			else { newsDAO.active(id,1);}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
