package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.mfrp.beans.UserDetailsBean;
import com.mfrp.bo.UserBO;
import com.mfrp.dao.DAO;

@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	static final Logger LOGGER = Logger.getLogger(UserRegistration.class);
	private static final long serialVersionUID = 1L;
	public static Connection connection;
	public static DataSource dataSource;
	public UserRegistration() {
		 super();
	}
	
	 public void init() throws ServletException{  
		 
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
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDetailsBean ub = new UserDetailsBean();
		
		try {
			ub.setUser_id(UserBO.memberIdGenerator());
		} catch (SQLException e) {
			
			LOGGER.error(e);			
		}

		ub.setUser_first_name(request.getParameter("user_firstname"));
		ub.setUser_last_name(request.getParameter("user_lastname"));
		ub.setUser_gender(request.getParameter("user_gender"));
		ub.setUser_address(request.getParameter("user_address"));
		ub.setUser_contact_no(request.getParameter("user_contact_no"));
		ub.setUser_email(request.getParameter("user_email_address"));
		ub.setUser_nominee_count(Integer.parseInt(request.getParameter("nominee_count")));
		ub.setUser_insurance_type(request.getParameter("insurance_type"));
		ub.setUser_insured_amount(Integer.parseInt(request.getParameter("insured_amount")));
		ub.setUser_max_claimable_amount(Long.parseLong(request.getParameter("max_claimable_amount")));
		ub.setUser_password(request.getParameter("user_password"));
		ub.setStatus(null);

		String dat = request.getParameter("user_dob");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		Date date = null;
		try {
			date = sdf2.parse(dat);
			ub.setUser_dob(sdf.format(date).toString());
		} 
		catch (ParseException e1) {			
			LOGGER.error(e1);
		}
		

		long insured_amount = Long.parseLong(request.getParameter("insured_amount"));
		// long max_claimable_amount =
		// Long.parseLong(request.getParameter("max_claimable_amount"));
		String insurance_type = request.getParameter("insurance_type");
		long max_claim_amount = 0;

		sdf.setLenient(false);
		Date d = null;
		try {
			d = sdf2.parse(dat);
		} catch (ParseException e) {
			LOGGER.error(e);
			e.printStackTrace();
		}
		Calendar dob = Calendar.getInstance();
		dob.setTime(d);
		Calendar today = Calendar.getInstance();
		int age = today.get(Calendar.YEAR) - dob.get(Calendar.YEAR);
		if (today.get(Calendar.MONTH) < dob.get(Calendar.MONTH)) {
			age--;
		} else if (today.get(Calendar.MONTH) == dob.get(Calendar.MONTH)
				&& today.get(Calendar.DAY_OF_MONTH) < dob.get(Calendar.DAY_OF_MONTH)) {
			age--;
		}

		if (age >= 18 && age < 35) {
			if (insurance_type.equalsIgnoreCase("Life")) {
				max_claim_amount = (long) (insured_amount * 0.90);
			} else if (insurance_type.equalsIgnoreCase("Home")) {
				max_claim_amount = (long) (insured_amount * 0.84);
			} else if (insurance_type.equalsIgnoreCase("Vehicle")) {

				max_claim_amount = (long) (insured_amount * 0.73);
			}
		}

		else if ((age >= 35 && age < 60)) {
			if (insurance_type.equalsIgnoreCase("Life")) {
				max_claim_amount = (long) (insured_amount * 0.95);
			} else if (insurance_type.equalsIgnoreCase("Home")) {
				max_claim_amount = (long) (insured_amount * 0.88);
			} else if (insurance_type.equalsIgnoreCase("Vehicle")) {
				max_claim_amount = (long) (insured_amount * 0.77);
			}
		}

		else if (age >= 60) {
			if (insurance_type.equalsIgnoreCase("Life"))
				max_claim_amount = (long) (insured_amount * 1.0);
			else if (insurance_type.equalsIgnoreCase("Home"))
				max_claim_amount = (long) (insured_amount * 0.91);
			else if (insurance_type.equalsIgnoreCase("Vehicle"))
				max_claim_amount = (long) (insured_amount * 0.80);
		}

		ub.setUser_max_claim_amount(max_claim_amount);

		UserBO ubo = new UserBO();
		/*
		 * boolean check = ubo.checkUser(ub); if (check == true) {
		 */
		boolean success = ubo.registerUser(ub);
		if (success) {

			response.setContentType("text/html");
			request.setAttribute("userregid", ub.getUser_id());
			// out.print("<center><div class=\"alert alert-warning
			// voffset2\" id=\"userreg\"><h2>You have successfully
			// registered with ID: "+ ub.getUser_id()
			// +"</h2></div></center>");
			// request.getRequestDispatcher("/index.jsp").include(request,
			// response);
			String test = "You have successfully registered with ID: " + ub.getUser_id();
			LOGGER.info("User with ID " + ub.getUser_id() + " has successfully registered on the portal");
			DAO.closeConnection();
			response.sendRedirect(request.getContextPath() + "/index.jsp?val=" + test);
			/* } */
		}

		/*
		 * if (check == false) {
		 * 
		 * response.setContentType("text/html"); PrintWriter out =
		 * response.getWriter(); out.print(
		 * "<center><div class=\"alert alert-danger voffset2\" id=\"userexists\"><h2>User exists</h2></div></center>"
		 * ); DAO.closeConnection();
		 * request.getRequestDispatcher("/index.jsp").include(request,
		 * response);
		 * 
		 * }
		 */ else {
			LOGGER.info("User with ID " + request.getParameter("user_firstname") + " failed to register on the portal");

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(
					"<center><div class=\"alert alert-danger voffset2\" id=\"regfailed\"><h2>Registration Failed</h2></div></center>");
			DAO.closeConnection();
			request.getRequestDispatcher("/index.jsp").include(request, response);

		}

	}
}
