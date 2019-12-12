package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Comment;
import model.bean.News;
import model.dao.CommentDAO;
import model.dao.NewsDAO;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicDetailController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/404");
			return;
		}
		NewsDAO newsDAO=new NewsDAO();
		CommentDAO commentDAO=new CommentDAO();
		News news=newsDAO.getItem(id);
		if (news==null) {
			response.sendRedirect(request.getContextPath()+"/404");
			return;
		}
		//tăng view
		HttpSession session=request.getSession();
		String hasVisited=(String) session.getAttribute("hasvisited: "+id);
		if (hasVisited==null) {
			session.setAttribute("hasvisited: "+id, "yes");
			session.setMaxInactiveInterval(3600);
			newsDAO.increaseView(id);
		}
		ArrayList<News> relatedNews= newsDAO.getRelatedItems(news,3);
		ArrayList<Comment> listComments= commentDAO.getCommentsbyNewsID(id);
		request.setAttribute("news", news);
		request.setAttribute("relatedNews", relatedNews);
		request.setAttribute("listComments", listComments);
		RequestDispatcher rd=request.getRequestDispatcher("/public/detail.jsp");
		rd.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
