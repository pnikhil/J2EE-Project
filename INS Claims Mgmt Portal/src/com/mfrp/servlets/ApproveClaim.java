package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.mfrp.dao.*;

/**
 * Servlet implementation class ApproveClaims
 */
@WebServlet("/admin-panel/ApproveClaim")
public class ApproveClaim extends HttpServlet implements DBQueries{
	static final Logger LOGGER = Logger.getLogger(ApproveClaim.class);
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApproveClaim() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		// System.out.println(id);

		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(approveclaim);
			ps.setString(1, "Approved");
			ps.setString(2, id);
			ps.executeUpdate();
			LOGGER.info("User Claim request with Claim Index " + request.getParameter("id") + " has been approved");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			response.setHeader("Access-Control-Allow-Origin", "*");
			out.print("Dear Admin, User Claim is approved");

		} catch (SQLException e) {
			LOGGER.error(e);
			System.err.println("Exception in Approve Claims ");
		}
	}

}