package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Contact;
import model.dao.ContactDAO;

public class PublicContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContactDAO contactDAO;
    public PublicContactController() {
        super();
        contactDAO=new ContactDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		//get data
		String name= request.getParameter("aname");
		String email= request.getParameter("aemail");
		String subject= request.getParameter("asubject");
		String message= request.getParameter("amessage");
		Contact contact=new Contact(0, name, email, subject, message);
		System.out.println(contact);
		if (contactDAO.addItem(contact)> 0) {
	  		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:5px\">Gửi liên hệ thành công</span>");
		}else {	
    		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:5px\">Gửi liên hệ thất bại</span>");

		}

	}

}
