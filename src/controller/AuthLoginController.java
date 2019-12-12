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

public class AuthLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
    public AuthLoginController() {
        super();
        userDAO=new UserDAO();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		RequestDispatcher rd=request.getRequestDispatcher("/auth/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		//1.Lấy username, password
		String username=request.getParameter("username");
		String password=request.getParameter("pass");
		//2. Method check login
		System.out.println(username + password);
		User obj=userDAO.checkLoginByUserAndPass(username,password);
		System.out.println(obj);
		//3.xử lí chuyển hướng
		if (obj!=null) {
			session.setAttribute("userInfo", obj);
			response.sendRedirect(request.getContextPath()+"/admin/index");
			return;
		}else {
			response.sendRedirect(request.getContextPath()+"/auth/login.jsp?msg=1");
			return;
		}
		
	}

}
