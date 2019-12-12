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

public class AdminAddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
    public AdminAddUserController() {
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
		HttpSession session= request.getSession();
		User userLogin= (User) session.getAttribute("userInfo");
		//chá»‰ admin má»›i Ä‘Æ°á»£c thÃªm ngÆ°á»�i dÃ¹ng
		if (!"admin".equals(userLogin.getPosition())) {
			//khÃ´ng Ä‘Æ°á»£c phÃ©p
			response.sendRedirect(request.getContextPath()+"/admin/user?err=4");
			return;
		}
		RequestDispatcher rd=request.getRequestDispatcher("/admin/user/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		HttpSession session= request.getSession();
		User userLogin= (User) session.getAttribute("userInfo");
		//chá»‰ admin má»›i Ä‘Æ°á»£c thÃªm ngÆ°á»�i dÃ¹ng
				if (!"admin".equals(userLogin.getPosition())) {
					//khÃ´ng Ä‘Æ°á»£c phÃ©p
					response.sendRedirect(request.getContextPath()+"/admin/user?err=4");
					return;
				}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String fullname=request.getParameter("fullname");
		String position=request.getParameter("position");
		if ("".equals(username) || "".equals(password)|| "".equals(fullname)) {
			response.sendRedirect(request.getContextPath()+"/admin/user/add?msg=0");
			return;
		}
		System.out.println(position);
		//Validate dá»¯ liá»‡u Ä‘áº§u vÃ o
		//kiá»ƒm tra username Ä‘Ã£ tá»“n táº¡i chÆ°a
		if (userDAO.hasUser(username)) {
			RequestDispatcher rd=request.getRequestDispatcher("/admin/user/add.jsp?err=2");
			rd.forward(request, response);
			return;
		}
		password=StringUtil.md5(password);
		//táº¡o Ä‘á»‘i tÆ°á»£ng =>viáº¿t phÆ°Æ¡ng thá»©c insert table
		User user=new User(0, username, password, fullname, position);
		if (userDAO.addItem(user)>0) {
			response.sendRedirect(request.getContextPath()+"/admin/user/index?msg=1");
			return;
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("/admin/user/add.jsp?err=1");
			rd.forward(request, response);
			return;
		}
	}

}
