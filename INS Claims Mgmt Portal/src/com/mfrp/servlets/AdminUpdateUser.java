package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;


import com.mfrp.beans.UserDetailsBean;
import com.mfrp.bo.AdminBO;
import com.mfrp.dao.DAO;

@WebServlet("/admin-panel/AdminUpdateUser")
public class AdminUpdateUser extends HttpServlet {
	static final Logger LOGGER = Logger.getLogger(AdminUpdateUser.class);
	private static final long serialVersionUID = 1L;
	public AdminUpdateUser() {
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		
			
		UserDetailsBean ub = new UserDetailsBean();	
		ub.setUser_id(request.getParameter("user_id"));
		ub.setUser_first_name(request.getParameter("user_firstname"));
		ub.setUser_last_name(request.getParameter("user_lastname"));
		ub.setUser_gender(request.getParameter("user_gender"));
		ub.setUser_dob(request.getParameter("user_dob"));
		ub.setUser_address(request.getParameter("user_address"));
		ub.setUser_contact_no(request.getParameter("user_contact_no"));
		ub.setUser_email(request.getParameter("user_email_address"));
		ub.setUser_nominee_count(Integer.parseInt(request.getParameter("nominee_count")));
		ub.setUser_max_claim_amount(Integer.parseInt(request.getParameter("max_claim_amount")));
		ub.setUser_insurance_type(request.getParameter("insurance_type"));
		ub.setUser_insured_amount(Integer.parseInt(request.getParameter("insured_amount")));
		ub.setUser_max_claimable_amount(Long.parseLong(request.getParameter("max_claimable_amount")));

		AdminBO ubo = new AdminBO();
		boolean success = ubo.adminUserUpdate(ub);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if (success) {
			LOGGER.info("User with ID " + request.getParameter("user_id") + " profile has been updated by Admin");
			request.setAttribute("success_message", "User updated successfully");			
			request.setAttribute("user_name", ub.getUser_id());					
			DAO.closeConnection();
			request.getRequestDispatcher("/admin-panel/AllUsers").forward(request, response);
				
		}

		else {
			LOGGER.info("Admin User profile update with ID " + request.getParameter("user_id") + " has failed");
			request.setAttribute("update_fail_message", "User updated Failed");			
			out.print("<center><div class=\"alert alert-danger voffset2\" id=\"userreg\"><h2>\"Update Failed\"</h2></div></center>");
			DAO.closeConnection();
			request.getRequestDispatcher("/admin-panel/AllUsers").forward(request, response);

		}
	
	}
}
