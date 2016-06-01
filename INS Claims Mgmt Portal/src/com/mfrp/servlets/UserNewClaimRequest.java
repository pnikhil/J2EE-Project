package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
/*import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;*/
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*import javax.sql.DataSource;*/

import org.apache.log4j.Logger;

import com.mfrp.beans.UserClaimsBean;
import com.mfrp.beans.UserDeathBean;
import com.mfrp.bo.UserBO;
import com.mfrp.dao.DAO;


@WebServlet("/member-panel/UserNewClaimRequest")
public class UserNewClaimRequest extends HttpServlet {
	static final Logger LOGGER = Logger.getLogger(UserNewClaimRequest.class);
	private static final long serialVersionUID = 1L;
/*	public static Connection connection;
	public static DataSource dataSource;*/
   
    public UserNewClaimRequest() {
        super();
       
    }
    
   /* public void init() throws ServletException{  
		 
    	try {
            Context initContext  = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/mfrpdb");    
            try {
				connection = dataSource.getConnection();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
        } catch (NamingException e) {
        	LOGGER.error(e);
        }    	
    }*/
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher d = request.getRequestDispatcher("/index.jsp");
		d.forward(request, response);
    	
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserClaimsBean ucb = new UserClaimsBean();
		UserDeathBean udb = new UserDeathBean();
		
		ucb.setUser_id(request.getParameter("user_id"));
		ucb.setUser_first_name(request.getParameter("user_firstname"));
		ucb.setUser_last_name(request.getParameter("user_lastname"));
		ucb.setUser_nominee_count(Integer.parseInt(request.getParameter("nominee_count")));
		ucb.setUser_max_claim_amount(Long.parseLong(request.getParameter("max_claim_amount")));
		ucb.setUser_insurance_type(request.getParameter("insurance_type"));
		ucb.setRequest_date(request.getParameter("request_date"));
		ucb.setClaim_reason(request.getParameter("claim_reason"));
		ucb.setFinal_claim_amount(Long.parseLong(request.getParameter("final_claim_amount")));
		
		String claim_reason = request.getParameter("claim_reason");
		int nominee_count = Integer.valueOf(request.getParameter("nominee_count"));
		
		if(claim_reason.equalsIgnoreCase("Death"))
		{
			System.out.println("checking death");
			
			udb.setUser_id(request.getParameter("user_id"));
			udb.setDeath_date(request.getParameter("death_date"));
			udb.setDeath_reason(request.getParameter("death_reason"));
			if(nominee_count == 1)
			{
				System.out.println("checking nominee count 1");
				udb.setNominee_1(request.getParameter("nominee_1"));
				
			}
			else if(nominee_count == 2)
			{
				System.out.println("checking nominee count 2");
				udb.setNominee_1(request.getParameter("nominee_1"));
				udb.setNominee_2(request.getParameter("nominee_2"));
				
			}
			else if(nominee_count == 3)
			{
				System.out.println("checking nominee count 3");
				udb.setNominee_1(request.getParameter("nominee_1"));
				udb.setNominee_2(request.getParameter("nominee_2"));
				udb.setNominee_3(request.getParameter("nominee_3"));				
			}
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		UserBO ubo = new UserBO();
		boolean check = ubo.checkClaim(ucb);
		if (check == true) {
			boolean success = ubo.UserNewClaimRequest(ucb,udb);
			if (success)
				if (success) {
					HttpSession session = request.getSession();	
					if (session.getAttribute("user_name") != null) {
					session.setAttribute("user_name", ucb.getUser_id());
					LOGGER.info("User with ID " + request.getParameter("user_id") + " has successfully made a claim");
					request.setAttribute("claim_added", "User claim added successfully");								
					DAO.closeConnection();
				}
					RequestDispatcher d = request.getRequestDispatcher("/member-panel/UserClaimRequest");
					d.forward(request, response);
				}
		}
		else if (check == false){
			HttpSession session = request.getSession();	
			if (session.getAttribute("user_name") != null) {
				session.setAttribute("user_name", ucb.getUser_id());
				request.setAttribute("claim_rejected", "Claim exists");
				LOGGER.info("User with ID " + request.getParameter("user_id") + " tried to request for already existing claim");
				DAO.closeConnection();
			}	
			RequestDispatcher d = request.getRequestDispatcher("/member-panel/UserClaimRequest");
			d.forward(request, response);
		}		

		else {
			LOGGER.info("User with ID " + request.getParameter("user_id") + " failed in requesting claim");
			out.print("<center><div class=\"alert alert-danger voffset2\" id=\"userreg\"><h2>\"Claim Request Failed\"</h2></div></center>");
			DAO.closeConnection();
			RequestDispatcher d = request.getRequestDispatcher("/member-panel/UserClaimRequest");
			d.forward(request, response);

		}
	}

}