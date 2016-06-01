package com.mfrp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mfrp.bo.AdminBO;

@WebServlet("/admin-panel/PendingClaimsForApproval")
public class PendingClaimsForApproval extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PendingClaimsForApproval() {
		super();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminBO adminBO = new AdminBO();
		request.setAttribute("user_claim_details", adminBO.getPendingClaims());
		request.setAttribute("user_death_details",adminBO.getDeathClaims());
	/*	request.setAttribute("user_death_details", adminBO.getPendingDeathDetails());*/
		RequestDispatcher d = request.getRequestDispatcher("/admin-panel/pending-user-claims.jsp");
		d.forward(request, response);

	}

}