package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.bean.News;
import model.bean.User;
import model.dao.CategoryDAO;
import model.dao.NewsDAO;
import util.AuthUtil;
import util.DefineUtil;
import util.FileUtil;
@MultipartConfig
public class AdminAddNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AdminAddNewsController() {
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
		ArrayList<Category> listCAT=catDAO.getItems();
		request.setAttribute("listCat", listCAT);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/news/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		NewsDAO newsDAO=new NewsDAO();
		String newsName=request.getParameter("name");
		String description=request.getParameter("preview");
		String detail=request.getParameter("detail");
		if ("".equals(newsName) || "".equals(description)|| "".equals(detail)) {
			response.sendRedirect(request.getContextPath()+"/admin/news/add?msg=0");
			return;
		}
		int catId=Integer.parseInt(request.getParameter("category"));
		//xử lí upload file
		String fileName=FileUtil.uploadFile(request, "picture", DefineUtil.DIR_UPLOAD);		
		//tạo đối tượng =>viết phương thức insert table
		News news=new News(0, newsName, description, detail, null, fileName, 0, new Category(catId, "", 0), new User(1, "","", "", ""), true);	
		if (newsDAO.addItem(news)>0) {
			response.sendRedirect(request.getContextPath()+"/admin/news/index?msg=1");
			return;
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/news/index?err=0");
			return;
		}
	}
}
