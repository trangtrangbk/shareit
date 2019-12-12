package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.bean.Category;
import model.bean.News;
import model.bean.User;
import model.dao.CategoryDAO;
import model.dao.NewsDAO;
import util.AuthUtil;
import util.DefineUtil;
import util.FileUtil;
@MultipartConfig
public class AdminEditNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsDAO newsDAO;
	public AdminEditNewsController() {
        super();
        newsDAO=new NewsDAO();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		int id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/news/index?err=1");
			return;
		}
		News news= newsDAO.getItem(id);
		if (news==null) {
			response.sendRedirect(request.getContextPath()+"/admin/news/index?err=1");
			return;
		}
		CategoryDAO catDAO=new CategoryDAO();
		ArrayList<Category> listCAT=catDAO.getItems();
		request.setAttribute("listCat", listCAT);
		request.setAttribute("news", news);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/news/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		NewsDAO newsDAO=new NewsDAO();
		//láº¥y cÃ¡c giÃ¡ trá»‹ khÃ´ng pháº£i file
		String newsName=request.getParameter("name");
		String description=request.getParameter("preview");
		String detail=request.getParameter("detail");
		if ("".equals(newsName) || "".equals(description)|| "".equals(detail)) {
			response.sendRedirect(request.getContextPath()+"/admin/news/edit.jsp?msg=0");
			return;
		}
		int catId=0;		
		int id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
			catId=Integer.parseInt(request.getParameter("category"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/news/index?err=3");
			return;
		}
		News news= newsDAO.getItem(id);
		if (news==null) {
			response.sendRedirect(request.getContextPath()+"/admin/news/index?err=3");
			return;
		}
		Part part = request.getPart("picture");
		String filePath = request.getServletContext().getRealPath("")+DefineUtil.DIR_UPLOAD;
		File dirPath = new File(filePath);//táº¡o Ä‘Æ°á»�ng dáº«n chá»©a file
		if (!dirPath.exists()) {//náº¿u chÆ°a tá»“n táº¡i
				dirPath.mkdirs();//táº¡o ra
		}
		String fileName=FileUtil.getName(part);
		String picture="";
		if (fileName.isEmpty()) {
			picture=news.getPicture();
		}
		else picture= FileUtil.rename(fileName);
		filePath = filePath + File.separator + picture;	
		News item=new News(id, newsName, description, detail, null, picture, 0, new Category(catId, "", 0), new User(1, "","", "", ""), true);	
		System.out.println(item);
		if (newsDAO.editItem(item)>0) {
			if (!fileName.isEmpty()) {
				//xoÃ¡ file cÅ©
				String oldFilePartName=filePath + File.separator + news.getPicture();
				File oldFile=new File(oldFilePartName);
				if (oldFile.exists()) {//náº¿u tá»“n táº¡i
					oldFile.delete();
			}
				//ghi file
				part.write(filePath);
			}
			response.sendRedirect(request.getContextPath()+"/admin/news/index?msg=2");
			return;
		}else {
			System.out.println("sai ở đây");
			response.sendRedirect(request.getContextPath()+"/admin/news/index?err=3");
			return;
		}
	
	}
}
