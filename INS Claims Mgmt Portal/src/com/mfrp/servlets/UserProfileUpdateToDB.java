package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.mfrp.beans.UserDetailsBean;
import com.mfrp.bo.UserBO;
import com.mfrp.dao.DAO;


@WebServlet("/member-panel/UserProfileUpdateToDB")
public class UserProfileUpdateToDB extends HttpServlet {
	static final Logger LOGGER = Logger.getLogger(UserProfileUpdateToDB.class);
	private static final long serialVersionUID = 1L;
       
   
    public UserProfileUpdateToDB() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
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
		ub.setUser_insurance_type(request.getParameter("insurance_type"));
		ub.setUser_insured_amount(Integer.parseInt(request.getParameter("insured_amount")));
		ub.setUser_max_claimable_amount(Long.parseLong(request.getParameter("max_claimable_amount")));
		ub.setUser_max_claim_amount(Long.parseLong(request.getParameter("max_claim_amount")));
		/*ub.setUser_password(request.getParameter("user_password"));	*/	
		UserBO ubo = new UserBO();
		boolean success = ubo.UserUpdateProfile(ub);
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		if (success) {
			LOGGER.info("User with ID " + request.getParameter("user_id") + " has successfully updated his/her profile");
			request.setAttribute("success_message", "User updated successfully");
			session.setAttribute("user_name", ub.getUser_id());			
			DAO.closeConnection();
			request.getRequestDispatcher("/member-panel/UserUpdateProfile").forward(request, response);

		}

		else {
			request.setAttribute("user_update_fail", "User updated successfully");
			LOGGER.info("User with ID " + request.getParameter("user_id") + " failed to update his/her profile");
			out.print("<center><div class=\"alert alert-danger voffset2\" id=\"userreg\"><h2>\"Update Failed\"</h2></div></center>");
			DAO.closeConnection();
			request.getRequestDispatcher("/member-panel/UserUpdateProfile").forward(request, response);

		}
	}

}
