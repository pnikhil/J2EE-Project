package com.mfrp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mfrp.bo.AdminBO;

@WebServlet("/admin-panel/RejectedUsers")
public class RejectedUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RejectedUsers() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminBO adminBO = new AdminBO();
		@SuppressWarnings("unused")
		HttpSession session = request.getSession();		
		request.setAttribute("rejected_user_details", adminBO.getRejectedUsers());
		RequestDispatcher d = request.getRequestDispatcher("/admin-panel/rejected-users.jsp");
		d.forward(request, response);

	}

}
