package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

@WebServlet("/FetchDataForAdminEditUser")
public class FetchDataForAdminEditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(FetchData.class);
	public FetchDataForAdminEditUser() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			String insurance_type = String.valueOf(request.getParameter("insurance_type"));
			long insurance_value = Long.parseLong(request.getParameter("insurance_value"));						
			long maximum_claimable_amount = 0;
			if (insurance_type.equals("Home"))
			{
				maximum_claimable_amount = (long) (insurance_value * 0.91);
			}
			else if (insurance_type.equals("Vehicle"))
			{
				maximum_claimable_amount = (long) (insurance_value * 0.80);
			}
			else if (insurance_type.equals("Life"))
			{
					maximum_claimable_amount = insurance_value;
			}
			
			out.print(maximum_claimable_amount);
			

		} catch (Exception e) {		
			LOGGER.error(e);
			System.err.println("Exception in ajax loading data for max_claimable_amount");
			e.printStackTrace();
		}
	}

}