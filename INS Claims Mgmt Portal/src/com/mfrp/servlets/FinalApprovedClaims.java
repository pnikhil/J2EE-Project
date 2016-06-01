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
* Servlet implementation class ApprovedClaims
*/
@WebServlet("/admin-panel/FinalApprovedClaims")
public class FinalApprovedClaims extends HttpServlet {
       private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalApprovedClaims() {
        super();
        // TODO Auto-generated constructor stub
    }
 
       protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              doPost(request,response);
       }
 
       
       protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       AdminBO adminbo=new AdminBO();      
       request.setAttribute("user_claim", adminbo.ApprovedClaims());
       request.setAttribute("death_claims_for_approved", adminbo.getDeathClaimsForApproved());
       RequestDispatcher d=request.getRequestDispatcher("/admin-panel/final-approved-claims.jsp");
       d.forward(request, response);
             
       }
 
}