package com.mfrp.servlets;

import com.mfrp.bo.AdminBO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PendingUsers
 */
@WebServlet("/admin-panel/AllUsers")
public class AllUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AllUsers() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminBO adminBO = new AdminBO();
		@SuppressWarnings("unused")
		HttpSession session = request.getSession();		
		request.setAttribute("approved_user_details", adminBO.getAllUsers());
		RequestDispatcher d = request.getRequestDispatcher("/admin-panel/all-users.jsp");
		d.forward(request, response);

	}

}
