package com.mfrp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mfrp.bo.AdminBO;

@WebServlet("/admin-panel/RejectedUserClaims")
public class RejectedUserClaims extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public RejectedUserClaims() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminBO adminBO = new AdminBO();
		request.setAttribute("rejected_user_claim_details", adminBO.getRejectedClaims());
		RequestDispatcher d = request.getRequestDispatcher("/admin-panel/rejected-claims.jsp");
		d.forward(request, response);
		
		
	}

}
