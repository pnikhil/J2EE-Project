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
 * Servlet implementation class RejectedUserClaims
 */
@WebServlet("/admin-panel/ApprovedUserClaims")
public class ApprovedUserClaimRequests extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ApprovedUserClaimRequests() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminBO adminBO = new AdminBO();
		request.setAttribute("approved_user_claim_details", adminBO.getApprovedClaims());
		request.setAttribute("death_claims_for_approved", adminBO.getDeathClaimsForApproved());
		RequestDispatcher d = request.getRequestDispatcher("/admin-panel/approved-claims.jsp");
		d.forward(request, response);
		
		
	}

}
