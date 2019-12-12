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
import util.StringUtil;

public class AuthLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AuthLogoutController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		if (session.getAttribute("userInfo")!=null) {
			//xoá session
			session.removeAttribute("userInfo");
			//chuyển hướng
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		response.sendRedirect(request.getContextPath()+"/admin/index");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
