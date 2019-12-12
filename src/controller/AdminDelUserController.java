package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.dao.UserDAO;
import util.AuthUtil;

public class AdminDelUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
    public AdminDelUserController() {
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
			response.sendRedirect(request.getContextPath()+"/admin/user/index?err=2");
			return;
		}
		HttpSession session= request.getSession();
		User userLogin= (User) session.getAttribute("userInfo");
		User user= userDAO.getItem(id);
		if ("admin".equals(user.getPosition())) {
			response.sendRedirect(request.getContextPath()+"/admin/user/index?err=6");
			return;
		}else {
			if ("admin".equals(userLogin.getPosition())) {
				//được phép xoá
				if (userDAO.delItem(id)>0) {
					response.sendRedirect(request.getContextPath()+"/admin/user/index?msg=3");
					return;
				}else {
					response.sendRedirect(request.getContextPath()+"/admin/user/index?err=3");
					return;
				}
			}
			else {
				//không được phép xoá
				response.sendRedirect(request.getContextPath()+"/admin/user/index?err=6");
				return;
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
