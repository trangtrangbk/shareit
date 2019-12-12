package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Comment;
import model.bean.Contact;
import model.bean.News;
import model.dao.CommentDAO;
import model.dao.ContactDAO;
import model.dao.NewsDAO;

public class PublicCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentDAO commentDAO;
    public PublicCommentController() {
        super();
        commentDAO=new CommentDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		NewsDAO newsDAO=new NewsDAO();
		PrintWriter out=response.getWriter();
		//get data
		String email= request.getParameter("aemail");
		String message= request.getParameter("amessage");
		int news_id=Integer.parseInt(request.getParameter("anews_id"));		
		News news=newsDAO.getItem(news_id);
		Comment comment=new Comment(0, email, message, false, news, null);
		System.out.println(comment);
		if (commentDAO.addItem(comment)> 0) {
	  		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:5px\">Gửi bình luận thành công, admin đang duyệt bình luận của bạn</span>");
		}else {	
    		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:5px\">Gửi bình luận thất bại</span>");

		}

	}

}
