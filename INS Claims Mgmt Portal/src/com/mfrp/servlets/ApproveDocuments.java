package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import com.mfrp.bo.UserBO;
import com.mfrp.bo.AdminBO;
import com.mfrp.dao.*;

@WebServlet("/admin-panel/ApproveDocuments")
public class ApproveDocuments extends HttpServlet implements DBQueries {
	static final Logger LOGGER = Logger.getLogger(ApproveDocuments.class);
	private static final long serialVersionUID = 1L;

	public ApproveDocuments() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		String final_approval_date = sdf1.format(c.getTime());
		try {
			Connection con = DAO.getConnection();
			PreparedStatement ps = con.prepareStatement(approvedocuments);
			ps.setInt(1, 2);
			ps.setString(2, final_approval_date);
			ps.setString(3, null);
			ps.setString(4, id);
			ps.executeUpdate();

			String baseurl = request.getContextPath();

			UserBO ubo = new UserBO();
			AdminBO abo = new AdminBO();
			boolean check2 = abo.generateReport(id, baseurl);
			boolean check = ubo.generateReport(id, baseurl);
			if (check == true && check2 == true) {
				/* String url = request.getRequestURL().toString(); */
				LOGGER.info("User Claim documents with Claim Index " + request.getParameter("id") + " has been approved");
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				response.setHeader("Access-Control-Allow-Origin", "*");
				out.print("User Claim Documents Approved!");
			}
		} catch (SQLException e) {
			LOGGER.error(e);
			System.err.println("Exception in Approve Documents ");
		}

	}

}