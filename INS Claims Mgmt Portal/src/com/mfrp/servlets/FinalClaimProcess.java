package com.mfrp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mfrp.bo.AdminBO;

/**
 * Servlet implementation class FinalClaimProcess
 */
@WebServlet("/admin-panel/FinalClaimProcess")
public class FinalClaimProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FinalClaimProcess() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminBO adminbo = new AdminBO();
		request.setAttribute("final_claim_details", adminbo.finalClaimProcess());
		RequestDispatcher d = request.getRequestDispatcher("/admin-panel/final-claim-process.jsp");
		d.forward(request, response);

	}

}