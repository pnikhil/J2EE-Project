package com.mfrp.servlets;

import com.mfrp.bo.AdminBO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class PendingUsers
 */
@WebServlet("/admin-panel/PendingUsers")
public class PendingUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PendingUsers() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		AdminBO adminBO = new AdminBO();
				
		/*boolean success = adminBO.adminLogin(adminb);
		if (success) {
*/
/*			session.setAttribute("admin_name", adminb.getAdmin_name());*/
/*			session.setAttribute("isUserLoggedIn", true);*/
			request.setAttribute("user_details", adminBO.getPendingUsers());
			RequestDispatcher d = request.getRequestDispatcher("/admin-panel/pending-users.jsp");
			d.forward(request, response);
/*		}*/
	}

}
