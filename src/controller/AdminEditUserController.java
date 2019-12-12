package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.dao.UserDAO;
import util.AuthUtil;
import util.StringUtil;

public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
    public AdminEditUserController() {
        super();
        userDAO=new UserDAO();
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
			response.sendRedirect(request.getContextPath()+"/admin/user/index?err=1");
			return;
		}
		HttpSession session= request.getSession();
		User userLogin= (User) session.getAttribute("userInfo");
		//chỉ admin mới có quyền sửa
		if ("admin".equals(userDAO.getItem(userLogin.getId()).getPosition()) || id==userLogin.getId()) {
			User item= userDAO.getItem(id);
			if (item!=null) {				
				request.setAttribute("user", item);
				RequestDispatcher rd=request.getRequestDispatcher("/admin/user/edit.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect(request.getContextPath()+"/admin/user?err=2");
				return;
			}
		}
		else {
			//khÃ´ng cÃ³ quyá»�n
			response.sendRedirect(request.getContextPath()+"/admin/user?err=5");
			return;
		}
		User item= userDAO.getItem(id);
		request.setAttribute("user", item);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/user/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		int id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/user/index?err=1");
			return;
		}
		HttpSession session= request.getSession();
		User userLogin= (User) session.getAttribute("userInfo");
		//chá»‰ admin má»›i Ä‘Æ°á»£c thÃªm ngÆ°á»�i dÃ¹ng
		if ("admin".equals(userDAO.getItem(userLogin.getId()).getPosition()) || id==userLogin.getId()) {
			//láº¥y láº¡i dá»¯ liá»‡u cÅ©
			User item= userDAO.getItem(id);			
				if (item==null) {
					response.sendRedirect(request.getContextPath()+"/admin/user/index?err=1");
					return;
					}
			String password=request.getParameter("password");
			if (password.equals("")) {
				password=item.getPassword();
			}
			else {
				password=StringUtil.md5(password);
			}
			String fullname=request.getParameter("fullname");
			String position=request.getParameter("position");			
			//dá»¯ liá»‡u má»›i
			item.setPassword(password);
			item.setFullname(fullname);
			item.setPosition(position);
			if (userDAO.editItem(item)>0) {
				response.sendRedirect(request.getContextPath()+"/admin/user/index?msg=2");
				return;
			}else {
				RequestDispatcher rd=request.getRequestDispatcher("/admin/user/edit.jsp?err=1");
				rd.forward(request, response);
				return;
			}
		}
		else {
			//khÃ´ng cÃ³ quyá»�n
			response.sendRedirect(request.getContextPath()+"/admin/user?err=5");
			return;
		}		
	}
}
